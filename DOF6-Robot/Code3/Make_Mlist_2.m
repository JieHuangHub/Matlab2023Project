

% clear; clc;

% --- 1. 输入提供的 DH 参数 ---
% 格式对应: [d, a, alpha, offset]
% 注意：我根据你的代码注释修正了列的对应关系
% Row 1: d=0.1245, a=0.035, alpha=-pi/2, offset=0
% Row 2: d=0,      a=0.146, alpha=0,     offset=-pi/2
% ...
DH_params = [
    0.1245,  0.035,  -pi/2,  0;       % Link 1
    0,       0.146,   0,     -pi/2;   % Link 2
    0,       0.052,  -pi/2,  0;       % Link 3
    0.117,   0,       pi/2,  0;       % Link 4
    0,       0,      -pi/2,  0;       % Link 5
    0.0775,  0,       0,     0;       % Link 6
];

% --- 2. 循环计算 M1 - M6 ---
num_links = size(DH_params, 1);
M_cell = cell(1, num_links + 1); % 预存 M1 到 M7

fprintf('正在根据 DH 参数严格推导 M 矩阵...\n\n');

for i = 1:num_links
    % 提取参数
    d      = DH_params(i, 1);
    a      = DH_params(i, 2);
    alpha  = DH_params(i, 3);
    offset = DH_params(i, 4);
    
    % 在零位(q=0)时，theta = offset
    theta = offset;
    
    % --- Standard DH 公式 ---
    % Rot_z(theta)
    Rz = [cos(theta) -sin(theta) 0 0; sin(theta) cos(theta) 0 0; 0 0 1 0; 0 0 0 1];
    % Trans_z(d)
    Tz = [1 0 0 0; 0 1 0 0; 0 0 1 d; 0 0 0 1];
    % Trans_x(a)
    Tx = [1 0 0 a; 0 1 0 0; 0 0 1 0; 0 0 0 1];
    % Rot_x(alpha)
    Rx = [1 0 0 0; 0 cos(alpha) -sin(alpha) 0; 0 sin(alpha) cos(alpha) 0; 0 0 0 1];
    
    % 连乘得到当前变换矩阵 M
    M_i = Rz * Tz * Tx * Rx;
    
    % 消除极小数值噪声 (例如 1e-16 变为 0)
    M_i(abs(M_i) < 1e-6) = 0;
    
    M_cell{i} = M_i;
    
    fprintf('M%d (from DH Row %d):\n', i, i);
    disp(M_i);
end

% --- 3. 处理 M7 ---
% 你的 DH 表只有 6 行，通常意味着它是 6 自由度机器人。
% M7 通常是 End-Effector 相对于 Frame 6 的变换。
% 如果没有额外定义，M7 就是单位矩阵 (Frame 7 重合于 Frame 6)
M7 = eye(4);
M_cell{7} = M7;
fprintf('M7 (End-Effector, assumed Identity):\n');
disp(M7);

% --- 4. 生成最终 Mlist ---
M1 = M_cell{1}; M2 = M_cell{2}; M3 = M_cell{3};
M4 = M_cell{4}; M5 = M_cell{5}; M6 = M_cell{6};
Mlist = cat(3, M1, M2, M3, M4, M5, M6, M7);

% 显示复制用的结果
fprintf('--------------------------------------------------\n');
fprintf('可以直接复制的 Mlist 定义：\n\n');
fprintf('M1 = [%.4f, %.4f, %.4f, %.4f; %.4f, %.4f, %.4f, %.4f; %.4f, %.4f, %.4f, %.4f; 0, 0, 0, 1];\n', M1(1,:), M1(2,:), M1(3,:));
fprintf('M2 = [%.4f, %.4f, %.4f, %.4f; %.4f, %.4f, %.4f, %.4f; %.4f, %.4f, %.4f, %.4f; 0, 0, 0, 1];\n', M2(1,:), M2(2,:), M2(3,:));
fprintf('M3 = [%.4f, %.4f, %.4f, %.4f; %.4f, %.4f, %.4f, %.4f; %.4f, %.4f, %.4f, %.4f; 0, 0, 0, 1];\n', M3(1,:), M3(2,:), M3(3,:));
fprintf('M4 = [%.4f, %.4f, %.4f, %.4f; %.4f, %.4f, %.4f, %.4f; %.4f, %.4f, %.4f, %.4f; 0, 0, 0, 1];\n', M4(1,:), M4(2,:), M4(3,:));
fprintf('M5 = [%.4f, %.4f, %.4f, %.4f; %.4f, %.4f, %.4f, %.4f; %.4f, %.4f, %.4f, %.4f; 0, 0, 0, 1];\n', M5(1,:), M5(2,:), M5(3,:));
fprintf('M6 = [%.4f, %.4f, %.4f, %.4f; %.4f, %.4f, %.4f, %.4f; %.4f, %.4f, %.4f, %.4f; 0, 0, 0, 1];\n', M6(1,:), M6(2,:), M6(3,:));
fprintf('M7 = eye(4);\n');
fprintf('Mlist = cat(3, M1, M2, M3, M4, M5, M6, M7);\n');