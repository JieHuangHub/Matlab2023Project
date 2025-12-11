function KPS44 = FK(Radian)

%% 输入关节角（单位 rad）
theta1 = Radian(1);
theta2 = Radian(2);
theta3 = Radian(3);
theta4 = Radian(4);
theta5 = Radian(5);
theta6 = Radian(6);

%% -------- 1. Modified DH 参数 --------
d1 = 342; 
a1 = 40;  alpha1 = -pi/2;

d2 = 0;   
a2 = 275; alpha2 = 0;

d3 = 0;   
a3 = 25;  alpha3 = -pi/2;

d4 = 280; 
a4 = 0;   alpha4 = pi/2;

d5 = 0;   
a5 = 0;   alpha5 = -pi/2;

dt = 73;
d6 = dt;  
a6 = 0;   alpha6 = 0;

%% -------- 2. 建立 DH 变换函数 --------
DH = @(a,alpha,d,theta) [ ...
    cos(theta)            -sin(theta)             0              a;
    sin(theta)*cos(alpha) cos(theta)*cos(alpha)  -sin(alpha)  -sin(alpha)*d;
    sin(theta)*sin(alpha) cos(theta)*sin(alpha)   cos(alpha)   cos(alpha)*d;
    0                     0                       0              1 ];

%% -------- 3. 计算 T1 ~ T6 --------
T1 = DH(a1,alpha1,d1,theta1);
T2 = DH(a2,alpha2,d2,theta2);
T3 = DH(a3,alpha3,d3,theta3);
T4 = DH(a4,alpha4,d4,theta4);
T5 = DH(a5,alpha5,d5,theta5);
T6 = DH(a6,alpha6,d6,theta6);

%% -------- 4. Base 与 Tool 变换矩阵（教材给的）--------
Tbase = [1 0 0 0;
         0 1 0 0;
         0 0 1 0;
         0 0 0 1];

Ttool = [1 0 0 0;
         0 1 0 0;
         0 0 1 0;
         0 0 0 1];

%% -------- 5. 输出机器人末端位姿 --------
KPS44 = Tbase * T1 * T2 * T3 * T4 * T5 * T6 * Ttool;

end
