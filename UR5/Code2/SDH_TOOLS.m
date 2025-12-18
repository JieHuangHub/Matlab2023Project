%% ================== UR5 标准DH建模 ==================
% clc; clear; close all;

%% 1. 定义 UR5 的标准 DH 参数（单位：m, rad）
L(1) = Link('d', 0.089159, 'a', 0,        'alpha',  pi/2,  'standard');
L(2) = Link('d', 0,        'a', -0.42500, 'alpha',  0,     'standard');
L(3) = Link('d', 0,        'a', -0.39225, 'alpha',  0,     'standard');
L(4) = Link('d', 0.10915,  'a', 0,        'alpha',  pi/2,  'standard');
L(5) = Link('d', 0.09465,  'a', 0,        'alpha', -pi/2,  'standard');
L(6) = Link('d', 0.08230,  'a', 0,        'alpha',  0,     'standard');

%% 2. 构建 SerialLink 机器人
UR5 = SerialLink(L, 'name', 'UR5');

%% 3. 显示 DH 参数
UR5.display();

%% 4. 交互式示教
figure;
UR5.teach();

% [1, 0.5, 1/3, 1, 1, 1]