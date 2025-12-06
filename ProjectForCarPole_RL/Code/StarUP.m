
%%
clear; clc;

%%
global m M l g Ic K_LQR
M = 1.900280446158421; % 车体质量 [kg]
m = 0.800557214198657; % 摆杆等效质量 [kg]
l = 0.1894574658851551; % 车体转轴到摆杆质心的距离 [m]
Ic = 0.001519312454399678;   % = 0.001519312454399678 kg·m^2
g = 9.81;

%% CarPole initial
x_0 = 0;
y_0 = -0.05;
q_0 = 15;

wheel_damping = 0; % 1e-7
joint_damping = 0;

%% controller
LQR = 0;

if LQR
   K_LQR = cartPoleLQR;
end
