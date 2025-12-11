function [best_MDH, error] = optimize_MDH_params()
% 通过优化找到最佳MDH参数以匹配POE正运动学
% 测试多组θ角度，最小化位置和姿态误差

%% 目标POE零位姿
T_target = [0   0   1   0.393;
            0  -1   0   0.000;
            1   0   0   0.642;
            0   0   0   1.000];

%% 测试角度集
test_angles = [
    0, 0, 0, 0, 0, 0;
    pi/6, 0, 0, 0, 0, 0;
    0, pi/4, 0, 0, 0, 0;
    0, 0, pi/3, 0, 0, 0;
    pi/6, pi/4, -pi/6, pi/4, -pi/6, pi/4;
];

%% 初始MDH参数猜测 [alpha, a, d, offset]
% 基于几何分析的初始值
MDH_init = [
    0,      0,      0.342,   0;      % J1
    pi/2,   0,      0.040,   pi/2;   % J2
    0,      0.275,  0,       0;      % J3
    pi/2,   0.025,  0,       0;      % J4
    -pi/2,  0,      0.280,   0;      % J5
    pi/2,   0,      0.073,   0;      % J6
];

%% 优化目标函数
objective = @(x) compute_error(x, test_angles, @FK);

% 将MDH参数展开为向量 (只优化alpha和offset，固定a和d)
x0 = [MDH_init(:,1); MDH_init(:,4)];  % [alphas; offsets]

% 优化选项
options = optimoptions('fminunc', 'Display', 'iter', ...
                       'MaxIterations', 500, ...
                       'Algorithm', 'quasi-newton');

% 运行优化
[x_opt, fval] = fminunc(objective, x0, options);

% 重建最佳MDH参数
best_MDH = MDH_init;
best_MDH(:,1) = x_opt(1:6);
best_MDH(:,4) = x_opt(7:12);

error = fval;

fprintf('\n========== 优化后的MDH参数 ==========\n');
fprintf('Joint  alpha(deg)   a(m)      d(m)      offset(deg)\n');
for i = 1:6
    fprintf('%d      %8.2f    %8.5f  %8.5f  %8.2f\n', ...
        i, rad2deg(best_MDH(i,1)), best_MDH(i,2), ...
        best_MDH(i,3), rad2deg(best_MDH(i,4)));
end

fprintf('\n总误差: %.6f\n', error);
end

function err = compute_error(x, test_angles, fk_poe)
% 计算当前MDH参数与POE的误差
MDH = [x(1:6), [0; 0; 0.275; 0.025; 0; 0], ...
       [0.342; 0.040; 0; 0; 0.280; 0.073], x(7:12)];

err = 0;
for k = 1:size(test_angles, 1)
    theta = test_angles(k,:);
    T_poe = fk_poe(theta);
    T_mdh = compute_FK_MDH(theta, MDH);
    
    % 位置误差
    pos_err = norm(T_poe(1:3,4) - T_mdh(1:3,4));
    
    % 姿态误差 (Frobenius范数)
    rot_err = norm(T_poe(1:3,1:3) - T_mdh(1:3,1:3), 'fro');
    
    err = err + pos_err*1000 + rot_err*10;  % 加权
end
end

function T = compute_FK_MDH(theta, MDH)
% 内部MDH正运动学
T = eye(4);
for i = 1:6
    alpha = MDH(i,1);
    a = MDH(i,2);
    d = MDH(i,3);
    offset = MDH(i,4);
    
    theta_i = theta(i) + offset;
    ct = cos(theta_i);
    st = sin(theta_i);
    ca = cos(alpha);
    sa = sin(alpha);
    
    T_i = [ct, -st, 0, a;
           st*ca, ct*ca, -sa, -sa*d;
           st*sa, ct*sa, ca, ca*d;
           0, 0, 0, 1];
    T = T * T_i;
end
end