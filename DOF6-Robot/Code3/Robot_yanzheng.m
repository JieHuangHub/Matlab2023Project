% 清除环境
% clear; close all; clc;

% 注意：Link的参数顺序为 [theta d a alpha]
% L1 = Link([0 0.550 0.180 -pi/2]);
% L2 = Link([-pi/2 0 0.680 0 ]);
% % L3 = Link([pi/2 0.165 0 pi/2]);
% L3 = Link([pi/2 0 -0.165 pi/2]); % L3的DH参数应该定义成这样
% L4 = Link([0 0.842 0 -pi/2]);
% L5 = Link([0 0 0 pi/2]);
% L6 = Link([0 0.12 0 0 ]);

% dummy DH
% Link参数说明：[theta d a alpha sigma]，sigma=0（旋转关节，默认可省略）
% L1 = Link([0       0.550   0.180   -pi/2], 'standard'); % 显式指定标准DH
% L2 = Link([0       0       0.680    0   ], 'standard');
% L3 = Link([0       0      -0.165    pi/2], 'standard'); % 修正d/a参数
% L4 = Link([0       0.842   0       -pi/2], 'standard');
% L5 = Link([0       0       0        pi/2], 'standard');
% L6 = Link([0       0.12    0        0   ], 'standard');

% L1 = Link([ 0       0.342  0.040  -pi/2], 'standard');
% L2 = Link([ 0       0      0.275   0   ], 'standard');  % theta2 = q2 - pi/2
% L3 = Link([ 0       0      0.025  -pi/2], 'standard');
% L4 = Link([ 0       0.280  0       pi/2], 'standard');
% L5 = Link([ 0       0      0      -pi/2], 'standard');
% L6 = Link([ 0       0.073  0       0   ], 'standard');

% dummy MDH
% Link参数说明：[theta d a alpha sigma]，sigma=0（旋转关节，默认可省略）
% L1 = Link([0       0.550   0         0   ], 'modified'); % 显式指定标准DH
% L2 = Link([0       0       0.180    -pi/2], 'modified');
% L3 = Link([0       0       0.680     0   ], 'modified'); % 修正d/a参数
% L4 = Link([0       0.842   -0.165    pi/2], 'modified');
% L5 = Link([0       0       0         -pi/2], 'modified');
% L6 = Link([0       0.12    0         pi/2], 'modified');

% L1 = Link([0, 0.342, 0,      0    ], 'modified', 'offset', 0);       % 关节1
% L2 = Link([0, 0,     0.040, -pi/2 ], 'modified', 'offset', 0);   % 关节2（θ偏移-90°）
% L3 = Link([0, 0,     0.275,  0    ], 'modified', 'offset', 0);       % 关节3
% L4 = Link([0, 0.280, 0.025, -pi/2 ], 'modified', 'offset', 0);       % 关节4
% L5 = Link([0, 0,     0,      pi/2 ], 'modified', 'offset', 0);       % 关节5
% L6 = Link([0, 0.073, 0,     -pi/2 ], 'modified', 'offset', 0);       % 关节6

% 创建标准DH连杆（参数顺序：[theta, d, a, alpha]，类型'standard'）
% L1 = Link([0, 0.089459, 0,      pi/2  ], 'standard', 'offset', 0); % 关节1
% L2 = Link([0, 0,        -0.425, 0     ], 'standard', 'offset', 0); % 关节2
% L3 = Link([0, 0,        -0.39225,0     ], 'standard', 'offset', 0); % 关节3
% L4 = Link([0, 0.10915,  0,      pi/2  ], 'standard', 'offset', 0); % 关节4
% L5 = Link([0, 0.09465,  0,     -pi/2  ], 'standard', 'offset', 0); % 关节5
% L6 = Link([0, 0.0823,   0,      0     ], 'standard', 'offset', 0); % 关节6

% DH 
% L1 = Link([0, 0.400, 0.180,   pi/2], 'standard');  % Link1：α=90°
% L2 = Link([0, 0,     0.600,  0    ], 'standard');  % Link2：α=0°
% L3 = Link([0, 0,     0.120,   pi/2], 'standard');  % Link3：α=90°
% L4 = Link([0, 0.620,     0,   pi/2], 'standard');  % Link4：α=90°
% L5 = Link([0, 0,         0,   pi/2], 'standard');  % Link5：α=90°
% L6 = Link([0, 0.115,     0,  0    ], 'standard');  % Link6：α=0°

% SDHDummy DH
L1 = Link([ 0       0.1245   0.035  -pi/2], 'standard');
L2 = Link([ 0       0        0.146   0   ], 'standard');  
L3 = Link([ 0       0        0.052  -pi/2], 'standard');
L4 = Link([ 0       0.117    0       pi/2], 'standard');
L5 = Link([ 0       0        0      -pi/2], 'standard');
L6 = Link([ 0       0.0775   0       0   ], 'standard');

% XB4 MDH
% L1 = Link([0, 0.342, 0,      0    ], 'modified', 'offset', 0);
% L2 = Link([0, 0,     0.040, -pi/2 ], 'modified', 'offset', 0);
% L3 = Link([0, 0,     0.275,  0    ], 'modified', 'offset', 0);
% L4 = Link([0, 0.280, 0.025, -pi/2 ], 'modified', 'offset', 0);
% L5 = Link([0, 0,     0,      pi/2 ], 'modified', 'offset', 0);
% L6 = Link([0, 0.073, 0,     -pi/2 ], 'modified', 'offset', 0);

% L1 = Link([0, 0.4,   0.18,  1.5708], 'standard', 'offset', 0);
% L2 = Link([0, 0.135, 0.6,   3.14159], 'standard', 'offset', 0);
% L3 = Link([0, 0.135, 0.12, -1.5708], 'standard', 'offset', 0);
% L4 = Link([0, 0.62,  0,     1.5708], 'standard', 'offset', 0);
% L5 = Link([0, 0,     0,    -1.5708], 'standard', 'offset', 0);
% L6 = Link([0, 0,     0,     0], 'standard', 'offset', 0);

% MDH
% L1 = Link([0, 0.400, 0,      0    ], 'modified');  % MDH-L1：a₀=0, α₀=0
% L2 = Link([0, 0,     0.180,  -pi/2 ], 'modified');  % MDH-L2：a₁=0.180, α₁=π/2
% L3 = Link([0, 0,     0.600,  0    ], 'modified');  % MDH-L3：a₂=0.600, α₂=0
% L4 = Link([0, 0.620, 0.120,  -pi/2 ], 'modified');  % MDH-L4：a₃=0.120, α₃=π/2
% L5 = Link([0, 0,     0,      pi/2 ], 'modified');  % MDH-L5：a₄=0, α₄=π/2
% L6 = Link([0, 0.115, 0,      -pi/2 ], 'modified');  % MDH-L6：a₅=0, α₅=π/2


% 创建机器人模型，将所有链节按顺序组合
SDH_robot = SerialLink([L1 L2 L3 L4 L5 L6], 'name', 'SDHRobot');
view(3)

% SDH_robot.plot([0 0 0 0 0 0]);

% 设置机器人绘图参数（可选）
SDH_robot.display

% SDH_robot.teach([0 -pi/2 pi/2 0 0 0]);

SDH_robot.teach([0 0 0 0 0 0]);