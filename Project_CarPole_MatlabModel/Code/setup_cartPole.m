%% ===============================================================
% 文件名: setup_cartPole_robust.m
% 功能: 稳健版倒立摆NMPC - 解决速度慢、翘起问题
% ===============================================================

clear; clc; close all;

%% 1. 系统物理参数
global m M l g
m = 0.5;   % 摆杆质量 (kg)
M = 0.5;   % 小车质量 (kg)
l = 0.3;   % 摆杆半长 (m)
g = 9.81;  % 重力加速度 (m/s^2)

wheel_damping = 1e-5; % 1e-7
joint_damping = 1e-5;

%% 2. 初始状态设置
global x_0 y_0 q_0
x_0 = 0;                      
y_0 = 0.125;                  
q_0 = 15 * (pi / 180);        % 15度偏离

%% 3. 诊断：打印系统信息
fprintf('========== 系统参数 ==========\n');
fprintf('小车质量 M = %.2f kg\n', M);
fprintf('摆杆质量 m = %.2f kg\n', m);
fprintf('摆杆长度 l = %.2f m\n', l);
fprintf('初始角度 q0 = %.2f 度 (%.4f rad)\n', q_0*180/pi, q_0);
fprintf('==============================\n\n');

%% 4. 测试动力学函数
fprintf('测试动力学计算...\n');
test_state = [0; q_0; 0; 0];  % 静止状态，15度偏角
test_force = 5;
dX_test = testDynamics(test_state, test_force);
fprintf('测试通过！加速度: ddx=%.3f, ddq=%.3f\n\n', dX_test(3), dX_test(4));

%% 5. NMPC求解器初始化（带进度条）
fprintf('初始化NMPC求解器...\n');
tic;
global nmpc_solver nmpc_warmstart
[nmpc_solver, nmpc_warmstart] = initCartPoleNMPC_Fast();
init_time = toc;
fprintf('初始化完成！耗时: %.2f 秒\n\n', init_time);

fprintf('【就绪】可以运行Simulink模型了！\n');

%% ===============================================================
%                        函数定义
% ===============================================================

function dX = testDynamics(X, F)
% 测试动力学函数（与NMPC内部一致）
global m M l g

x = X(1); q = X(2); dx = X(3); dq = X(4);
f = F;

% 标准倒立摆动力学（q=0向上，顺时针为正）
s = sin(q);
c = cos(q);

% 方法1：经典形式
denom = M + m * s^2;
ddx = (f + m * s * (l * dq^2 + g * c)) / denom;
ddq = (-f * c - m * l * dq^2 * c * s - (M + m) * g * s) / (l * denom);

dX = [dx; dq; ddx; ddq];
end

function [nmpc_solver, warmstart] = initCartPoleNMPC_Fast()
import casadi.*

global m M l g

%% MPC参数（优化速度和稳定性平衡）
h = 20;          % 预测步数（减少以提高速度）
dt_MPC = 0.08;   % 采样周期（增大以降低计算频率）

fprintf('  预测时域: %d 步 x %.3f 秒 = %.2f 秒\n', h, dt_MPC, h*dt_MPC);

%% 创建优化变量
opti = casadi.Opti();
X = opti.variable(4, h + 1);  
F = opti.variable(1, h);      
X_init = opti.parameter(4, 1);

%% 代价函数（关键调整）
% 大幅增加角度权重，减少位置权重（允许小车移动换取平衡）
Q = diag([5, 3000, 0.5, 150]); % [x位置, 角度, x速度, 角速度]
R = 2.0;  % 控制权重（平滑控制）

J = 0;
X_des = [0; 0; 0; 0];

% 过程代价
for k = 1:h
    err = X(:, k) - X_des;
    J = J + err' * Q * err + R * F(k)^2;
    
    % 添加控制变化率惩罚（减少抖动）
    if k > 1
        J = J + 0.5 * (F(k) - F(k-1))^2;
    end
end

% 终端代价（更重要）
err_f = X(:, h+1) - X_des;
J = J + err_f' * (5*Q) * err_f;

opti.minimize(J);

%% 动力学约束（与测试函数完全一致）
for k = 1:h
    x_k = X(1,k); q_k = X(2,k); dx_k = X(3,k); dq_k = X(4,k);
    f_k = F(k);
    
    s = sin(q_k);
    c = cos(q_k);
    
    denom = M + m * s^2;
    ddx = (f_k + m * s * (l * dq_k^2 + g * c)) / denom;
    ddq = (-f_k * c - m * l * dq_k^2 * c * s - (M + m) * g * s) / (l * denom);
    
    % 显式欧拉积分
    opti.subject_to(X(1,k+1) == x_k + dt_MPC * dx_k);
    opti.subject_to(X(2,k+1) == q_k + dt_MPC * dq_k);
    opti.subject_to(X(3,k+1) == dx_k + dt_MPC * ddx);
    opti.subject_to(X(4,k+1) == dq_k + dt_MPC * ddq);
end

%% 约束
opti.subject_to(X(:, 1) == X_init);

% 控制力约束（关键：限制力矩避免翘起！）
F_max = 10;  % 降低最大力
opti.subject_to(-F_max <= F <= F_max);

% 状态约束
opti.subject_to(-3 <= X(1,:) <= 3);      % 位置限制
opti.subject_to(-pi/3 <= X(2,:) <= pi/3); % 角度限制±60度

%% 求解器配置（关键：快速求解）
opts = struct();
opts.ipopt.print_level = 0;
opts.print_time = false;
opts.ipopt.warm_start_init_point = 'yes';  % 热启动
opts.ipopt.max_iter = 50;                  % 限制迭代
opts.ipopt.tol = 5e-4;                     % 放宽容差
opts.ipopt.acceptable_tol = 1e-3;          % 可接受解
opts.ipopt.acceptable_iter = 5;            % 提前终止
opti.solver('ipopt', opts);

%% 生成求解器
nmpc_solver = opti.to_function('nmpc_solver', {X_init}, {F(:,1)}, {'p'}, {'u_opt'});

%% 创建热启动初值（加速首次求解）
warmstart.X = zeros(4, h+1);
warmstart.F = zeros(1, h);

fprintf('  求解器配置: 最大迭代=%d, 容差=%.0e\n', 50, 5e-4);
end

function Fx = cartPoleNMPC(states)
% NMPC控制器（Simulink调用）
persistent nmpc_solver_persistent
persistent solve_count last_solve_time

if isempty(nmpc_solver_persistent)
    global nmpc_solver
    nmpc_solver_persistent = nmpc_solver;
    solve_count = 0;
    last_solve_time = 0;
end

solve_count = solve_count + 1;

% 安全检查：角度过大直接用比例控制
if abs(states(2)) > pi/2
    Fx = -100 * states(2) - 20 * states(4);  % 紧急稳定
    fprintf('[紧急模式] 角度过大: %.1f度\n', states(2)*180/pi);
    return;
end

try
    tic;
    Fx = full(nmpc_solver_persistent(states));
    solve_time = toc;
    
    % 限幅（双重保险）
    Fx = max(-10, min(10, Fx));
    
    % 每10步打印一次性能
    if mod(solve_count, 10) == 0
        fprintf('[NMPC] 第%d次求解, 耗时: %.1f ms, 力: %.2f N\n', ...
                solve_count, solve_time*1000, Fx);
        fprintf('       状态: x=%.3f, θ=%.1f°, dx=%.2f, dθ=%.2f\n', ...
                states(1), states(2)*180/pi, states(3), states(4));
    end
    
    last_solve_time = solve_time;
    
catch e
    fprintf('[错误] NMPC求解失败: %s\n', e.message);
    fprintf('       状态: [%.3f, %.3f, %.3f, %.3f]\n', states);
    
    % 降级到PD控制
    Fx = -50 * states(2) - 10 * states(4) - 5 * states(1);
    fprintf('       切换到备用PD控制器, 力=%.2f\n', Fx);
end

end