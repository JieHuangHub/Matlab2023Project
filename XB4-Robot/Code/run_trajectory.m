function [Q, success] = run_trajectory(waypoints, attitude)
% run_trajectory 执行多点轨迹
% 输入: 
%   waypoints[3xN] - 路径点 [x; y; z] (m)，每列一个点
%   attitude       - 姿态模式 (默认 'down')
% 输出:
%   Q[Nx6]        - 各点的关节角 (rad)
%   success[Nx1]  - 各点是否求解成功

if nargin < 2
    attitude = 'down';
end

N = size(waypoints, 2);
Q = zeros(N, 6);
success = true(N, 1);

fprintf('========== 轨迹IK求解 ==========\n');
fprintf('姿态模式: %s\n', attitude);
fprintf('路径点数: %d\n\n', N);

for i = 1:N
    xyz = waypoints(: , i);
    
    try
        theta = IK_Position(xyz', attitude);
        
        if any(isnan(theta))
            success(i) = false;
            fprintf('点%d [%. 3f, %.3f, %.3f]:  无解!\n', i, xyz);
        else
            Q(i,: ) = theta;
            fprintf('点%d [%.3f, %.3f, %.3f]:  θ = [%.1f, %.1f, %.1f, %.1f, %.1f, %.1f]°\n', ...
                    i, xyz, rad2deg(theta));
        end
    catch ME
        success(i) = false;
        fprintf('点%d [%.3f, %.3f, %.3f]: 错误 - %s\n', i, xyz, ME.message);
    end
end

fprintf('\n求解完成:  %d/%d 成功\n', sum(success), N);
end