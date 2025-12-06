function K = cartPoleLQR

global M m l g 

%% state space matrices:
A = [ 0,               0,     1, 0;
      0,               0,     0, 1;
      0,          m*g/M,      0, 0;
      0, (M+m)*g/(l*M),       0, 0 ];

B = [0; 0; 1/M; 1/(l*M)];

C = eye(4);

D = 0;

Q = diag([100, 100, 1, 1]); % x q dx dq  位置 角度， 速度 角速度

R = 1;

K = lqr(ss(A,B,C,D), Q, R);    % u = -K x

end