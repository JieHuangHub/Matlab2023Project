function tau = InverseDynamics(thetas, dthetas, ddthetas, g, Ftip, Mlist, Glist, Slist)
% INVERSEDYNAMICS 计算串联机械臂的逆动力学
%
% 输入:
%   thetas:   n x 1 关节角
%   dthetas:  n x 1 关节角速度
%   ddthetas: n x 1 关节角加速度
%   g:        3 x 1 重力向量 (例如 [0; 0; -9.81])
%   Ftip:     6 x 1 末端受力 (空间力 Wrench: [力矩; 力])
%   Mlist:    4 x 4 x (n+1) 初始位姿列表 (M_0_1, M_1_2, ... M_n_end)
%   Glist:    6 x 6 x n 空间惯量矩阵列表
%   Slist:    6 x n 空间螺旋轴列表
%
% 输出:
%   tau:      n x 1 关节力矩向量

    % 1. 参数提取与初始化
    n = size(thetas, 1);
    
    % 初始化 M_i-1_i (当前关节相对上一关节的变换矩阵)
    % 注意：Mlist(:,:,i) 存储的是 M_{i-1, i}
    Mi = eye(4); 
    
    % 将空间螺旋轴 Slist 转换为体螺旋轴 Blist (Ai)
    % 这里的逻辑是：Ai = Ad_inv(M_0_i) * Si
    Alist = zeros(6, n);
    M_0_i = eye(4); % 累积变换 M_0_1 * M_1_2 ...
    
    for i = 1:n
        M_0_i = M_0_i * Mlist(:,:,i);     % 计算基座到当前连杆i的零位变换
        Alist(:, i) = Adjoint(TransInv(M_0_i)) * Slist(:, i); 
    end

    % 2. 前向递推 (Forward Iteration): 计算速度 V 和 加速度 Vdot
    % Vlist, VdotList 存储在体坐标系下的值
    Vlist = zeros(6, n+1);    % V0 ... Vn
    VdotList = zeros(6, n+1); % Vdot0 ... Vdotn
    
    % 初始化基座状态 (V0=0, Vdot0用重力模拟)
    % Vdot0 设置为重力的反向加速度，等效于重力作用
    % g = [gx, gy, gz], Vdot0 = [0;0;0; -g] 因为 Vdot 是 [ang_acc; lin_acc]
    VdotList(:, 1) = [0; 0; 0; -g]; 
    
    % 保存各连杆间的变换矩阵 T_i_iminus1 (T_{i, i-1}) 供后向使用
    T_list = zeros(4, 4, n+1); 

    for i = 1:n
        % 计算 T_{i-1, i} = M_{i-1, i} * exp( [Ai] * theta )
        % 但我们需要 T_{i, i-1} = T_{i-1, i}^-1
        % T_{i, i-1} = exp( -[Ai] * theta ) * M_{i-1, i}^-1
        
        M_i_iminus1 = TransInv(Mlist(:,:,i));
        T_i_iminus1 = MatrixExp6(VecTose3(Alist(:,i) * -thetas(i))) * M_i_iminus1;
        
        T_list(:,:,i) = T_i_iminus1; % 存起来
        
        % 速度传递: V_i = Ad_T_i_i-1 * V_i-1 + A_i * dtheta_i
        Ad_T = Adjoint(T_i_iminus1);
        Vlist(:, i+1) = Ad_T * Vlist(:, i) + Alist(:, i) * dthetas(i);
        
        % 加速度传递: Vdot_i = Ad_T * Vdot_i-1 + ad_Vi * (Ai*dtheta) + Ai*ddtheta
        % ad_Vi * Ai*dtheta 这一项就是科里奥利力项 (Lie Bracket)
        ad_V = ad(Vlist(:, i+1));
        term_coriolis = ad_V * (Alist(:, i) * dthetas(i));
        
        VdotList(:, i+1) = Ad_T * VdotList(:, i) + term_coriolis + Alist(:, i) * ddthetas(i);
    end

    % 3. 后向递推 (Backward Iteration): 计算力 F 和 力矩 tau
    tau = zeros(n, 1);
    
    % 处理末端受力: Ftip 是末端施加给环境的力，反作用力是 -Ftip? 
    % 通常 Ftip 定义为环境施加给末端的力。如果是这样直接用。
    % 这里我们假设输入的 Ftip 是“末端Link受到的外力”。
    % 我们需要把它转换到 Link n 的坐标系。
    % Mlist(:,:,n+1) 是 Link_n 到 EndEffector 的变换 M_n_end
    % 假设 Ftip 是在 EndEffector 坐标系定义的，需变换回 Link n
    M_n_end = Mlist(:,:,n+1);
    F_next = Adjoint(TransInv(M_n_end))' * Ftip; 
    
    for i = n:-1:1
        Gi = Glist(:,:,i);
        Vi = Vlist(:, i+1);
        Vdoti = VdotList(:, i+1);
        
        % 牛顿-欧拉方程 (空间形式):
        % F_i = G * Vdot - ad_V' * (G * V) + Ad_T_next_curr' * F_next
        
        % 惯性项 + 陀螺力矩项
        F_inertial = Gi * Vdoti - ad(Vi)' * (Gi * Vi);
        
        % 加上来自下一个连杆传递回来的力
        % 如果 i < n, 需要变换 F_{i+1} 到 F_i
        if i < n
             % T_{i+1, i} 来自前面的 T_list
             % 前面存的是 T_{i, i-1} (第i个), 所以 T_{i+1, i} 是 T_list(:,:,i+1)
             T_next_curr = T_list(:,:,i+1);
             F_from_next = Adjoint(T_next_curr)' * F_next;
        else
             % 如果是最后一个连杆，F_from_next 已经是我们上面算的 Ftip 转换后的
             F_from_next = F_next;
        end
        
        Fi = F_inertial + F_from_next;
        
        % 提取关节力矩: 投影到关节轴 Ai 上
        tau(i) = Fi' * Alist(:, i);
        
        % 更新 F_next 给下一次循环
        F_next = Fi;
    end
end

%% ============ 依赖的辅助函数 (若已有库可删除) ============

function AdT = Adjoint(T)
    [R, p] = TransToRp(T);
    AdT = [R, zeros(3); VecToso3(p)*R, R];
end

function se3mat = VecTose3(V)
    % V = [w; v]
    w = V(1:3); v = V(4:6);
    se3mat = [VecToso3(w), v; 0 0 0 0];
end

function so3mat = VecToso3(omg)
    so3mat = [0, -omg(3), omg(2);
              omg(3), 0, -omg(1);
             -omg(2), omg(1), 0];
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
    % 简化的指数映射 (罗德里格斯公式)
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