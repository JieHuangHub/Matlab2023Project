%% =========================================================
%  自定义小型 6轴机械臂 末端画圆轨迹
%  单位：米 (m)
%  MATLAB 2023b + Robotics Toolbox
%% =========================================================

% clear; clc; close all;

%% ========== 1. 建立机器人模型 (基于你提供的新参数) ==========
% 注意：你提供的参数格式是 Link([theta d a alpha], 'standard')
% 第一列是theta(变量，填0即可)，第二列d，第三列a，第四列alpha

L(1) = Link([ 0       0.1245   0.035  -pi/2], 'standard');
L(2) = Link([ 0       0        0.146   0   ], 'standard');  
L(3) = Link([ 0       0        0.052  -pi/2], 'standard');
L(4) = Link([ 0       0.117    0       pi/2], 'standard');
L(5) = Link([ 0       0        0      -pi/2], 'standard');
L(6) = Link([ 0       0.0775   0       0   ], 'standard');

% 创建机器人对象
my_robot = SerialLink(L, 'name', 'SmallRobot');

%% ========== 2. 生成空间圆轨迹 ==========
% 【重要调整】：因为这个机械臂比UR5小很多，必须修改圆心和半径
% 否则目标点会超出工作空间

n    = [0 0 1];          % 圆所在平面的法向量 (X轴方向，即在YZ平面画圆)
r    = 0.04;             % 圆半径 (改为 0.04m = 40mm)
c    = [0.15 0.0 0.15];  % 圆心坐标 (米) -> 调整到机械臂前方约 25cm 处
step = 50;               % 插值点数

P = drawing_circle(n, r, c, step);   % P: [N x 3]

%% ========== 3. 逆运动学求解 ==========
% 对于这个新构型，重置初始猜测
ikInitGuess = zeros(1,6); 

qrt = zeros(size(P,1), 6);

for i = 1:size(P,1)
    % 【姿态设定】
    % 保持末端 Z 轴朝下 (或者根据你的机械臂实际安装情况调整)
    % T = transl(P(i,:)) * rpy2tr(0, 0, pi, 'xyz'); % Z轴朝上旋转180 -> Z轴朝下
    
    % 如果你的机械臂末端坐标系定义不同，可能需要调整旋转。
    % 这里暂时保持常用的“末端垂直向下”设定：
    T = transl(P(i,:)) * rpy2tr(0, 0, pi, 'xyz'); 
    
    % 数值逆解 (ikunc)
    q = my_robot.ikunc(T, ikInitGuess);
    
    qrt(i,:) = q;
    ikInitGuess = q;  % 保证连续性
end

%% ========== 4. 可视化 ==========
figure;

% 调整显示的工作空间范围 (适应小机械臂)
ws = [-0.4 0.5 -0.4 0.4 -0.1 0.6];

my_robot.plot(qrt, ...
    'workspace', ws, ...          % 手动指定范围
    'tilesize', 0.1, ...          % 地板网格变小
    'view', [45 30], ...          % 视角
    'trail', {'r','LineWidth',2}, ... 
    'noarrow');                   

title('Small Robot Circular Trajectory');
xlabel('X (m)'); ylabel('Y (m)'); zlabel('Z (m)');
grid on; axis equal;

%% ========== 5. 准备 Simulink 数据 ==========
% 假设完成画圆的总时间是 10 秒
total_time = 10; 

% 创建时间向量 (列向量)
t_vec = linspace(0, total_time, size(qrt, 1))'; 

% 创建 timeseries 对象
sim_traj = timeseries(qrt, t_vec);

disp('数据已准备好 (变量名: sim_traj)，可以在 Simulink 中使用了。');


%% ========== 附：画圆函数 (保持不变) ==========
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