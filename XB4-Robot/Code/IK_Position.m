function theta = IK_Position(xyz, attitude)
% IK_Position 基于末端XYZ坐标的逆运动学
% 输入:  
%   xyz[3x1 or 1x3] - 末端位置 [x, y, z] (m)
%   attitude        - 可选，姿态模式: 
%                     'down'  - 工具垂直向下 (默认)
%                     'front' - 工具水平向前
%                     或 [3x3] 旋转矩阵
% 输出: 
%   theta[1x6] - 关节角 (rad)
%
% DH参数:  d1=0. 342; a1=0.040; a2=0.275; a3=0.025; d4=0.280; dt=0.073

if nargin < 2
    attitude = 'down';  % 默认工具垂直向下
end

xyz = xyz(: )';  % 转为行向量

%% 根据姿态模式设定目标旋转矩阵
if ischar(attitude)
    switch attitude
        case 'down'
            % 工具垂直向下，末端z轴指向-Z，x轴指向+X
            R_target = [ 1,  0,  0;
                         0, -1,  0;
                         0,  0, -1];
        case 'front'
            % 工具水平向前，末端z轴指向+X
            R_target = [ 0,  0,  1;
                         0, -1,  0;
                         1,  0,  0];
        case 'up'
            % 工具垂直向上
            R_target = [-1,  0,  0;
                         0, -1,  0;
                         0,  0,  1];
        otherwise
            error('未知姿态模式:  %s', attitude);
    end
else
    % 直接使用输入的旋转矩阵
    R_target = attitude;
end

%% 构建完整的齐次变换矩阵
T_target = eye(4);
T_target(1:3, 1:3) = R_target;
T_target(1:3, 4) = xyz(:);

%% 调用完整IK求解
theta_all = IK_MDH_Full(T_target);

%% 选择最优解 (选择关节运动最小的解)
q_home = [0, 0, 0, 0, 0, 0];  % 参考位置
theta = select_best_solution(theta_all, q_home);

end

%% ==================== 完整IK求解 ====================
function theta_all = IK_MDH_Full(T_target)
% 完整的解析逆运动学

%% DH 参数 (m)
d1 = 0.342;
a1 = 0.040;
a2 = 0.275;
a3 = 0.025;
d4 = 0.280;
dt = 0.073;

%% 提取目标位姿
R = T_target(1:3, 1:3);
p = T_target(1:3, 4);

%% 初始化解
theta_all = nan(8, 6);
sol_idx = 0;

%% 计算腕心位置
% 根据零位姿 M，末端工具沿 y6 方向延伸 dt
pw = p - dt * R(1:3, 2);

pwx = pw(1);
pwy = pw(2);
pwz = pw(3);

%% 遍历所有构型
for shoulder = [1, -1]
    for elbow = [1, -1]
        for wrist = [1, -1]
            sol_idx = sol_idx + 1;
            
            try
                %% === θ1 求解 ===
                r_xy = sqrt(pwx^2 + pwy^2);
                
                if r_xy < a1
                    continue;  % 无解
                end
                
                phi = atan2(pwy, pwx);
                psi = acos(a1 / r_xy);
                
                if shoulder == 1
                    theta1 = phi - psi + pi/2;
                else
                    theta1 = phi + psi - pi/2;
                end
                
                %% === θ3 求解 ===
                c1 = cos(theta1);
                s1 = sin(theta1);
                
                % 腕心在关节2坐标系下的位置
                px_2 = c1*pwx + s1*pwy - a1;
                py_2 = pwz - d1;
                
                % 等效连杆长度
                L2 = a2;
                L3 = sqrt(a3^2 + d4^2);
                phi3 = atan2(d4, a3);
                
                r_sq = px_2^2 + py_2^2;
                
                cos_theta3 = (r_sq - L2^2 - L3^2) / (2*L2*L3);
                
                if abs(cos_theta3) > 1
                    continue;  % 超出工作空间
                end
                
                if elbow == 1
                    theta3_raw = atan2(sqrt(1 - cos_theta3^2), cos_theta3);
                else
                    theta3_raw = atan2(-sqrt(1 - cos_theta3^2), cos_theta3);
                end
                
                theta3 = theta3_raw - phi3;
                
                %% === θ2 求解 ===
                k1 = L2 + L3*cos(theta3_raw);
                k2 = L3*sin(theta3_raw);
                
                theta2 = atan2(py_2, px_2) - atan2(k2, k1);
                
                %% === θ4, θ5, θ6 求解 (腕部) ===
                % 计算 R_0^3
                R01 = rotz(theta1);
                R12 = rotx(-pi/2) * rotz(theta2 - pi/2);
                R23 = rotz(theta3);
                R34_alpha = rotx(-pi/2);
                
                R03 = R01 * R12 * R23 * R34_alpha;
                
                % 腕部旋转 R_3^6
                R36 = R03' * R;
                
                % 从R36提取 θ4, θ5, θ6
                % 腕部结构:  Ry(θ4) * [Rx(-90)*Rz(θ5)] * [Rx(-90)*Rz(θ6)]
                
                % 简化:  检查R36(2,2)判断θ5
                r22 = R36(2,2);
                
                if abs(r22 - 1) < 1e-10
                    % θ5 ≈ 0，奇异
                    theta5 = 0;
                    theta4 = 0;
                    theta6 = atan2(R36(1,3), R36(1,1));
                elseif abs(r22 + 1) < 1e-10
                    % θ5 ≈ π，奇异
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
                
                %% 存储解
                theta_all(sol_idx, :) = [theta1, theta2, theta3, theta4, theta5, theta6];
                
            catch
                continue;
            end
        end
    end
end

% 角度归一化
theta_all = wrapToPi(theta_all);
end

%% ==================== 选择最优解 ====================
function theta_best = select_best_solution(theta_all, q_ref, weights)

if nargin < 3
    weights = [1, 1, 1, 0.5, 0.5, 0.5];  % 基座关节权重更高
end

min_cost = inf;
theta_best = nan(1, 6);

for i = 1:size(theta_all, 1)
    if ~any(isnan(theta_all(i,:)))
        diff = wrapToPi(theta_all(i,:) - q_ref);
        cost = sum(weights .* diff.^2);
        
        if cost < min_cost
            min_cost = cost;
            theta_best = theta_all(i,:);
        end
    end
end

if any(isnan(theta_best))
    warning('IK无解！目标点可能超出工作空间');
end
end

%% ==================== 辅助函数 ====================
function R = rotx(a)
R = [1 0 0; 0 cos(a) -sin(a); 0 sin(a) cos(a)];
end

function R = rotz(a)
R = [cos(a) -sin(a) 0; sin(a) cos(a) 0; 0 0 1];
end

function a = wrapToPi(a)
a = mod(a + pi, 2*pi) - pi;
end