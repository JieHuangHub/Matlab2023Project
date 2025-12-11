%% ============== 6轴机械臂系统初始化(XB4 / XB7) ===============

% clear; clc;

%% 1. 模式选择
% XB4 → mode = 0
% XB7 → mode = 1
mode = 0;   % ← 修改这里即可
if mode == 0
    % ==== XB4 参数 ====
    d1=0.342; a1=0.040; a2=0.275; a3=0.025; d4=0.280; dt=0.073; d3=0;
else
    % ==== XB7 参数 ====
    d1=0.380; a1=0.030; a2=0.340; a3=0.035; d4=0.345; dt=0.087; d3=0;
end

%% 2. DH 参数矩阵（你给的 D_H）
robot.DH = [
    a1,   pi/2,  d1,  0;
    a2,   0,     0,   0;
    a3,   pi/2,  d3,  0;
    0,   -pi/2,  d4,  0;
    0,    pi/2,  0,   0;
    0,    0,     dt,  0
];

% DH 解包
robot.a     = robot.DH(:,1)';
robot.alpha = robot.DH(:,2)';
robot.d     = robot.DH(:,3)';
robot.theta_offset = robot.DH(:,4)';

%% 3. 关节限位 (参考工业臂)
robot.joint_limits = [
    -170 170;
    -90  140;
    -150 150;
    -300 300;
    -120 120;
    -360 360
] * pi/180;

%% 4. 真实动力学参数（全部来自你给的数据）  
dynamics.m = [m1; m2; m3; m4; m5; m6];

dynamics.mc = [
    mc11 mc12 mc13;
    mc21 mc22 mc23;
    mc31 mc32 mc33;
    mc41 mc42 mc43;
    mc51 mc52 mc53;
    mc61 mc62 mc63
];

dynamics.I = {
    [Ic111 0      0;     0 Ic122 0;     0 0 Ic133];
    [Ic211 0      0;     0 Ic222 0;     0 0 Ic233];
    [Ic311 0      0;     0 Ic322 0;     0 0 Ic333];
    [Ic411 0      0;     0 Ic422 0;     0 0 Ic433];
    [Ic511 0      0;     0 Ic522 0;     0 0 Ic533];
    [Ic611 0      0;     0 Ic622 0;     0 0 Ic633]
};

dynamics.gravity = 9.802;

%% 摩擦参数（目前为零）
dynamics.fv = [fv1; fv2; fv3; fv4; fv5; fv6]; 
dynamics.fc = [fc1; fc2; fc3; fc4; fc5; fc6];

%% 关节惯性
dynamics.Ia = [Ia1; Ia2; Ia3; Ia4; Ia5; Ia6];

%% 5. 末端轨迹：矩形
wp = [0.393 0 0.64;
      0.275 0 0.53;
      0.475 0 0.53;
      0.475 0 0.33;
      0.275 0 0.33;
      0.275 0 0.53;
      0.393 0 0.64]';

traj.total_time = 30;
traj.sample_time = 0.01;
traj.num_points = size(wp,2);

%% 6. PID参数（不变，可后续自动调参）
control.Kp = [100;150;120;80;60;40];
control.Ki = [5;8;6;4;3;2];
control.Kd = [20;25;20;15;10;8];
control.torque_limit = [50;50;30;20;15;10];

%% 7. 初始逆运动学
q_init = inverse_kinematics_6dof(wp(:,1), robot);

%% 保存
save('robot_arm_params.mat',"robot","dynamics","traj","control","wp","q_init");

disp("==== 真实 XB 系列 6轴机械臂参数已加载 ====");
disp("初始关节角(°):");
disp(q_init'*180/pi);
