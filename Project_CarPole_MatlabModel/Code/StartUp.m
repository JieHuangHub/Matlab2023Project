
%%
clear; clc;

%% 
global m M l g K_LQR

m = 0.5;
M = 0.5;
l = 0.3;
g = 9.81;

wheel_damping = 1e-5; % 1e-7
joint_damping = 1e-5;

%% CarPole initial 
x_0 = 0;  
y_0 = 0.125;   % high car
q_0 = 15;    % 5 15 20 30  -5 -15 -20 -30  degree

%% controller
LQR = 0;

LSTM = 0;

RL = 1;

if LQR 
    
   K_LQR = cartPoleLQR; 
 
end

if LSTM
    load("LSTMPolicy.mat");
    global policy
end

if RL

    load("agent_cartpole_sac_best.mat");    
    global agent

end

