function KPS44 = FK_MDH(Radian)
% FK using Modified DH parameters - V3
% 尝试把d4放在关节3的d参数中

theta = Radian(:);

%% Modified DH 参数 - 方案2
% 如果d4实际上是关节3到关节4沿Z方向的偏移
%   i    α_{i-1}    a_{i-1}     d_i      θ_offset
MDH = [
    0,          0,          0.342,      0;        % J1
    -pi/2,      0.040,      0,         -pi/2;    % J2
    0,          0.275,      0,          0;        % J3: d改为0.280
    -pi/2,      0.025,      0.280,      0;        % J4: d改为0
    pi/2,       0,          0,          0;        % J5
    -pi/2,      0,          0.073,      0;        % J6
];

%% 正运动学
T = eye(4);

for i = 1:6
    alpha = MDH(i,1);
    a     = MDH(i,2);
    d     = MDH(i,3);
    offset= MDH(i,4);
    
    theta_i = theta(i) + offset;
    
    ct = cos(theta_i);
    st = sin(theta_i);
    ca = cos(alpha);
    sa = sin(alpha);
    
    T_i = [ct,    -st,     0,      a;
           st*ca,  ct*ca, -sa,    -sa*d;
           st*sa,  ct*sa,  ca,     ca*d;
           0,      0,      0,      1];
    
    T = T * T_i;
end

KPS44 = T;
end