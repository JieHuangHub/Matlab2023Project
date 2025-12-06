function cartpole_rl_sac_2023b()
%% ========= 0) 物理与训练参数 =========
P.m  = 0.5;     % 摆杆质量 [kg]
P.M  = 0.5;     % 车体质量 [kg]
P.l  = 0.3;     % 转轴到杆质心距离 [m]
P.g  = 9.81;    % 重力 [m/s^2]
P.bw = 1e-5;    % 轮阻尼
P.bj = 1e-5;    % 关节阻尼

Ts   = 0.02;    % 强化学习交互步长 (50 Hz)
intSteps = 5;   % 每步内积分子步(数值更稳): h = Ts/intSteps

Fmax = 15;                 % 最大推力 [N]（可调 10~30）
x_limit = 2.4;             % 轨道边界 [m]
theta_fail = deg2rad(45);  % 失败阈值（相对竖直±45°）

% 奖励权重（可调）
W.x   = 1.0;
W.th  = 6.0;   % 角度惩罚略重
W.dx  = 0.05;
W.dth = 0.10;
W.u   = 0.001; % 控制能量惩罚
bonus_close   = 2.0;
bonus_thresh  = deg2rad(5);

% 训练设置
maxStepsPerEpisode = 1200;   % 24 s/回合
numEpisodes        = 1000;   % 回合数
init.q0_deg    = -15;        % 你的初始角度
init.q0_jitter = 8;          % ±8° 抖动增强泛化

rng(0);

%% ========= 1) 构造函数式环境 =========
obsInfo = rlNumericSpec([4 1], ...
    "LowerLimit", -inf(4,1), "UpperLimit", inf(4,1));
obsInfo.Name = "state";   % [x; th; dx; dth]

% 动作先在 [-1,1]，在 step() 里映射为物理力 [-Fmax,Fmax]
actInfo = rlNumericSpec([1 1], "LowerLimit",-1, "UpperLimit", 1);
actInfo.Name = "uScaled";

StepHandle  = @(act,logSig) localStep(act,logSig,P,Ts,intSteps, ...
                                      Fmax,x_limit,theta_fail, ...
                                      W,bonus_close,bonus_thresh);
ResetHandle = @() localReset(P,init);

env = rlFunctionEnv(obsInfo, actInfo, StepHandle, ResetHandle);

%% ========= 2) 搭建 SAC 智能体（R2023b 新 API） =========
% ===== 2.1 Actor（高斯策略，均值/标准差两个头）=====
actorLG = layerGraph();
actorLG = addLayers(actorLG, featureInputLayer(4, "Name","state"));
actorLG = addLayers(actorLG, fullyConnectedLayer(128,"Name","af1"));
actorLG = addLayers(actorLG, reluLayer("Name","ar1"));
actorLG = addLayers(actorLG, fullyConnectedLayer(128,"Name","af2"));
actorLG = addLayers(actorLG, reluLayer("Name","ar2"));

% 均值头：tanh 保证均值 ∈ [-1,1]
actorLG = addLayers(actorLG, fullyConnectedLayer(1,"Name","mu_fc"));
actorLG = addLayers(actorLG, tanhLayer("Name","mu_tanh")); 

% 标准差头：softplus 保证为正（>0）
actorLG = addLayers(actorLG, fullyConnectedLayer(1,"Name","std_fc"));
actorLG = addLayers(actorLG, softplusLayer("Name","sigma"));

% 连接
actorLG = connectLayers(actorLG,"state","af1");
actorLG = connectLayers(actorLG,"af1","ar1");
actorLG = connectLayers(actorLG,"ar1","af2");
actorLG = connectLayers(actorLG,"af2","ar2");
actorLG = connectLayers(actorLG,"ar2","mu_fc");
actorLG = connectLayers(actorLG,"mu_fc","mu_tanh");
actorLG = connectLayers(actorLG,"ar2","std_fc");
actorLG = connectLayers(actorLG,"std_fc","sigma");

actorNet = dlnetwork(actorLG);

% 关键：这里的参数名要用 ActionStandardDeviationOutputNames
actor = rlContinuousGaussianActor( ...
    actorNet, obsInfo, actInfo, ...
    "ObservationInputNames","state", ...
    "ActionMeanOutputNames","mu_tanh", ...
    "ActionStandardDeviationOutputNames","sigma");

actorOpts = rlOptimizerOptions( ...
    "LearnRate",1e-4, "GradientThreshold",1);

% 2.2 双 Q Critic（SAC 需要两路 Q）
criticLG = layerGraph();
criticLG = addLayers(criticLG, featureInputLayer(4,"Name","state"));
criticLG = addLayers(criticLG, featureInputLayer(1,"Name","action"));
criticLG = addLayers(criticLG, concatenationLayer(1,2,"Name","concat"));
criticLG = addLayers(criticLG, fullyConnectedLayer(256,"Name","cf1"));
criticLG = addLayers(criticLG, reluLayer("Name","cr1"));
criticLG = addLayers(criticLG, fullyConnectedLayer(256,"Name","cf2"));
criticLG = addLayers(criticLG, reluLayer("Name","cr2"));
criticLG = addLayers(criticLG, fullyConnectedLayer(1,"Name","Qout"));

criticLG = connectLayers(criticLG,"state","concat/in1");
criticLG = connectLayers(criticLG,"action","concat/in2");
criticLG = connectLayers(criticLG,"concat","cf1");
criticLG = connectLayers(criticLG,"cf1","cr1");
criticLG = connectLayers(criticLG,"cr1","cf2");
criticLG = connectLayers(criticLG,"cf2","cr2");
criticLG = connectLayers(criticLG,"cr2","Qout");

criticNet1 = dlnetwork(criticLG);
criticNet2 = dlnetwork(criticLG); % 结构相同，参数独立

critic1 = rlQValueFunction(criticNet1, obsInfo, actInfo, ...
    "ObservationInputNames","state", "ActionInputNames","action");
critic2 = rlQValueFunction(criticNet2, obsInfo, actInfo, ...
    "ObservationInputNames","state", "ActionInputNames","action");

criticOpts = rlOptimizerOptions( ...
    "LearnRate",1e-3, "GradientThreshold",1);

% ===== 2.3 组装 SAC Agent（R2023b 正确写法）=====
% 先定义优化器超参
actorOpts  = rlOptimizerOptions("LearnRate",1e-4, "GradientThreshold",1);
criticOpts = rlOptimizerOptions("LearnRate",1e-3, "GradientThreshold",1);

% SAC 选项
agentOpts = rlSACAgentOptions( ...
    "SampleTime",Ts, ...
    "ExperienceBufferLength",1e6, ...
    "MiniBatchSize",256, ...
    "TargetSmoothFactor",1e-3, ...
    "DiscountFactor",0.99);

% 把优化器选项放进 agentOpts（而不是当作独立实参）
agentOpts.ActorOptimizerOptions  = actorOpts;
agentOpts.CriticOptimizerOptions = criticOpts;

% 自动温度(熵系数)更新速率
agentOpts.EntropyWeightOptions.LearnRate = 3e-4;

% 正确的构造函数：仅 3 个参数
agent = rlSACAgent(actor, [critic1 critic2], agentOpts);

%% ========= 3) 训练 =========
% —— 自动保存目录 —— 
saveDir = "saved_agents";
if ~exist(saveDir, "dir"); mkdir(saveDir); end

trainOpts = rlTrainingOptions( ...
    "MaxEpisodes",                 numEpisodes, ...
    "MaxStepsPerEpisode",          maxStepsPerEpisode, ...
    "StopTrainingCriteria",        "AverageReward", ...
    "StopTrainingValue",           500, ...
    "ScoreAveragingWindowLength",  50, ...
    "SaveAgentCriteria",           "EpisodeReward", ...   % 触发条件：单回合回报
    "SaveAgentValue",              500, ...               % 超过 500 就保存
    "SaveAgentDirectory",          saveDir, ...
    "Verbose",                     true, ...
    "Plots",                       "training-progress");

trainingStats = train(agent, env, trainOpts); %#ok<NASGU>

save agent_cartpole_sac.mat agent

% 简单测试
Ntest = 5; R = zeros(Ntest,1);
for k = 1:Ntest
    [obs,log] = env.reset();
    done = false; ret = 0;
    while ~done
        act = getAction(agent, obs);
        [obs,rew,done,log] = env.step(act,log);
        ret = ret + rew;
    end
    R(k) = ret;
end
fprintf("Test average return = %.1f\n", mean(R));
end


%% ===== 环境 Step =====
function [Observation,Reward,IsDone,LoggedSignal] = localStep(Action,LoggedSignal,P,Ts,intSteps, ...
    Fmax,x_limit,theta_fail,W,bonus_close,bonus_thresh)

% 动作缩放到实际力
u = max(-1, min(1, Action));    % 保险裁剪
Fx = Fmax * u;

% 当前状态
x  = LoggedSignal.x;
th = LoggedSignal.th;   % 0 = 竖直向上
dx = LoggedSignal.dx;
dth= LoggedSignal.dth;

% 数值积分推进
h = Ts/intSteps;
for i = 1:intSteps
    s  = [x; th; dx; dth];
    ds = cartDyn(s, Fx, P);
    s  = s + h * ds;
    x  = s(1);
    th = wrapToPiLocal(s(2));
    dx = s(3);
    dth= s(4);
end

% 终止条件
IsDone = abs(x) > x_limit || abs(th) > theta_fail;

% 奖励：二次惩罚 + 接近竖直奖励
stateCost = W.x*x^2 + W.th*th^2 + W.dx*dx^2 + W.dth*dth^2 + W.u*(Fx/Fmax)^2;
Reward = -stateCost;
if abs(th) < bonus_thresh && abs(dx) < 0.3 && abs(dth) < 0.5
    Reward = Reward + bonus_close;
end
if IsDone
    Reward = Reward - 10;
end

Observation = [x; th; dx; dth];
LoggedSignal.x   = x;
LoggedSignal.th  = th;
LoggedSignal.dx  = dx;
LoggedSignal.dth = dth;
LoggedSignal.u   = Fx;
end


%% ===== 环境 Reset =====
function [InitialObservation, LoggedSignal] = localReset(P,init)
x0   = 0;
th0  = deg2rad(init.q0_deg + init.q0_jitter*(2*rand-1));
dx0  = 0;
dth0 = 0;

InitialObservation = [x0; th0; dx0; dth0];
LoggedSignal.x   = x0;
LoggedSignal.th  = th0;
LoggedSignal.dx  = dx0;
LoggedSignal.dth = dth0;
LoggedSignal.u   = 0;
end


%% ===== 连续动力学（小车-倒立摆） =====
% 状态 s = [x; th; dx; dth], th=0 为竖直向上
function ds = cartDyn(s, Fx, P)
x   = s(1); %#ok<NASGU>
th  = s(2);
dx  = s(3);
dth = s(4);

m = P.m; M = P.M; l = P.l; g = P.g;
bw = P.bw; bj = P.bj;

c = cos(th); st = sin(th);
den = M + m*st^2;

xdd  = (Fx - bw*dx + m*st*(l*dth^2 + g*c)) / den;
thdd = (-Fx*c + bw*dx*c - m*l*dth^2*st*c - (M+m)*g*st + bj*dth) / (l*den);

ds = [dx; dth; xdd; thdd];

if ~isfinite(thdd) || ~isfinite(xdd)
    ds = [0;0;0;0];
end
end


%% ===== 无工具箱依赖的角度封装 [-pi,pi) =====
function ang = wrapToPiLocal(ang)
ang = mod(ang + pi, 2*pi) - pi;
end
