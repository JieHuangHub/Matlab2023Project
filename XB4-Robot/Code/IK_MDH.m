function theta_all = IK_MDH_v2(T_target)
%#codegen
% IK_MDH_v2 - 修正后的逆运动学
%
% 输入: 
%   T_target - 4x4 目标齐次变换矩阵
%
% 输出:
%   theta_all - 6x8 矩阵 (弧度)

    % MDH参数
    d1 = 0.342;
    a1 = 0.040;
    a2 = 0.275;
    a3 = 0.025;
    d4 = 0.280;
    d6 = 0.073;
    
    % 提取目标位姿
    R06 = T_target(1:3, 1:3);
    p06 = T_target(1:3, 4);
    
    ax = R06(1,3); ay = R06(2,3); az = R06(3,3);
    px = p06(1);   py = p06(2);   pz = p06(3);
    
    % 腕部中心
    pwx = px - d6 * ax;
    pwy = py - d6 * ay;
    pwz = pz - d6 * az;
    
    theta_all = nan(6, 8);
    
    % ==================== theta1 ====================
    if abs(pwx) < 1e-10 && abs(pwy) < 1e-10
        theta1_1 = 0;
        theta1_2 = pi;
    else
        theta1_1 = atan2(pwy, pwx);
        theta1_2 = atan2(-pwy, -pwx);
    end
    
    theta1_vals = [theta1_1, theta1_2];
    sol_idx = 0;
    
    for idx1 = 1:2
        theta1 = theta1_vals(idx1);
        c1 = cos(theta1);
        s1 = sin(theta1);
        
        % 投影到关节1平面
        pwx_1 = c1*pwx + s1*pwy;
        
        % 相对于关节2原点
        m = pwx_1 - a1;
        n = pwz - d1;
        r_sq = m^2 + n^2;
        r = sqrt(r_sq);
        
        % ==================== theta3 ====================
        L1 = a2;
        L2 = sqrt(a3^2 + d4^2);
        beta = atan2(d4, a3);
        
        % 余弦定理:   r^2 = L1^2 + L2^2 - 2*L1*L2*cos(gamma)
        % gamma是L1和L2之间的夹角
        cos_gamma = (L1^2 + L2^2 - r_sq) / (2 * L1 * L2);
        
        if cos_gamma > 1
            cos_gamma = 1;
        elseif cos_gamma < -1
            cos_gamma = -1;
        end
        
        gamma_1 = acos(cos_gamma);
        gamma_2 = -acos(cos_gamma);
        
        % theta3_actual = pi - gamma - beta
        % theta3 就是 theta3_actual (关节3无偏移)
        theta3_1 = pi - gamma_1 - beta;
        theta3_2 = pi - gamma_2 - beta;
        
        theta3_vals = [theta3_1, theta3_2];
        
        for idx3 = 1:2
            theta3 = theta3_vals(idx3);
            c3 = cos(theta3);
            s3 = sin(theta3);
            
            % ==================== theta2 ====================
            % 位置方程 (theta2_actual = theta2 - pi/2):
            % m = a2*sin(theta2_actual) + a3*sin(theta2_actual+theta3) + d4*cos(theta2_actual+theta3)
            % n = a2*cos(theta2_actual) + a3*cos(theta2_actual+theta3) - d4*sin(theta2_actual+theta3)
            %
            % 令 k1 = a2 + a3*c3 + d4*s3
            %    k2 = a3*s3 - d4*c3
            % m = k1*sin(theta2_actual) + k2*cos(theta2_actual)
            % n = k1*cos(theta2_actual) - k2*sin(theta2_actual)
            
            k1 = a2 + a3*c3 + d4*s3;
            k2 = a3*s3 - d4*c3;
            
            % theta2_actual = atan2(m, n) - atan2(k2, k1)
            theta2_actual = atan2(m, n) - atan2(k2, k1);
            
            % theta2 = theta2_actual + pi/2 (因为MDH偏移是-pi/2)
            theta2 = theta2_actual + pi/2;
            
            c2a = cos(theta2_actual);
            s2a = sin(theta2_actual);
            theta23a = theta2_actual + theta3;
            c23a = cos(theta23a);
            s23a = sin(theta23a);
            
            % ==================== theta4, theta5, theta6 ====================
            % 计算R03
            % R01 (绕z旋转theta1)
            % R12 (alpha=-pi/2, 绕z旋转theta2_actual)
            % R23 (alpha=0, 绕z旋转theta3)
            
            % 合并计算R03
            R03 = zeros(3,3);
            R03(1,1) = c1*c23a;
            R03(1,2) = -c1*s23a;
            R03(1,3) = s1;
            R03(2,1) = s1*c23a;
            R03(2,2) = -s1*s23a;
            R03(2,3) = -c1;
            R03(3,1) = s23a;
            R03(3,2) = c23a;
            R03(3,3) = 0;
            
            % R36 = R03' * R06
            R36 = R03' * R06;
            
            % 从R36提取欧拉角
            % 根据MDH关节4,5,6的结构
            % alpha3=-pi/2, alpha4=pi/2, alpha5=-pi/2
            
            r13 = R36(1,3);
            r23 = R36(2,3);
            r33 = R36(3,3);
            r31 = R36(3,1);
            r32 = R36(3,2);
            r11 = R36(1,1);
            r12 = R36(1,2);
            r21 = R36(2,1);
            r22 = R36(2,2);
            
            % 对于标准的腕关节 (ZYZ型或类似)
            % theta5 由 r33 确定
            
            if abs(r33) > 0.9999
                % 奇异:   theta5 ≈ 0 或 pi
                if r33 > 0
                    theta5 = 0;
                    theta4 = 0;
                    theta6 = atan2(r21, r11);
                else
                    theta5 = pi;
                    theta4 = 0;
                    theta6 = atan2(-r21, -r11);
                end
            else
                % 一般情况
                theta5 = acos(r33);
                theta4 = atan2(r23, r13);
                theta6 = atan2(r32, -r31);
            end
            
            % 存储解
            sol_idx = sol_idx + 1;
            theta_all(: , sol_idx) = [theta1; theta2; theta3; theta4; theta5; theta6];
            
            % 翻转解
            if abs(theta5) < 1e-6 || abs(theta5 - pi) < 1e-6
                theta_all(:, sol_idx+4) = theta_all(:, sol_idx);
            else
                theta5_flip = -theta5;
                theta4_flip = wrapToPi_m(theta4 + pi);
                theta6_flip = wrapToPi_m(theta6 + pi);
                theta_all(:, sol_idx+4) = [theta1; theta2; theta3; theta4_flip; theta5_flip; theta6_flip];
            end
        end
    end
    
    % 归一化
    for c = 1:8
        for r = 1:6
            if ~isnan(theta_all(r,c))
                theta_all(r,c) = wrapToPi_m(theta_all(r,c));
            end
        end
    end
end

function y = wrapToPi_m(x)
    y = mod(x + pi, 2*pi) - pi;
end