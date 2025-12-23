% 注意：Link的参数顺序为 [theta d a alpha]


% L1 = Link([0 0.550 0.180 -pi/2]);
% L2 = Link([-pi/2 0 0.680 0 ]);
% % L3 = Link([pi/2 0.165 0 pi/2]);
% L3 = Link([pi/2 0 -0.165 pi/2]); % L3的DH参数应该定义成这样
% L4 = Link([0 0.842 0 -pi/2]);
% L5 = Link([0 0 0 pi/2]);
% L6 = Link([0 0.12 0 0 ]);

% XB4 DH
% L1 = Link([ 0       0.342  0.040  -pi/2], 'standard');
% L2 = Link([ 0       0      0.275   0   ], 'standard');  % theta2 = q2 - pi/2
% L3 = Link([ 0       0      0.025  -pi/2], 'standard');
% L4 = Link([ 0       0.280  0       pi/2], 'standard');
% L5 = Link([ 0       0      0      -pi/2], 'standard');
% L6 = Link([ 0       0.073  0       0   ], 'standard');

% SDHDummy DH
L1 = Link([ 0       0.1245   0.035  -pi/2], 'standard');
L2 = Link([ 0       0        0.146   0   ], 'standard');  % theta2 = q2 - pi/2
L3 = Link([ 0       0        0.052  -pi/2], 'standard');
L4 = Link([ 0       0.117    0       pi/2], 'standard');
L5 = Link([ 0       0        0      -pi/2], 'standard');
L6 = Link([ 0       0.0775   0       0   ], 'standard');

% Revised SDH Dummy
% L1 = Link([0       0.1245   0.035   -pi/2], 'standard'); % 显式指定标准DH
% L2 = Link([0       0        0.146    0   ], 'standard');
% L3 = Link([0       0       -0.052    pi/2], 'standard'); % 修正d/a参数
% L4 = Link([0       0.117    0       -pi/2], 'standard');
% L5 = Link([0       0        0        pi/2], 'standard');
% L6 = Link([0       0.0775   0        0   ], 'standard');


% dummy DH
% L1 = Link([ 0       0.550  0.180  -pi/2], 'standard');
% L2 = Link([ 0       0      0.680   0   ], 'standard');  % theta2 = q2 - pi/2
% L3 = Link([ 0       0      0.165  -pi/2], 'standard');
% L4 = Link([ 0       0.842  0       pi/2], 'standard');
% L5 = Link([ 0       0      0      -pi/2], 'standard');
% L6 = Link([ 0       0.120  0       0   ], 'standard');


% % L1 = Link([0       0.550   0.180   -pi/2], 'standard'); % 显式指定标准DH
% % L2 = Link([0       0       0.680    0   ], 'standard');
% % L3 = Link([0       0      -0.165    pi/2], 'standard'); % 修正d/a参数
% % L4 = Link([0       0.842   0       -pi/2], 'standard');
% % L5 = Link([0       0       0        pi/2], 'standard');
% % L6 = Link([0       0.12    0        0   ], 'standard');


% 创建机器人模型，将所有链节按顺序组合
SDH_robot = SerialLink([L1 L2 L3 L4 L5 L6], 'name', 'SDHRobot');
view(3)

% SDH_robot.plot([0 0 0 0 0 0]);

% 设置机器人绘图参数（可选）
SDH_robot.display

SDH_robot.teach([0 0 0 0 0 0]);