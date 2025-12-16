% clear; clc;

[DOF6_URDF, ArmInfo] = importrobot('Dummy_JH');


% 初始化全局变量
% ====== 几何参数 ======
L_BS = 0.1245;
D_BS = 0.035;   % 这个一般做成单独的基座变换，不写在 D_H 里
L_AM = 0.146;
L_FA = 0.117;
D_EW = 0.052;
L_WT = 0.0755;

% ====== D-H 参数矩阵 [alpha, a, d, theta_offset] ======
D_H = [
    -pi/2,     L_BS,        D_BS,            0;      % Link 1
    0,            0,        L_AM,        -pi/2;      % Link 2
    pi/2,      D_EW,           0,         pi/2;      % Link 3
    -pi/2,     L_FA,           0,            0;      % Link 4
    pi/2,         0,           0,            0;      % Link 5
    0,         L_WT,           0,            0;      % Link 6
];


%% 画圆轨迹：末端在空中画一个半径 0.05 m 的圆

% T_total = 5;        % 画一圈用时 5 s
% Ts      = 0.01;     % 采样时间
% t       = (0:Ts:T_total)';    % 列向量，时间
% 
% R   = 0.05;         % 圆半径 [m]
% xc  = 0.25;         % 圆心 x
% yc  = 0.00;         % 圆心 y
% zc  = 0.20;         % 圆心 z（高度）
% 
% omega = 2*pi/T_total;
% 
% px = xc + R*cos(omega*t);     % x(t)
% py = yc + R*sin(omega*t);     % y(t)
% pz = zc*ones(size(t));        % z(t) 固定
% 
% %% 矩阵形式：[time, x, y, z]
% p_traj = [t, px, py, pz];
% 
% figure;
% plot(px, py); axis equal; grid on;
% xlabel('x'); ylabel('y'); title('EE XY circle');




