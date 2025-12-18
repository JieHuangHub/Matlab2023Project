function points = drawing_circle(n, r, c, step)
% =========================================================
% DRAWING_CIRCLE
% 在任意空间平面生成圆轨迹
%
% 输入:
%   n     [1x3]   圆平面法向量
%   r     scalar  圆半径
%   c     [1x3]   圆心坐标
%   step  scalar  插值点数
%
% 输出:
%   points [N x 3] 圆轨迹点
% =========================================================

% 角度参数
theta = linspace(0, 2*pi, step)';

% 构造平面内两个正交单位向量 a、b
a = cross(n, [1 0 0]);
if norm(a) < 1e-6
    a = cross(n, [0 1 0]);
end
b = cross(n, a);

a = a / norm(a);
b = b / norm(b);

% 圆轨迹参数方程
x = c(1) + r*(a(1)*cos(theta) + b(1)*sin(theta));
y = c(2) + r*(a(2)*cos(theta) + b(2)*sin(theta));
z = c(3) + r*(a(3)*cos(theta) + b(3)*sin(theta));

points = [x y z];
end
