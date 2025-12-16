function [solutions, singular_flag] = IK_MDH_Robot(T, d1, a1, a2, a3, d4, dt)
% 6自由度机器人逆运动学 - 适配MDH参数（关节2有-90°偏置）
% 输入: T - 4x4齐次变换矩阵 (来自FK_MDH)
%       d1=0.342, a1=0.040, a2=0.275, a3=0.025, d4=0.280, dt=0.073
% 输出: solutions - 6x8矩阵, singular_flag - 奇异标记

solutions = zeros(6, 8);
singular_flag = false(1, 8);
eps_singular = 1e-6;

% 提取目标位姿
nx = T(1,1); ox = T(1,2); ax = T(1,3); px = T(1,4);
ny = T(2,1); oy = T(2,2); ay = T(2,3); py = T(2,4);
nz = T(3,1); oz = T(3,2); az = T(3,3); pz = T(3,4);

sol_idx = 1;

% 腕心位置
pwx = px - dt*ax;
pwy = py - dt*ay;
pwz = pz - dt*az;

%% θ1 求解
for i = 1:2
    theta1 = atan2(pwy, pwx) + (i-1)*pi;
    c1 = cos(theta1);
    s1 = sin(theta1);
    
    % 腕心在基座XZ平面的投影
    rho = c1*pwx + s1*pwy;  % 水平距离（带符号）
    m = rho - a1;           % 减去a1偏移
    n = pwz - d1;           % 垂直距离
    
    %% θ3 求解
    D_sq = m^2 + n^2;
    L3 = sqrt(a3^2 + d4^2);  % 等效连杆长度
    
    cos_beta = (D_sq - a2^2 - L3^2) / (2*a2*L3);
    
    if abs(cos_beta) > 1 + 1e-10
        continue;
    end
    cos_beta = max(-1, min(1, cos_beta));
    
    for j = 1:2
        beta = (-1)^j * acos(cos_beta);  % a2与L3之间的夹角
        phi = atan2(d4, a3);             % L3内部偏角
        
        % ★ MDH下的θ3（这是关键！）
        theta3 = beta + phi;
        
        c3 = cos(theta3);
        s3 = sin(theta3);
        
        %% θ2 求解
        % 等效臂长
        A = a2 + a3*c3 + d4*s3;
        B = a3*s3 - d4*c3;
        
        % ★ MDH下θ2的计算（含-90°偏置补偿）
        alpha = atan2(n, m);
        gamma = atan2(B, A);
        theta2_internal = alpha - gamma;  % 实际旋转角
        
        % MDH输出 = 内部角 + 90° (补偿偏置)
        theta2 = theta2_internal + pi/2;
        
        % 用于后续计算的角度
        c2i = cos(theta2_internal);
        s2i = sin(theta2_internal);
        c23 = cos(theta2_internal + theta3);
        s23 = sin(theta2_internal + theta3);
        
        %% θ4, θ5, θ6 求解（球形手腕）
        % 计算 R_0^3 的转置作用在目标Z轴上
        % 根据MDH坐标系推导：
        r13 = -s23*(c1*ax + s1*ay) - c23*az;  % 对应s5*c4
        r23 = s1*ax - c1*ay;                   % 对应s5*s4  
        r33 = c23*(c1*ax + s1*ay) - s23*az;   % 对应c5
        
        for k = 1:2
            %% θ4 求解
            if abs(r13) < eps_singular && abs(r23) < eps_singular
                % θ5 = 0 奇异，θ4可任意取
                theta4 = 0;
                singular_flag(sol_idx) = true;
            else
                theta4 = atan2(r23, r13) + (k-1)*pi;
            end
            c4 = cos(theta4);
            s4 = sin(theta4);
            
            %% θ5 求解
            s5 = r13*c4 + r23*s4;
            c5 = r33;
            
            if abs(s5) < eps_singular && abs(c5) < eps_singular
                theta5 = 0;
                singular_flag(sol_idx) = true;
            else
                theta5 = atan2(s5, c5);
            end
            
            %% θ6 求解
            % R_0^3^T 作用在目标X轴和Y轴上
            r11 = -s23*(c1*nx + s1*ny) - c23*nz;
            r21 = s1*nx - c1*ny;
            r12 = -s23*(c1*ox + s1*oy) - c23*oz;
            r22 = s1*ox - c1*oy;
            
            s6 = -r21*c4 + r11*s4;
            c6 = r22*c4 - r12*s4;
            
            if abs(sin(theta5)) < eps_singular
                % θ5≈0奇异，θ4+θ6耦合
                theta6 = atan2(-r12, r11) - theta4;
            else
                theta6 = atan2(s6, c6);
            end
            
            % 存储解
            if sol_idx <= 8
                solutions(:, sol_idx) = [theta1; theta2; theta3; theta4; theta5; theta6];
                sol_idx = sol_idx + 1;
            end
        end
    end
end

% 角度归一化到[-π, π]
for i = 1:sol_idx-1
    for j = 1:6
        solutions(j,i) = mod(solutions(j,i) + pi, 2*pi) - pi;
    end
end

% 标记无效解
if sol_idx <= 8
    singular_flag(sol_idx:8) = true;
    solutions(:, sol_idx:8) = NaN;
end
end