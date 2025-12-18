%% =========================================================
%  Gluon6L3 末端画圆轨迹（半径增大版 r=0.1m）
%  MATLAB 2023b + Robotics Toolbox
%% =========================================================

clear; clc; close all;

%% ========== 1. 建立机器人模型（Standard DH, 单位 m） ==========
L(1) = Link('d', 0.089159, 'a', 0,        'alpha',  pi/2,  'standard');
L(2) = Link('d', 0,        'a', -0.42500, 'alpha',  0,     'standard');
L(3) = Link('d', 0,        'a', -0.39225, 'alpha',  0,     'standard');
L(4) = Link('d', 0.10915,  'a', 0,        'alpha',  pi/2,  'standard');
L(5) = Link('d', 0.09465,  'a', 0,        'alpha', -pi/2, 'standard');
L(6) = Link('d', 0.08230,  'a', 0,        'alpha',  0,     'standard');

gluon6l3 = SerialLink(L, 'name', 'Gluon6L3');

%% ========== 2. 生成空间圆轨迹 ==========
n = [0 0 1];                 % 圆所在平面法向量 (Z轴)
r = 0.10;                    % <--- 【修改】圆半径改为 0.1m
c = [0.45 0 0.30];           % 圆心坐标 (m)
step = 100;                  % 点数稍微增加一点让大圆更圆滑

% 调用下方的画圆函数
P = drawing_circle(n, r, c, step);

%% ========== 3. 逆运动学求解 ==========
ikInitGuess = zeros(1,6);
q_traj = zeros(size(P,1), 6);

% 定义目标姿态：末端垂直向下 (Z轴朝下)
% 旋转矩阵：绕X轴旋转180度
R_goal = [1  0  0; 
          0 -1  0; 
          0  0 -1];

for i = 1:size(P,1)
    % 手动构造 4x4 齐次变换矩阵 T = [R, p; 0, 1]
    % 这样写最通用，不依赖特定版本的 rt2tr 或 transl
    T = [R_goal,      P(i,:)'; 
         0 0 0        1];
    
    % 数值逆解
    q = gluon6l3.ikunc(T, ikInitGuess);
    
    q_traj(i,:) = q;
    ikInitGuess = q;
end

%% ========== 4. 可视化 ==========
figure;

% 设置绘图空间范围 [xmin xmax ymin ymax zmin zmax]
% 这一步是解决 "Error in axis" 报错的关键
ws = [-1 1 -1 1 -0.5 1.5];

gluon6l3.plot(q_traj, ...
    'workspace', ws, ...      % <--- 强制指定范围
    'tilesize', 1, ...        % 地板网格大小 1m
    'trail', {'r','LineWidth',2}, ... 
    'view', [45 30]);

% 美化
grid on;
axis equal;
title(['Gluon6L3 Trajectory (r = ' num2str(r) 'm)']);

%% ========== 画圆函数 ==========
function points = drawing_circle(n, r, c, step)
    % 角度
    theta = linspace(0, 2*pi, step)';

    % 构造平面内正交基向量
    a = cross(n, [1 0 0]);
    if norm(a) < 1e-6
        a = cross(n, [0 1 0]);
    end
    b = cross(n, a);

    % 单位化
    a = a / norm(a);
    b = b / norm(b);

    % 参数方程
    x = c(1) + r*(a(1)*cos(theta) + b(1)*sin(theta));
    y = c(2) + r*(a(2)*cos(theta) + b(2)*sin(theta));
    z = c(3) + r*(a(3)*cos(theta) + b(3)*sin(theta));

    points = [x y z];
end