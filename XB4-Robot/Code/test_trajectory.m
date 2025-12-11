%% 测试你的路径点
clc; clear;

% 你的路径点 (m)
wp = [0.393 0 0.64; 
      0.275 0 0.53; 
      0.475 0 0.53; 
      0.475 0 0.33; 
      0.275 0 0.33; 
      0.275 0 0.53; 
      0.393 0 0.64]';

%% 方式1: 逐点求解
fprintf('============ 方式1: 逐点求解 ============\n\n');

for i = 1:size(wp, 2)
    xyz = wp(:, i)';
    theta = IK_Position(xyz, 'front');
    
    fprintf('点%d:  [%.3f, %.3f, %.3f] m\n', i, xyz);
    fprintf('    关节角: [%.2f, %.2f, %.2f, %.2f, %.2f, %.2f]°\n', rad2deg(theta));
    
    % 验证
    T_verify = FK_MDH(theta);
    pos_actual = T_verify(1:3, 4)';
    err = norm(pos_actual - xyz) * 1000;
    fprintf('    验证位置: [%.3f, %. 3f, %.3f] m, 误差: %.2f mm\n\n', pos_actual, err);
end

%% 方式2: 使用轨迹函数
fprintf('\n============ 方式2: 轨迹函数 ============\n\n');

[Q, success] = run_trajectory(wp, 'front');

%% 可视化关节角变化
figure('Name', '关节角轨迹');
t = 1:size(Q, 1);

for j = 1:6
    subplot(2, 3, j);
    plot(t, rad2deg(Q(: , j)), 'b-o', 'LineWidth', 1.5);
    xlabel('路径点');
    ylabel('角度 (°)');
    title(sprintf('关节 %d', j));
    grid on;
end
sgtitle('各关节角度变化');

%% 3D轨迹可视化
figure('Name', '3D轨迹');
plot3(wp(1,: ), wp(2,:), wp(3,:), 'b-o', 'LineWidth', 2, 'MarkerSize', 10);
hold on;
plot3(wp(1,1), wp(2,1), wp(3,1), 'go', 'MarkerSize', 15, 'LineWidth', 3);  % 起点
plot3(wp(1,end), wp(2,end), wp(3,end), 'rs', 'MarkerSize', 15, 'LineWidth', 3);  % 终点
xlabel('X (m)');
ylabel('Y (m)');
zlabel('Z (m)');
title('末端轨迹');
grid on;
axis equal;
legend('轨迹', '起点', '终点');
view(45, 30);