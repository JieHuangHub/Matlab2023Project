
% SDHDummy DH
L1 = Link('d', 0.1245, 'a', 0.035, 'alpha', -pi/2, 'standard');
L2 = Link('d', 0,      'a', 0.146, 'alpha', 0,     'offset', -pi/2,'standard');
L3 = Link('d', 0,      'a', 0.052, 'alpha', -pi/2, 'standard');
L4 = Link('d', 0.117,  'a', 0,     'alpha', pi/2,  'standard');
L5 = Link('d', 0,      'a', 0,     'alpha', -pi/2, 'standard');
L6 = Link('d', 0.0775, 'a', 0,     'alpha', 0,     'standard');

SDH_robot = SerialLink([L1 L2 L3 L4 L5 L6], 'name', 'SDHRobot');  % 直接传入Link数组

view(3)

% SDH_robot.plot([0 0 0 0 0 0]);

% 设置机器人绘图参数（可选）
SDH_robot.display

SDH_robot.teach([0 0 0 0 0 0]);