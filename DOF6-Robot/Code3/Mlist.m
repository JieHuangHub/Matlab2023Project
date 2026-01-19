% clc; clear;

%% 1. 你的 POE 参数 (直接来自你的函数)
% 关节轴上一点 r_i (单位：m)
r1 = [0; 0; 0];
r2 = [0.035; 0; 0.1245];
r3 = [0.035; 0; 0.1245 + 0.146];
r4 = [0.035; 0; 0.1245 + 0.146 + 0.052];
r5 = [0.035 + 0.117; 0; 0.3225];
r6 = [0.035 + 0.117 + 0.0775; 0; 0.3225];

% 零位末端姿态 M (来自你的代码)
M_global = [ 0,  0,  1,  0.2295; 
             0, -1,  0,  0.000; 
             1,  0,  0,  0.3225; 
             0,  0,  0,  1    ];

%% 2. 自动构建 Mlist (相对位姿链)
% InverseDynamics 需要 n+1 个 M 矩阵:
% M1: Base -> Link1
% M2: Link1 -> Link2
% ...
% M6: Link5 -> Link6
% M7: Link6 -> EndEffector

% 定义策略：
% 连杆 i 的坐标系原点位于 r_{i+1} (即下一个关节的位置)
% 连杆 i 的姿态在零位时与 Base 一致 (除了末端 Link 6)

% 初始化 Mlist
Mlist_1 = zeros(4, 4, 7);

% --- M1: Base (原点) 到 Link1 (原点设在 J2 位置 r2) ---
% 姿态: 单位矩阵 (与基座一致)
M1 = eye(4);
M1(1:3, 4) = r2; 
Mlist_1(:,:,1) = M1;

% --- M2: Link1 (r2) 到 Link2 (r3) ---
M2 = eye(4);
M2(1:3, 4) = r3 - r2;
Mlist_1(:,:,2) = M2;

% --- M3: Link2 (r3) 到 Link3 (r4) ---
M3 = eye(4);
M3(1:3, 4) = r4 - r3;
Mlist_1(:,:,3) = M3;

% --- M4: Link3 (r4) 到 Link4 (r5) ---
M4 = eye(4);
M4(1:3, 4) = r5 - r4;
Mlist_1(:,:,4) = M4;

% --- M5: Link4 (r5) 到 Link5 (r6) ---
M5 = eye(4);
M5(1:3, 4) = r6 - r5;
Mlist_1(:,:,5) = M5;

% --- M6: Link5 (r6) 到 Link6 (Body Frame) ---
% 注意：根据你的 M 矩阵，末端位置也在 r6。
% 这意味着 Link 5 和 Link 6 的坐标系原点重合（长度为0，或者单纯是旋转关节）。
% 这里我们处理 Link 6 的本体姿态。
% 策略：让 Link 6 的坐标系姿态直接等于 M 的旋转部分。
M6 = eye(4);
M6(1:3, 4) = [0; 0; 0]; % r6 - r6
% 这里我们要决定 Link6 的惯量是在什么坐标系下定义的。
% 如果 Link6 是末端法兰，通常它的坐标系就是 M 的姿态。
% 为了让 M_global 正确，我们需要 M0_L6 = M_global。
% 前面 M0_L5 是平移到了 r6，无旋转。
% 所以 M_L5_L6 (即 M6) 必须包含 M 的旋转。
M6(1:3, 1:3) = M_global(1:3, 1:3); 
Mlist_1(:,:,6) = M6;

% --- M7: Link6 到 EndEffector (Tip) ---
% 因为 M_global 的位置就是 r6，说明 Tip 就在 Link6 原点。
M7 = eye(4);
Mlist_1(:,:,7) = M7;

%% 3. 输出结果供复制
disp('%% --- 自动生成的 Mlist (基于 POE 参数) ---');
for i = 1:7
    fprintf('M%d = [\n', i);
    fprintf('   %8.5f, %8.5f, %8.5f, %8.5f;\n', Mlist_1(1,:,i));
    fprintf('   %8.5f, %8.5f, %8.5f, %8.5f;\n', Mlist_1(2,:,i));
    fprintf('   %8.5f, %8.5f, %8.5f, %8.5f;\n', Mlist_1(3,:,i));
    fprintf('   %8.5f, %8.5f, %8.5f, %8.5f ];\n\n', Mlist_1(4,:,i));
end

disp('Mlist = cat(3, M1, M2, M3, M4, M5, M6, M7);');

%% 4. 重要提示：关于惯量矩阵 Glist
disp('!!! 关键提示 !!!');
disp('由于我们假设中间连杆(Link 1-5)的姿态与基座一致(Identity matrix)，');
disp('请确保你的 Glist (G1...G5) 是参考【基座坐标系轴向】定义的。');
disp('例如：如果 Link 2 是直立的(沿Z轴)，则 Izz 应该是绕其长轴的惯量。');
disp('Link 6 的 G6 应该参考 M_global 的姿态定义。');