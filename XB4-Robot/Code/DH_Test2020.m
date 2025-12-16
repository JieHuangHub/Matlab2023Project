% 清除环境
clear; close all; clc;

% 注意：Link的参数顺序为 [theta d a alpha]
L1 = Link([0 0.550 0.180 -pi/2]);
L2 = Link([-pi/2 0 0.680 0 ]);
L3 = Link([pi/2 0.165 0 pi/2]);
% L3 = Link([pi/2 0 -0.165 pi/2]); % L3的DH参数应该定义成这样
L4 = Link([0 0.842 0 -pi/2]);
L5 = Link([0 0 0 pi/2]);
L6 = Link([0 0.12 0 0 ]);
% 创建机器人模型，将所有链节按顺序组合
SDH_robot = SerialLink([L1 L2 L3 L4 L5 L6], 'name', 'SDHRobot');
view(3)

% SDH_robot.plot([0 0 0 0 0 0]);

% 设置机器人绘图参数（可选）
SDH_robot.display

SDH_robot.teach([0 -pi/2 pi/2 0 0 0]);