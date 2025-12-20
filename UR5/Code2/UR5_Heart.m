%% =========================================================
%  UR5 机械臂末端画爱心轨迹 (XZ平面)
%  单位：米 (m)
%  MATLAB 2023b + Robotics Toolbox
%% =========================================================

% clear; clc; close all;

%% ========== 1. 建立 UR5 机器人模型 (Standard DH, 单位 m) ==========
L(1) = Link('d', 0.089159, 'a', 0,        'alpha',  pi/2,  'standard');
L(2) = Link('d', 0,        'a', -0.42500, 'alpha',  0,     'standard');
L(3) = Link('d', 0,        'a', -0.39225, 'alpha',  0,     'standard');
L(4) = Link('d', 0.10915,  'a', 0,        'alpha',  pi/2,  'standard');
L(5) = Link('d', 0.09465,  'a', 0,        'alpha', -pi/2,  'standard');
L(6) = Link('d', 0.08230,  'a', 0,        'alpha',  0,     'standard');

ur5 = SerialLink(L, 'name', 'UR5');

%% ========== 2. 生成空间爱心轨迹 (XZ平面) ==========
n    = [0 1 0];          % 改为Y轴方向，使爱心在XZ平面上
r    = 0.15;             % 爱心大小缩放系数 (米)
c    = [0.4 0.3 0.3];    % 爱心中心坐标 (米)，Y方向偏移一点避免奇异
step = 100;              % 插值点数

P = drawing_heart(n, r, c, step);   % P: [N x 3]

%% ========== 3. 逆运动学求解 ==========
ikInitGuess = [0, -pi/2, 0, -pi/2, 0, 0]; 

qrt = zeros(size(P,1), 6);

for i = 1:size(P,1)
    T = transl(P(i,: )) * rpy2tr(0, pi/4, pi, 'xyz');
    q = ur5.ikunc(T, ikInitGuess);
    qrt(i,:) = q;
    ikInitGuess = q;
end

%% ========== 4. 可视化 ==========
figure;

ws = [-0.8 0.8 -0.8 0.8 -0.2 1.2];

ur5.plot(qrt, ...
    'workspace', ws, ... 
    'tilesize', 0.5, ...
    'view', [45 30], ... 
    'trail', {'r','LineWidth',2}, ...
    'noarrow');

title('UR5 End-Effector Heart Trajectory in XZ Plane (m)');
xlabel('X (m)'); ylabel('Y (m)'); zlabel('Z (m)');
grid on; axis equal;

%% ========== 5. 准备 Simulink 数据 ==========
total_time = 10; 
t_vec = linspace(0, total_time, size(qrt, 1))'; 
sim_traj = timeseries(qrt, t_vec);
disp('XZ平面爱心轨迹数据已准备好，可以在 Simulink 中使用了。');


%% ========== 附：画爱心函数 ==========
function points = drawing_heart(n, r, c, step)
    theta = linspace(0, 2*pi, step)';
    
    % 爱心的 2D 参数方程 (归一化)
    heart_x = 16 * sin(theta).^3;
    heart_y = 13*cos(theta) - 5*cos(2*theta) - 2*cos(3*theta) - cos(4*theta);
    
    heart_x = heart_x / 16;
    heart_y = heart_y / 16;
    
    % 构造正交基
    a = cross(n, [1 0 0]);
    if norm(a) < 1e-6
        a = cross(n, [0 1 0]);
    end
    b = cross(n, a);
    
    a = a / norm(a);
    b = b / norm(b);
    
    % 将 2D 爱心映射到 3D 空间
    x = c(1) + r * (a(1)*heart_x + b(1)*heart_y);
    y = c(2) + r * (a(2)*heart_x + b(2)*heart_y);
    z = c(3) + r * (a(3)*heart_x + b(3)*heart_y);
    
    points = [x y z];
end