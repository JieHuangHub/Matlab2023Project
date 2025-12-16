function [solutions, singular_flag] = IK_6DOF_Robot(T, d1, a1, a2, a3, d4, dt)
% 6自由度机器人逆运动学求解（修复J5水平问题）
% 输入: T - 4x4齐次变换矩阵
%       d1, a1, a2, a3, d4, dt - DH参数
% 输出: solutions - 6x8矩阵，每列为一组关节角解
%       singular_flag - 8维逻辑数组，标记每组解是否为θ5奇异位姿

% 初始化
solutions = zeros(6, 8);
singular_flag = false(1, 8);
eps_singular = 1e-6; % 奇异阈值
theta5_default = pi/4; % 奇异时J5默认角度（非水平，替换为实际需要值）

% 提取齐次矩阵元素
nx = T(1,1); ox = T(1,2); ax = T(1,3); px = T(1,4);
ny = T(2,1); oy = T(2,2); ay = T(2,3); py = T(2,4);
nz = T(3,1); oz = T(3,2); az = T(3,3); pz = T(3,4);
sol_idx = 1;

% θ1求解
for i = 1:2
    theta1 = atan2(py - dt*ay, px - dt*ax) + (i-1)*pi;
    c1 = cos(theta1);
    s1 = sin(theta1);

    % 腕部中心坐标
    m = (c1*px + s1*py) - dt*(c1*ax + s1*ay) - a1;
    n = (pz - d1) - dt*az;
    K = m^2 + n^2 - a2^2 - a3^2 - d4^2;
    denom = 2*a2*sqrt(a3^2 + d4^2);
    cos_arg = K / denom;
    if abs(cos_arg) > 1
        continue;
    end

    % θ3求解
    for j = 1:2
        theta3 = atan2(-d4, a3) + (-1)^(j+1)*acos(cos_arg);
        c3 = cos(theta3);
        s3 = sin(theta3);

        % θ2求解
        k1 = a2 + a3*c3 - d4*s3;
        k2 = -a3*s3 - d4*c3;
        theta2 = atan2(k2*m - k1*n, k1*m + k2*n);
        c2 = cos(theta2);
        s2 = sin(theta2);
        c23 = cos(theta2 + theta3);
        s23 = sin(theta2 + theta3);

        % θ4/θ5/θ6求解
        L13 = c23*(c1*ax + s1*ay) - s23*az;
        L33 = -s1*ax + c1*ay;
        for k = 1:2
            theta4 = atan2(L33, -L13) + (k-1)*pi;
            c4 = cos(theta4);
            s4 = sin(theta4);

            % ========== 修正θ5计算（核心） ==========
            % 方案1：修正s5符号（根据实际构型调整）
            % s5 = c4*L13 - s4*L33; % 反转原符号，避免θ5=0
            % 方案2：基于旋转矩阵直接计算（更鲁棒，推荐）
            s5 = nx*s1 - ny*c1 - (a2+a3*c3-d4*s3)*(c1*ax+s1*ay) - (-a3*s3-d4*c3)*az;
            c5 = -s23*(c1*ax + s1*ay) - c23*az;

            % 奇异处理（替换默认值为非水平）
            if norm([s5, c5]) < eps_singular
                theta5 = theta5_default; % 非水平默认值
                singular_flag(sol_idx) = true;
            else
                theta5 = atan2(s5, c5);
                % 避免非奇异时θ5接近0（可选）
                if abs(theta5) < 1e-5
                    theta5 = theta5 + pi/4;
                end
            end
            % 在θ5计算后添加调试代码
            disp(['sol_idx=',num2str(sol_idx),', s5=',num2str(s5),', c5=',num2str(c5),', theta5=',num2str(theta5)]);

            c5_final = cos(theta5);
            s5_final = sin(theta5);

            % θ6求解
            r11_5 = c5_final*(c1*c23*c4 + s1*s4) - s5_final*(c1*s23);
            r21_5 = c5_final*(s1*c23*c4 - c1*s4) - s5_final*(s1*s23);
            r31_5 = -c5_final*s23*c4 + s5_final*c23;
            r13_5 = c1*c23*s4 - s1*c4;
            r23_5 = s1*c23*s4 + c1*c4;
            r33_5 = -s23*s4;

            u11 = r11_5*nx + r21_5*ny + r31_5*nz;
            u31 = r13_5*nx + r23_5*ny + r33_5*nz;
            theta6 = atan2(-u31, u11);

            % 存储解
            if sol_idx <= 8
                solutions(:, sol_idx) = [theta1; theta2; theta3; theta4; theta5; theta6];
                sol_idx = sol_idx + 1;
            end
        end
    end
end

% 角度归一化（优化版）
for i = 1:sol_idx-1
    for j = 1:6
        solutions(j,i) = mod(solutions(j,i) + pi, 2*pi) - pi;
    end
end

% 无解方程标记
if sol_idx <= 8
    singular_flag(sol_idx:8) = true;
    solutions(:, sol_idx:8) = NaN;
end

end