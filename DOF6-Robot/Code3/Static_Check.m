%% 6) 验证环节：静态重力矩校验 (修正符号版)
disp('=====================================');
disp('       开始静态重力校验 (Static Check)       ');
disp('=====================================');

% 提取重力加速度向量
g_acc = g_vec; % [0; 0; -9.81]

% 1. 计算每个连杆在世界坐标系下的 绝对质心位置
P_com_global = zeros(3, 6);
Masses = zeros(6, 1);

for i = 1:6
    % 提取质量
    m_i = Glist(4,4,i); 
    Masses(i) = m_i;
    
    % 反推局部质心 p_local
    % G = [I, m*S(p); m*S(p)', m*I]
    m_Sp = Glist(1:3, 4:6, i);
    p_local = [m_Sp(3,2); m_Sp(1,3); m_Sp(2,1)] / m_i; 
    
    % 关节 i 的原点位置 (r_i)
    r_vecs = [r1, r2, r3, r4, r5, r6]; 
    r_current_joint = r_vecs(:, i);
    
    % 全局质心 = 关节位置 + 局部偏置
    P_com_global(:, i) = r_current_joint + p_local;
end

% 2. 物理计算：电机力矩 = -(重力产生的力矩)
tau_static = zeros(6, 1);

for i = 1:6
    % 当前关节轴方向
    z_axis = Slist(1:3, i); 
    
    % 当前关节位置
    r_vecs = [r1, r2, r3, r4, r5, r6];
    p_joint = r_vecs(:, i);
    
    moment_by_gravity = [0; 0; 0];
    
    % 累加后续连杆重力产生的力矩
    for j = i:6
        % 力臂
        arm_vector = P_com_global(:, j) - p_joint;
        % 重力
        force_gravity = Masses(j) * g_acc;
        
        % 重力产生的力矩 (Gravity Load)
        moment_by_gravity = moment_by_gravity + cross(arm_vector, force_gravity);
    end
    
    % !!! 关键修正 !!!
    % 电机需要输出的力矩 = - 重力力矩
    tau_holding = - dot(moment_by_gravity, z_axis);
    
    tau_static(i) = tau_holding;
end

%% 7) 比较结果
error = norm(tau - tau_static);

disp('关节 | RNEA电机力矩 | 物理平衡力矩 | 误差');
for i = 1:6
    fprintf('  %d  | %10.4f  | %10.4f     | %10.4e\n', ...
        i, tau(i), tau_static(i), abs(tau(i) - tau_static(i)));
end

disp('-------------------------------------');
% 考虑到浮点数精度，放宽一点点误差限
if error < 1e-10
    disp('✅ 验证成功：动力学解算与物理静力学完全一致！');
else
    disp('❌ 验证失败：请检查是否存在其他坐标系定义问题。');
end