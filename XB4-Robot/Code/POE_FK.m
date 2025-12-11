function KPS44 = POE_FK(Radian)
% FK using POE formula (space frame)
% 输入:  Radian[1x6] 六个关节角 (rad)
% 输出:  KPS44[4x4] 末端在基坐标系下的齐次变换矩阵

theta = Radian(:);  % 保证是 6x1 列向量

%% 1. 关节轴角速度方向 omega_i
w1 = [ 0;  0;  1];
w2 = [-1;  0;  0];
w3 = [-1;  0;  0];
w4 = [ 0;  1;  0];
w5 = [-1;  0;  0];
w6 = [ 0;  1;  0];

%% 2. 关节轴上一点 q_i  (mm)
q1 = [0; 0; 0] /1000; 
q2 = [0; 40; 342] /1000; 
q3 = [0; 40; 617] /1000; 
q4 = [0; 40; 642] /1000; 
q5 = [0; 320; 642] /1000; 
q6 = [0; 393; 642] /1000;

%% 3. 由 w 和 q 计算线速度向量 v = -w × q
v1 = -cross(w1, q1);
v2 = -cross(w2, q2);
v3 = -cross(w3, q3);
v4 = -cross(w4, q4);
v5 = -cross(w5, q5);
v6 = -cross(w6, q6);

% 每一列是一个螺旋轴 S_i = [w; v]
Slist = [ [w1; v1], ...
          [w2; v2], ...
          [w3; v3], ...
          [w4; v4], ...
          [w5; v5], ...
          [w6; v6] ];

%% 4. 零位姿态矩阵 M（home configuration）
% 这一项只需要算一次即可；这里我已经根据几何尺寸算好了：
M = [ 0 0 1 0.393; 
    0 -1 0 0.000; 
    1 0 0 0.642; 
    0 0 0 1 ];

%% 5. POE 正运动学：T(θ) = e^[S1]θ1 ... e^[S6]θ6 * M
T = eye(4);
for i = 1:6
    w = Slist(1:3,i);
    v = Slist(4:6,i);

    wx = w(1); wy = w(2); wz = w(3);
    w_hat = [   0  -wz   wy;
              wz    0  -wx;
             -wy   wx    0 ];

    se3mat = [w_hat, v;
              0 0 0 0];

    T = T * expm(se3mat * theta(i));
end

KPS44 = T * M;

end
