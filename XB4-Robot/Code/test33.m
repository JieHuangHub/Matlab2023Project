%% 测试IK_MDH函数
clc; clear;

% 目标位置和姿态
R = [1, 0, 0;
     0, 1, 0;
     0, 0, 1];
p = [0.275; 0; 0.53];

T_target = [R, p; 0, 0, 0, 1];

disp('目标位姿: ');
disp('位置:  '); disp(p');
disp('姿态:  '); disp(R);

% 求逆解
theta_all = IK_MDH(T_target);

disp('8组逆运动学解 (弧度):');
disp(theta_all);

disp('8组逆运动学解 (角度):');
disp(rad2deg(theta_all));

% 期望结果
theta_expected = [0; -0.1201; 0.5164; 0; 0; 0];
disp('期望结果 (弧度):');
disp(theta_expected');

% 验证每组解
disp('========== 验证每组解 ==========');
for i = 1:8
    if ~any(isnan(theta_all(: ,i)))
        T_verify = FK_MDH(theta_all(: ,i)');
        pos_error = norm(T_verify(1:3,4) - p);
        rot_error = norm(T_verify(1:3,1:3) - R, 'fro');
        fprintf('解%d: 位置误差=%.6f, 姿态误差=%.6f\n', i, pos_error, rot_error);
        
        % 检查是否接近期望解
        if norm(theta_all(:,i) - theta_expected) < 0.1
            fprintf('  *** 这是期望的解!  ***\n');
        end
    end
end