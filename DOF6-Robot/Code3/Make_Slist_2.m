

% clear; clc;

% --- 1. DH 参数表 ---
% [d, a, alpha, offset]
DH_params = [
    0.1245,  0.035,  -pi/2,  0;       % Link 1 -> Defines Frame 1
    0,       0.146,   0,     -pi/2;   % Link 2 -> Defines Frame 2
    0,       0.052,  -pi/2,  0;       % Link 3 -> Defines Frame 3
    0.117,   0,       pi/2,  0;       % Link 4 -> Defines Frame 4
    0,       0,      -pi/2,  0;       % Link 5 -> Defines Frame 5
    0.0775,  0,       0,     0;       % Link 6 -> Defines Frame 6
];

num_joints = 6;
Slist = zeros(6, num_joints);

% 初始化累积变换矩阵 (T_accum) 为单位阵
% 这代表 Frame 0 (Base)
T_accum = eye(4);

fprintf('====================================================================\n');
fprintf('基于 DH 参数推导的 Joint 运动轴参数 (Space Frame)\n');
fprintf('====================================================================\n');
fprintf('Joint |      wx      wy      wz    |      rx      ry      rz\n');
fprintf('------+----------------------------+---------------------------\n');

for i = 1:num_joints
    % --- 1. 提取当前关节的轴线信息 ---
    % 根据 SDH，第 i 个关节绕的是 Frame {i-1} 的 Z 轴旋转
    % 此时 T_accum 正好是 T_{0, i-1}
    
    R = T_accum(1:3, 1:3);
    p = T_accum(1:3, 4);
    
    % w 就是当前坐标系的 Z 轴 (R 的第三列)
    w = R(:, 3);
    
    % r 就是当前坐标系的原点 p (或者轴线上任意一点)
    r = p;
    
    % 计算 v = -w x r (PoE 螺旋轴的线速度部分)
    v = cross(-w, r);
    
    % 存入 Slist
    Slist(:, i) = [w; v];
    
    % 打印 w 和 r
    fprintf('  %d   | %7.4f %7.4f %7.4f  | %7.4f %7.4f %7.4f\n', ...
            i, w(1), w(2), w(3), r(1), r(2), r(3));
            
    % --- 2. 计算下一个变换矩阵，为下一次循环做准备 ---
    % 获取第 i 行 DH 参数
    d = DH_params(i, 1);
    a = DH_params(i, 2);
    alpha = DH_params(i, 3);
    offset = DH_params(i, 4);
    
    % 计算 T_{i-1, i} (注意：这里的 theta 使用 offset，代表零位姿态)
    theta = offset;
    
    T_step = [cos(theta), -sin(theta)*cos(alpha),  sin(theta)*sin(alpha), a*cos(theta);
              sin(theta),  cos(theta)*cos(alpha), -cos(theta)*sin(alpha), a*sin(theta);
              0,           sin(alpha),             cos(alpha),            d;
              0,           0,                      0,                     1];
              
    % 消除计算噪声
    T_step(abs(T_step) < 1e-6) = 0;
    
    % 更新累积矩阵
    T_accum = T_accum * T_step;
end

fprintf('====================================================================\n');
disp('生成的 Slist (6x6):');
disp(Slist);