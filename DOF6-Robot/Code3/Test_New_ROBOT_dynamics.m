%% test_ur_dynamics.m
%  测试脚本：验证 6自由度机械臂逆动力学
%  数据来源：用户提供的 POE 参数 + 惯性参数 (Body1 - Body6)

% clc; clear;

%% 1. 定义测试输入 (关节状态)
% 可以在这里修改 q, qd, qdd 来测试不同情况
% 测试用例 1: 静态保持 (此时力矩应主要克服重力)
q   = [0, 0, 0, 0, 0, 0]';
qd  = [0, 0, 0, 0, 0, 0]';
qdd = [0, 0, 0, 0, 0, 0]';

% 测试用例 2: 只有重力，没有速度加速度 (你可以取消注释测试)
% q = [0, -pi/2, 0, -pi/2, 0, 0]'; % 伸直状态

g_vec = [0; 0; -9.81];         % 重力加速度 (沿 Z 轴负方向)
Ftip  = [0; 0; 0; 0; 0; 0];    % 末端外力 (无)

%% 2. 准备 POE 几何参数 (来自你的正解函数)
w1 = [0; 0; 1];
w2 = [0; -1; 0];
w3 = [0; -1; 0];
w4 = [1; 0; 0];
w5 = [0; -1; 0];
w6 = [1; 0; 0];

r1 = [0; 0; 0];
r2 = [0.035; 0; 0.1245];
r3 = [0.035; 0; 0.1245 + 0.146];
r4 = [0.035; 0; 0.1245 + 0.146 + 0.052];
r5 = [0.035 + 0.117; 0; 0.3225];
r6 = [0.035 + 0.117 + 0.0775; 0; 0.3225];

% 计算线速度 v = -w x r
v1 = -cross(w1, r1);
v2 = -cross(w2, r2);
v3 = -cross(w3, r3);
v4 = -cross(w4, r4);
v5 = -cross(w5, r5);
v6 = -cross(w6, r6);

Slist = [w1, w2, w3, w4, w5, w6;
         v1, v2, v3, v4, v5, v6];

%% 3. 构建 Mlist (相对位姿链)
% 策略：为了匹配你提供的“相对于关节坐标系”的惯量数据，
% 我们将第 i 个 Body 的坐标系原点设置在第 i 个关节 (r_i) 处。
% Mlist(:,:,1) = Base -> Body1 (at r1)
% Mlist(:,:,2) = Body1 -> Body2 (at r2)
% ...

Mlist = zeros(4, 4, 7);

% M1: Base -> Body1 (r1)
Mlist(:,:,1) = eye(4); 
Mlist(1:3, 4, 1) = r1; 

% M2: Body1 -> Body2 (r2)
Mlist(:,:,2) = eye(4);
Mlist(1:3, 4, 2) = r2 - r1;

% M3: Body2 -> Body3 (r3)
Mlist(:,:,3) = eye(4);
Mlist(1:3, 4, 3) = r3 - r2;

% M4: Body3 -> Body4 (r4)
Mlist(:,:,4) = eye(4);
Mlist(1:3, 4, 4) = r4 - r3;

% M5: Body4 -> Body5 (r5)
Mlist(:,:,5) = eye(4);
Mlist(1:3, 4, 5) = r5 - r4;

% M6: Body5 -> Body6 (r6)
Mlist(:,:,6) = eye(4);
Mlist(1:3, 4, 6) = r6 - r5;

% M7: Body6 -> EndEffector (假设重合)
Mlist(:,:,7) = eye(4); 
% 若 Body6 坐标系姿态需要旋转以匹配末端，在此处乘旋转矩阵，这里暂设为 Identity

%% 4. 构建 Glist (空间惯量矩阵)
% 你提供的数据是：质量 m, 质心 p_com, 惯量张量 I_rot
% 所有的坐标都是“相对于关节坐标系”的。
% 空间惯量矩阵 G (6x6) 构造公式 (当原点不在质心时):
% G = [ I_rot          m * S(p_com) ]
%     [ m * S(p_com)'  m * I_3x3    ]
% 其中 S(p) 是 p 的反对称矩阵。

Glist = zeros(6, 6, 6);

% --- Body 1 ---
m = 0.4159;
p_com = [0.0096, 0.0097, -0.0108]';
I_rot = 1.0e-03 * [0.2861, -0.1215, 0.1171; -0.1215, 0.3323, 0.0910; 0.1171, 0.0910, 0.3752];
Glist(:,:,1) = make_spatial_inertia(m, p_com, I_rot);

% --- Body 2 ---
m = 2.4617;
p_com = [0.0728, -0.0001, -0.0123]';
I_rot = [0.0017, 0, 0.0012; 0, 0.0212, 0; 0.0012, 0, 0.0203];
Glist(:,:,2) = make_spatial_inertia(m, p_com, I_rot);

% --- Body 3 ---
m = 0.9768;
p_com = [0.0452, 0.0147, -0.0049]';
I_rot = [0.0009, -0.0007, 0.0001; -0.0007, 0.0026, 0; 0.0001, 0, 0.0030];
Glist(:,:,3) = make_spatial_inertia(m, p_com, I_rot);

% --- Body 4 ---
m = 0.7819;
p_com = [0.0019, -0.0000, -0.0778]';
I_rot = [0.0058, 0, 0.0001; 0, 0.0058, 0; 0.0001, 0, 0.0002];
Glist(:,:,4) = make_spatial_inertia(m, p_com, I_rot);

% --- Body 5 ---
m = 0.3930;
p_com = [0.0001, -0.0378, -0.0086]';
I_rot = 1.0e-03 * [0.8106, 0.0009, 0.0005; 0.0009, 0.1453, -0.1761; 0.0005, -0.1761, 0.7495];
Glist(:,:,5) = make_spatial_inertia(m, p_com, I_rot);

% --- Body 6 ---
m = 0.1062;
p_com = [-0.0000, -0.0000, 0.0105]';
I_rot = 1.0e-04 * [0.2732, 0, 0; 0, 0.2732, 0; 0, 0, 0.2726];
Glist(:,:,6) = make_spatial_inertia(m, p_com, I_rot);


%% 5. 调用 InverseDynamics 计算力矩
fprintf('正在计算逆动力学...\n');
tau = InverseDynamics(q, qd, qdd, g_vec, Ftip, Mlist, Glist, Slist);

%% 6. 输出结果
disp('-------------------------------------');
disp('计算结果 tau (N.m):');
for i = 1:6
    fprintf('关节 %d 力矩: %8.4f N.m\n', i, tau(i));
end
disp('-------------------------------------');


%% ============ 辅助函数 ============

function G = make_spatial_inertia(m, p, I_rot)
    % 构造空间惯量矩阵
    % m: 质量
    % p: 质心相对于坐标系原点的位置 [x;y;z]
    % I_rot: 3x3 转动惯量 (相对于坐标系原点)
    
    Sp = [0, -p(3), p(2); p(3), 0, -p(1); -p(2), p(1), 0]; % p 的反对称矩阵
    
    % G = [ I,      m*S(p) ]
    %     [ m*S(p)', m*I_3 ]
    
    G = [I_rot, m*Sp; 
         m*Sp', m*eye(3)];
end

%% ============ InverseDynamics 函数 (从上一轮复制而来，方便直接运行) ============
function tau = InverseDynamics(thetas, dthetas, ddthetas, g, Ftip, Mlist, Glist, Slist)
    n = size(thetas, 1);
    Mi = eye(4);
    Alist = zeros(6, n);
    M_0_i = eye(4); 
    
    % 1. 计算体螺旋轴 Alist
    for i = 1:n
        M_0_i = M_0_i * Mlist(:,:,i);
        Alist(:, i) = Adjoint(TransInv(M_0_i)) * Slist(:, i); 
    end

    % 2. 前向递推
    Vlist = zeros(6, n+1);
    VdotList = zeros(6, n+1);
    VdotList(:, 1) = [0; 0; 0; -g]; % 重力项
    T_list = zeros(4, 4, n+1); 

    for i = 1:n
        M_i_iminus1 = TransInv(Mlist(:,:,i));
        T_i_iminus1 = MatrixExp6(VecTose3(Alist(:,i) * -thetas(i))) * M_i_iminus1;
        T_list(:,:,i) = T_i_iminus1;
        
        Ad_T = Adjoint(T_i_iminus1);
        Vlist(:, i+1) = Ad_T * Vlist(:, i) + Alist(:, i) * dthetas(i);
        
        ad_V = ad(Vlist(:, i+1));
        term_coriolis = ad_V * (Alist(:, i) * dthetas(i));
        VdotList(:, i+1) = Ad_T * VdotList(:, i) + term_coriolis + Alist(:, i) * ddthetas(i);
    end

    % 3. 后向递推
    tau = zeros(n, 1);
    M_n_end = Mlist(:,:,n+1);
    F_next = Adjoint(TransInv(M_n_end))' * Ftip; 
    
    for i = n:-1:1
        Gi = Glist(:,:,i);
        Vi = Vlist(:, i+1);
        Vdoti = VdotList(:, i+1);
        
        F_inertial = Gi * Vdoti - ad(Vi)' * (Gi * Vi);
        
        if i < n
             T_next_curr = T_list(:,:,i+1);
             F_from_next = Adjoint(T_next_curr)' * F_next;
        else
             F_from_next = F_next;
        end
        
        Fi = F_inertial + F_from_next;
        tau(i) = Fi' * Alist(:, i);
        F_next = Fi;
    end
end

% --- 基础数学库 ---
function AdT = Adjoint(T)
    [R, p] = TransToRp(T);
    AdT = [R, zeros(3); VecToso3(p)*R, R];
end

function se3mat = VecTose3(V)
    w = V(1:3); v = V(4:6);
    se3mat = [VecToso3(w), v; 0 0 0 0];
end

function so3mat = VecToso3(omg)
    so3mat = [0, -omg(3), omg(2); omg(3), 0, -omg(1); -omg(2), omg(1), 0];
end

function adV = ad(V)
    w = V(1:3); v = V(4:6);
    adV = [VecToso3(w), zeros(3); VecToso3(v), VecToso3(w)];
end

function invT = TransInv(T)
    [R, p] = TransToRp(T);
    invT = [R', -R'*p; 0 0 0 1];
end

function [R, p] = TransToRp(T)
    R = T(1:3, 1:3);
    p = T(1:3, 4);
end

function T = MatrixExp6(se3mat)
    omgtheta = so3ToVec(se3mat(1:3, 1:3));
    if norm(omgtheta) < 1e-6
        T = [eye(3), se3mat(1:3, 4); 0 0 0 1];
    else
        theta = norm(omgtheta);
        omg = omgtheta / theta;
        omgmat = se3mat(1:3, 1:3) / theta;
        R = eye(3) + sin(theta)*omgmat + (1-cos(theta))*(omgmat^2);
        v = se3mat(1:3, 4) / theta;
        p = (eye(3)*theta + (1-cos(theta))*omgmat + (theta-sin(theta))*(omgmat^2)) * v;
        T = [R, p; 0 0 0 1];
    end
end

function omg = so3ToVec(so3mat)
    omg = [so3mat(3,2); so3mat(1,3); so3mat(2,1)];
end