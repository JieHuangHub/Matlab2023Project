%% Function
function K = cartPoleLQR

global M m l g

% state space matrices:
A = [ 0, 0, 1, 0;
      0, 0, 0, 1;
      0, m*g/M, 0, 0;
      0, (M+m)*g/(l*M), 0, 0 ];
B = [0; 0; 1/M; 1/(l*M)];
C = eye(4);
D = 0;

% 增大位置和角度的权重，提高响应速度
Q = diag([ 20, 100, 10, 20 ]);   % [x, q, dx, dq]
R = 0.9;

K = lqr(ss(A,B,C,D), Q, R); % u = -K x

end