function q = inverse_kinematics_6dof(pos, robot)

x = pos(1);
y = pos(2);
z = pos(3);

a = robot.a;
d = robot.d;

%% wrist center（假设末端工具沿Z方向）
xc = x;
yc = y;
zc = z - d(6);

%% Joint 1
q1 = atan2(yc, xc);

%% 平面距离
r = sqrt(xc^2 + yc^2) - a(1);
s = zc - d(1);

a2 = a(2);
a3 = a(3);
d4 = d(4);

L = sqrt(a3^2 + d4^2);

D = (r^2 + s^2 - a2^2 - L^2) / (2*a2*L);
D = max(-1, min(1, D));

q3 = atan2(sqrt(1-D^2), D);

phi = atan2(L*sin(q3), a2 + L*cos(q3));
q2 = atan2(s, r) - phi;

%% Wrist simplified
q4 = 0;
q5 = -(q2+q3);
q6 = 0;

q = [q1; q2; q3; q4; q5; q6];

%% 关节限位
for i=1:6
    q(i) = min(max(q(i), robot.joint_limits(i,1)), robot.joint_limits(i,2));
end
