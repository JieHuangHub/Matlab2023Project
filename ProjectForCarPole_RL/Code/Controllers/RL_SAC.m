%% ===============================================================
%  CartPole (Simscape, Continuous) — SAC 训练/仿真脚本
%  参数与结构保持不变
%% ===============================================================

clear; clc; rng(0);

%% 1) 环境与基本设置
mdl = "CarPoleSW_V2";
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
agent = rlSACAgent(obsInfo, actInfo);

%% 5) 训练选项（保持不变）
maxepisodes = 2000;
trainingOptions = rlTrainingOptions( ...
    MaxEpisodes=maxepisodes, ...
    MaxStepsPerEpisode=maxsteps, ...
    ScoreAveragingWindowLength=50, ...
    Verbose=false, ...
    Plots="training-progress", ...
    StopTrainingCriteria="AverageReward", ...
    StopTrainingValue=-12, ...
    SaveAgentCriteria="EpisodeReward", ...
    SaveAgentValue=-12);

%% 6) 训练或加载（仅修正赋值逻辑，不改参数）
doTraining = false;

if doTraining
    trainingStats = train(agent, env, trainingOptions);
else
    % 加载预训练 agent 并覆盖
    % saved_agent = load("my_sac_agent_final.mat", "agent");
    % agent = S.saved_agent;   % 关键：覆盖当前 agent
   
    % 直接加载
    load("my_sac_agent_final.mat", "agent");
end

%% 7) 仿真
simOptions = rlSimulationOptions(MaxSteps=1500);
experience = sim(env, agent, simOptions);
