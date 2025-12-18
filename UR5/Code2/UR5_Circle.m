%% =========================================================
%  UR5 机械臂末端画圆轨迹
%  单位：米 (m)
%  MATLAB 2023b + Robotics Toolbox
%% =========================================================

% clear; clc; close all;

%% ========== 1. 建立 UR5 机器人模型 (Standard DH, 单位 m) ==========
% 使用你提供的参数
L(1) = Link('d', 0.089159, 'a', 0,        'alpha',  pi/2,  'standard');
L(2) = Link('d', 0,        'a', -0.42500, 'alpha',  0,     'standard');
L(3) = Link('d', 0,        'a', -0.39225, 'alpha',  0,     'standard');
L(4) = Link('d', 0.10915,  'a', 0,        'alpha',  pi/2,  'standard');
L(5) = Link('d', 0.09465,  'a', 0,        'alpha', -pi/2,  'standard');
L(6) = Link('d', 0.08230,  'a', 0,        'alpha',  0,     'standard');

% 创建机器人对象
ur5 = SerialLink(L, 'name', 'UR5');

%% ========== 2. 生成空间圆轨迹 ==========
% 这里的单位全部是 米 (m)
n    = [1 0 0];          % 圆所在平面的法向量 (Z轴)
r    = 0.1;              % 圆半径 (0.1m = 100mm)
c    = [0.4 0.3 0.3];    % 圆心坐标 (米) -> 调整到了 UR5 的舒适工作区
step = 50;               % 插值点数

P = drawing_circle(n, r, c, step);   % P: [N x 3]

%% ========== 3. 逆运动学求解 ==========
% 给定一个合理的初值，避免求解器陷入怪异姿态
% UR5 经典的“肘部向上”构型初值
ikInitGuess = [0, -pi/2, 0, -pi/2, 0, 0]; 

qrt = zeros(size(P,1), 6);

for i = 1:size(P,1)
    % 【姿态设定】
    % 使用你调试通过的公式：transl(...) * rpy2tr(0, 0, pi, 'xyz')
    T = transl(P(i,:)) * rpy2tr(0, 0, pi, 'xyz');
    
    % 数值逆解 (ikunc)
    q = ur5.ikunc(T, ikInitGuess);
    
    qrt(i,:) = q;
    ikInitGuess = q;  % 保证连续性
end

%% ========== 4. 可视化 ==========
figure;

% UR5 的活动范围较大，设置合适的工作空间 (单位: m)
ws = [-0.8 0.8 -0.8 0.8 -0.2 1.2];

ur5.plot(qrt, ...
    'workspace', ws, ...          % 必须手动指定空间范围
    'tilesize', 0.5, ...          % 地板网格 0.5m
    'view', [45 30], ...          % 视角
    'trail', {'r','LineWidth',2}, ... % 轨迹线
    'noarrow');                   % 隐藏坐标系箭头，使画面更清爽

title('UR5 End-Effector Circular Trajectory (m)');
xlabel('X (m)'); ylabel('Y (m)'); zlabel('Z (m)');
grid on; axis equal;

%% ========== 5. 准备 Simulink 数据 ==========
% 假设完成画圆的总时间是 10 秒
total_time = 10; 

% 创建时间向量 (列向量，长度必须与 qrt 行数一致)
t_vec = linspace(0, total_time, size(qrt, 1))'; 

% 创建 timeseries 对象 (推荐方式，比数组更稳定)
% qrt 是数据，t_vec 是时间
sim_traj = timeseries(qrt, t_vec);

% 提示：运行完这部分代码后，工作区里会有一个叫 'sim_traj' 的变量
disp('数据已准备好，可以在 Simulink 中使用了。');


%% ========== 附：画圆函数 ==========
function points = drawing_circle(n, r, c, step)
    theta = linspace(0, 2*pi, step)';
    
    % 构造正交基
    a = cross(n, [1 0 0]);
    if norm(a) < 1e-6
        a = cross(n, [0 1 0]);
    end
    b = cross(n, a);
    
    a = a / norm(a);
    b = b / norm(b);
    
    % 参数方程
    x = c(1) + r*(a(1)*cos(theta) + b(1)*sin(theta));
    y = c(2) + r*(a(2)*cos(theta) + b(2)*sin(theta));
    z = c(3) + r*(a(3)*cos(theta) + b(3)*sin(theta));
    
    points = [x y z];
end