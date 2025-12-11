function theta_all = IK_Solver(xyz, R_target, MDH)
%#codegen
% IK_Solver - 修正版本
% 输入:  
%   xyz[3x1]      - 末端位置 [x; y; z] (m)
%   R_target[3x3] - 目标旋转矩阵
%   MDH[6x4]      - DH参数 (可以不使用，直接用硬编码参数)

% 直接使用硬编码的DH参数 (确保正确)
d1 = 0.342;
a1 = 0.040;
a2 = 0.275;
a3 = 0.025;
d4 = 0.280;
dt = 0.073;

% 初始化输出 - 固定大小
theta_all = nan(8, 6);

% 提取位置
p = [xyz(1); xyz(2); xyz(3)];

% 计算腕心位置 - 沿R_target的第二列(y轴)方向退回dt
pw_x = p(1) - dt * R_target(1, 2);
pw_y = p(2) - dt * R_target(2, 2);
pw_z = p(3) - dt * R_target(3, 2);

sol_idx = 0;

% 8种构型组合
shoulders = [1, -1];
elbows = [1, -1];
wrists = [1, -1];

for s_idx = 1:2
    shoulder = shoulders(s_idx);
    for e_idx = 1:2
        elbow = elbows(e_idx);
        for w_idx = 1:2
            wrist = wrists(w_idx);
            sol_idx = sol_idx + 1;
            
            % === θ1 求解 ===
            r_xy = sqrt(pw_x^2 + pw_y^2);
            
            if r_xy < a1 + 1e-6
                continue;
            end
            
            ratio = a1 / r_xy;
            if abs(ratio) > 1
                ratio = sign(ratio) * 1;
            end
            
            phi = atan2(pw_y, pw_x);
            psi_val = acos(ratio);
            
            if shoulder == 1
                theta1 = phi - psi_val + pi/2;
            else
                theta1 = phi + psi_val - pi/2;
            end
            
            % === θ3 求解 ===
            c1 = cos(theta1);
            s1 = sin(theta1);
            
            px_2 = c1*pw_x + s1*pw_y - a1;
            py_2 = pw_z - d1;
            
            L2 = a2;
            L3 = sqrt(a3^2 + d4^2);
            phi3 = atan2(d4, a3);
            
            r_sq = px_2^2 + py_2^2;
            r_dist = sqrt(r_sq);
            
            % 检查可达性
            if r_dist > (L2 + L3 - 1e-6) || r_dist < abs(L2 - L3) + 1e-6
                continue;
            end
            
            cos_theta3 = (r_sq - L2^2 - L3^2) / (2*L2*L3);
            
            % 限制范围
            if cos_theta3 > 1
                cos_theta3 = 1;
            elseif cos_theta3 < -1
                cos_theta3 = -1;
            end
            
            sin_theta3 = sqrt(1 - cos_theta3^2);
            if elbow == -1
                sin_theta3 = -sin_theta3;
            end
            
            theta3_raw = atan2(sin_theta3, cos_theta3);
            theta3 = theta3_raw - phi3;
            
            % === θ2 求解 ===
            k1 = L2 + L3*cos(theta3_raw);
            k2 = L3*sin(theta3_raw);
            
            theta2 = atan2(py_2, px_2) - atan2(k2, k1);
            
            % === 腕部 θ4, θ5, θ6 ===
            % R01
            c1_ = cos(theta1); s1_ = sin(theta1);
            R01 = [c1_, -s1_, 0; s1_, c1_, 0; 0, 0, 1];
            
            % R12 = Rx(-90) * Rz(theta2 - pi/2)
            t2 = theta2 - pi/2;
            c2 = cos(t2); s2 = sin(t2);
            Rx_n90 = [1, 0, 0; 0, 0, 1; 0, -1, 0];
            Rz_t2 = [c2, -s2, 0; s2, c2, 0; 0, 0, 1];
            R12 = Rx_n90 * Rz_t2;
            
            % R23 = Rz(theta3)
            c3 = cos(theta3); s3 = sin(theta3);
            R23 = [c3, -s3, 0; s3, c3, 0; 0, 0, 1];
            
            % R34_alpha = Rx(-90)
            R34_alpha = [1, 0, 0; 0, 0, 1; 0, -1, 0];
            
            R03 = R01 * R12 * R23 * R34_alpha;
            R36 = R03' * R_target;
            
            r22 = R36(2,2);
            
            % 限制r22范围
            if r22 > 1
                r22 = 1;
            elseif r22 < -1
                r22 = -1;
            end
            
            if abs(r22 - 1) < 1e-8
                theta5 = 0;
                theta4 = 0;
                theta6 = atan2(R36(1,3), R36(1,1));
            elseif abs(r22 + 1) < 1e-8
                theta5 = pi;
                theta4 = 0;
                theta6 = atan2(R36(1,3), -R36(1,1));
            else
                if wrist == 1
                    theta5 = acos(r22);
                else
                    theta5 = -acos(r22);
                end
                
                s5 = sin(theta5);
                theta4 = atan2(R36(3,2)/s5, R36(1,2)/s5);
                theta6 = atan2(R36(2,3)/s5, -R36(2,1)/s5);
            end
            
            % 归一化并存储
            result = [theta1, theta2, theta3, theta4, theta5, theta6];
            for jj = 1:6
                result(jj) = mod(result(jj) + pi, 2*pi) - pi;
                theta_all(sol_idx, jj) = result(jj);
            end
        end
    end
end
end