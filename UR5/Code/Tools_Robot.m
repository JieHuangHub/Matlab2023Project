 
%% ================== UR5 标准DH建模 ==================
clc; clear; close all;

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

%% 5. 测试关节角（rad）
q_test = [1, 0.5, 1/3, 1, 1, 1];

%% 6. 正运动学
T06 = UR5.fkine(q_test);
disp('正运动学 T06 = ');
disp(T06);

%% 7. 逆运动学（数值法）
q_ik = UR5.ikine(T06, q_test);   % 用 q_test 作为初值
disp('逆运动学解 q = ');
disp(q_ik);

%利用刚写的函数求正、逆运动学
B=zhengyundongxue(q_test);
disp('正运动学 B = ');
disp(B);

BB=niyundongxue(B);
disp('逆运动学解 BB = ');
disp(BB);
