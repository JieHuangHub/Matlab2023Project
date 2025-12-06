%% ===============================================================
%  CartPole (Simscape, Continuous) — DDPG 训练/仿真脚本
%  参数与结构保持不变
%% ===============================================================

clear; clc; rng(0);

%% 1) 环境与基本设置
mdl = "CarPoleSW";
open_system(mdl)

agentBlock = mdl + "/RL Agent";   % ← 你的模型里这个 block 的路径

obsDim  = 5;                        % 例如 [sinθ,cosθ,θdot,x,dx] 就是 5
obsInfo = rlNumericSpec([obsDim 1], Name="observations");

Umax    = 15;                       % 你的力上限（例子）
actInfo = rlNumericSpec([1 1], ...
    LowerLimit=-Umax, UpperLimit=Umax, Name="force");

% 显式把规格传给环境（不会再去找工作区的 agent 变量）
env = rlSimulinkEnv(mdl, agentBlock, obsInfo, actInfo);

obsInfo = getObservationInfo(env);
actInfo = getActionInfo(env);

Ts = 0.02;
Tf = 25;
maxsteps = ceil(Tf/Ts);

%% 2) Critic: Q(s,a)
% 状态支路
statePath = [
    featureInputLayer(prod(obsInfo.Dimension), Name="NetObsInLayer")
    fullyConnectedLayer(256)  % 128 -> 256
    reluLayer
    fullyConnectedLayer(400, Name="sPathOut")]; % 200 -> 400

% 动作支路
actionPath = [
    featureInputLayer(prod(actInfo.Dimension), Name="NetActInLayer")
    fullyConnectedLayer(400, Name="aPathOut", BiasLearnRateFactor=0)];  % 200- > 400

% 融合 + 输出
commonPath = [
    additionLayer(2, Name="add")
    reluLayer
    fullyConnectedLayer(1, Name="CriticOutput")];

% 组网并连接
criticNetwork = layerGraph(statePath);
criticNetwork = addLayers(criticNetwork, actionPath);
criticNetwork = addLayers(criticNetwork, commonPath);
criticNetwork = connectLayers(criticNetwork, "sPathOut", "add/in1");
criticNetwork = connectLayers(criticNetwork, "aPathOut", "add/in2");

% 转为 dlnetwork 并封装
criticNetwork = dlnetwork(criticNetwork);
summary(criticNetwork);

% plot(criticNetwork);

critic = rlQValueFunction(criticNetwork, ...
    obsInfo, actInfo, ...
    ObservationInputNames="NetObsInLayer", ...
    ActionInputNames="NetActInLayer", ...
    UseDevice="gpu");

%% 3) Actor: a = μ(s)
actorNetwork = [
    featureInputLayer(prod(obsInfo.Dimension))
    fullyConnectedLayer(128)
    reluLayer
    fullyConnectedLayer(200)
    reluLayer
    fullyConnectedLayer(prod(actInfo.Dimension))
    tanhLayer
    scalingLayer(Scale=max(actInfo.UpperLimit))];
actorNetwork = dlnetwork(actorNetwork);
summary(actorNetwork);

actor = rlContinuousDeterministicActor(actorNetwork, ...
    obsInfo, actInfo, UseDevice="gpu");

%% 4) 优化器与 Agent 选项（保持不变）
criticOptions = rlOptimizerOptions(LearnRate=1e-04, GradientThreshold=1); % critic > actor
actorOptions  = rlOptimizerOptions(LearnRate=5e-04, GradientThreshold=1);

agentOptions = rlDDPGAgentOptions( ...
    SampleTime=Ts, ...
    ActorOptimizerOptions=actorOptions, ...
    CriticOptimizerOptions=criticOptions, ...
    ExperienceBufferLength=1e6, ...
    MiniBatchSize=256);
agentOptions.NoiseOptions.Variance = 0.6;
agentOptions.NoiseOptions.VarianceDecayRate = 1e-5;

agent = rlDDPGAgent(actor, critic, agentOptions);

%% 5) 训练选项（保持不变）
maxepisodes = 2000;
trainingOptions = rlTrainingOptions( ...
    MaxEpisodes=maxepisodes, ...
    MaxStepsPerEpisode=maxsteps, ...
    ScoreAveragingWindowLength=50, ...
    Verbose=false, ...
    Plots="training-progress", ...
    StopTrainingCriteria="AverageReward", ...
    StopTrainingValue=-100, ...
    SaveAgentCriteria="EpisodeReward", ...
    SaveAgentValue=-200);

%% 6) 训练或加载（仅修正赋值逻辑，不改参数）
doTraining = false;

if doTraining
    trainingStats = train(agent, env, trainingOptions);
else
    % 加载预训练 agent 并覆盖
    S = load("Agent238", "saved_agent");
    agent = S.saved_agent;   % 关键：覆盖当前 agent
end

%% 7) 仿真
simOptions = rlSimulationOptions(MaxSteps=1500);
experience = sim(env, agent, simOptions);

