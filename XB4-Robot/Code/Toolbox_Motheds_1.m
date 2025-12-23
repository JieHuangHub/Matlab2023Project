%% 1. 定义XB4机器人连杆（键值对格式：'d'/'a'/'alpha'）
% 格式：Link('d', 连杆偏距, 'a', 连杆长度, 'alpha', 连杆扭角, 'standard')
% 注：旋转关节的theta默认初始值为0，无需额外指定
% L(1) = Link('d', 0.342,  'a', 0.040,  'alpha', -pi/2,  'standard');
% L(2) = Link('d', 0,      'a', 0.275,  'alpha',  0,     'standard');  
% L(3) = Link('d', 0,      'a', 0.025,  'alpha', -pi/2,  'standard');
% L(4) = Link('d', 0.280,  'a', 0,      'alpha',  pi/2,  'standard');
% L(5) = Link('d', 0,      'a', 0,      'alpha', -pi/2,  'standard');
% L(6) = Link('d', 0.073,  'a', 0,      'alpha',  0,     'standard');

% XB4 MDH
% L1 = Link([0, 0.342, 0,      0    ], 'modified', 'offset', 0);
% L2 = Link([pi/2, 0,     0.040, -pi/2 ], 'modified', 'offset', 0);
% L3 = Link([0, 0,     0.275,  0    ], 'modified', 'offset', 0);
% L4 = Link([0, 0.280, 0.025, -pi/2 ], 'modified', 'offset', 0);
% L5 = Link([0, 0,     0,      pi/2 ], 'modified', 'offset', 0);
% L6 = Link([0, 0.073, 0,     -pi/2 ], 'modified', 'offset', 0);


% XB4 DH    [theta d a alpha]
L1 = Link([ 0       0.342  0.040  -pi/2], 'standard');
L2 = Link([ 0       0      0.275   0   ], 'standard'); 
L3 = Link([ 0       0      0.025  -pi/2], 'standard');
L4 = Link([ 0       0.280  0       pi/2], 'standard');
L5 = Link([ 0       0      0      -pi/2], 'standard');
L6 = Link([ 0       0.073  0       0   ], 'standard');


%% 2. 构建串联机器人模型
XB4 = SerialLink([L1 L2 L3 L4 L5 L6], 'name', 'XB4');

%% 3. 显示XB4的DH参数（验证键值对参数是否正确加载）
XB4.display();

%% 4. 交互式示教界面（与原UR5代码交互逻辑完全一致）
figure('Name','XB4机器人交互式示教');
XB4.teach([0 0 0 0 0 0]);