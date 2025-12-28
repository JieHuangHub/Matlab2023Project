%% =========================================================
%  自定义小机械臂 - 末端画圣诞树轨迹
%  单位：米 (m)
%  MATLAB 2023b + Robotics Toolbox
%% =========================================================

% clear; clc; close all;

%% ========== 1. 建立机器人模型 (保持你的自定义参数) ==========
% Link([theta d a alpha], 'standard')
L(1) = Link([ 0       0.1245   0.035  -pi/2], 'standard');
L(2) = Link([ 0       0        0.146   0   ], 'standard');  
L(3) = Link([ 0       0        0.052  -pi/2], 'standard');
L(4) = Link([ 0       0.117    0       pi/2], 'standard');
L(5) = Link([ 0       0        0      -pi/2], 'standard');
L(6) = Link([ 0       0.0775   0       0   ], 'standard');

my_robot = SerialLink(L, 'name', 'XmasBot');

%% ========== 2. 生成圣诞树轨迹 ==========
% 设定圣诞树在空间中的位置
% X: 前后位置 (放在机器人前方 0.25m 处)
% Y: 左右中心 (0)
% Z: 上下中心 (0.2m)
center_pos = [0.20, 0, 0.20]; 

% 设定树的大小
tree_height = 0.12; % 高度 12cm
tree_width  = 0.10; % 宽度 10cm

% 生成轨迹点
P = get_christmas_tree_traj(center_pos, tree_height, tree_width);

%% ========== 3. 逆运动学求解 ==========
ikInitGuess = zeros(1,6); 
qrt = zeros(size(P,1), 6);

% 设定末端姿态：
% 这里让末端笔尖垂直向下 (Z轴向下)，就像在桌面上写字一样
% 如果想让笔尖水平向前(像在黑板上写字)，可以用 rpy2tr(-pi/2, 0, -pi/2, 'xyz')
R_goal = rpy2tr(0, 0, pi, 'xyz'); % Z轴向下

for i = 1:size(P,1)
    % 构造变换矩阵
    T = transl(P(i,:)) * R_goal;
    
    % 逆解
    q = my_robot.ikunc(T, ikInitGuess);
    
    qrt(i,:) = q;
    ikInitGuess = q; % 连续性
end

%% ========== 4. 可视化 ==========
figure;
% 调整视窗范围以适应小机械臂
ws = [-0.1 0.5 -0.3 0.3 -0.1 0.5];

% 绘图
my_robot.plot(qrt, ...
    'workspace', ws, ...
    'tilesize', 0.1, ...
    'view', [130 20], ...  % 侧后方视角，容易看清树的形状
    'trail', {'g','LineWidth',2}, ... % 用绿色画轨迹！
    'noarrow');

title('Merry Christmas! (Robot Trajectory)');
xlabel('X'); ylabel('Y'); zlabel('Z');
grid on; axis equal;

%% ========== 5. 准备 Simulink 数据 ==========
total_time = 15; % 稍微慢一点画
t_vec = linspace(0, total_time, size(qrt, 1))'; 
sim_traj = timeseries(qrt, t_vec);
disp('Simulink 数据已准备好 (变量名: sim_traj)');


%% ========== 附：圣诞树轨迹生成函数 ==========
function P = get_christmas_tree_traj(center, h, w)
    % center: [x, y, z] 中心点
    % h: 树高
    % w: 树最大宽度
    
    x0 = center(1);
    y0 = center(2);
    z0 = center(3);
    
    % 定义圣诞树的关键节点 (在 YZ 平面上画，X 固定)
    % 相对坐标：y (左右), z (上下)
    % 顺序：树干底右 -> 树干顶右 -> 下层枝叶 -> 中层 -> 顶层 -> 树梢 -> (对称左边) -> 回到起点
    
    % 树干尺寸
    trunk_w = w * 0.2;
    trunk_h = h * 0.2;
    
    % 关键点坐标 (y, z) 
    nodes_rel = [
        % 右半边
        trunk_w/2,  -h/2;              % 1. 树干底右
        trunk_w/2,  -h/2 + trunk_h;    % 2. 树干顶右
        w/2,        -h/2 + trunk_h;    % 3. 底层树枝尖端
        w/4,        -h/2 + trunk_h + h*0.25; % 4. 内收点
        w/3,        -h/2 + trunk_h + h*0.25; % 5. 中层树枝尖端
        w/6,        -h/2 + trunk_h + h*0.50; % 6. 内收点
        w/8,        -h/2 + trunk_h + h*0.50; % 7. 上层树枝尖端
        0,          h/2;               % 8. 树顶 (Star)
        
        % 左半边 (对称)
        -w/8,       -h/2 + trunk_h + h*0.50;
        -w/6,       -h/2 + trunk_h + h*0.50;
        -w/3,       -h/2 + trunk_h + h*0.25;
        -w/4,       -h/2 + trunk_h + h*0.25;
        -w/2,       -h/2 + trunk_h;
        -trunk_w/2, -h/2 + trunk_h;
        -trunk_w/2, -h/2;
        
        % 闭合
        trunk_w/2,  -h/2; 
    ];

    % 将相对坐标转换为绝对坐标
    key_points = [];
    for k = 1:size(nodes_rel, 1)
        key_points(k,:) = [x0, y0 + nodes_rel(k,1), z0 + nodes_rel(k,2)];
    end
    
    % 在关键点之间进行线性插值，生成平滑轨迹
    P = [];
    points_per_segment = 20; % 每段线由多少个点组成
    
    for k = 1:size(key_points,1)-1
        p_start = key_points(k,:);
        p_end   = key_points(k+1,:);
        
        % 生成段内的点
        for t = linspace(0, 1, points_per_segment)
            pt = p_start * (1-t) + p_end * t;
            P = [P; pt];
        end
    end
end