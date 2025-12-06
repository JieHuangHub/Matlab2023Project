function Fx = cartPoleNMPC(states)
tic
import casadi.*
%% states:
X_1 = states; % x q dx dq

%% desired commands:
X_des = [0;0;0;0]; 

%% mpc parameters
h = 60; % # of horizons
dt_MPC = 0.01; % sec

%% desired reference:
X_ref = generateReference(X_1,X_des,h);

%% nmpc setup in CasADi:
nmpc = casadi.Opti();
X = nmpc.variable(4,h); % 4xh
F = nmpc.variable(1,h); % 1xh 

%% constraints:
nmpc.subject_to ( X(:,1) == X_1 ); %IC = current states

for k = 1 : h-1
    % dynamics:
    dX = cartPoleDynamics(X(:, k), F(:, k));
    nmpc.subject_to( X(:, k+1) == X(:, k) + dt_MPC*dX );
    nmpc.subject_to( -50 <= F(:,k) <= 50);   % revised
end

%% cost function:
Q = diag([800,1700,120, 120 ]); % x q dx dq
R = 3e-3; % fx

J = 0;
for k = 1 : h
    J = J + (X_ref(:,k) - X(:,k))' * Q ... 
        * (X_ref(:,k) - X(:,k)) + R * F(:,k)^2;
end

nmpc.minimize(J);

%% solve!
p_opts = struct('expand',true);
nmpc.solver('ipopt', p_opts);
solution = nmpc.solve();
Fx = solution.value(F);
Fx = Fx(1);

toc
end


%% %%%%% functions %%%%%%
function x_ref = generateReference(x,x_des,h)
    x_ref = zeros(4, h);
    for i = 1 : 4
        x_ref(i,:) = linspace(x(i), x_des(i), h);
    end
end

function dX = cartPoleDynamics(X, f)
global m M l g Ic
q = X(2);
dx = X(3);
dq = X(4);
x = X(1);

full dynamics:
ddx = ( 13*m*l*sin(q)*dq^2+13*-f-12*m*g*cos(q)*sin(q) ) /...
    ( 13*M + 13*m -12*m*cos(q)^2 );
ddq = ( -12*(m*l*cos(q)*sin(q)*dq^2 + -f*cos(q)+m*g*sin(q)) +M*g*sin(q) ) / ...
    ( l*(13*M+13*m-12*m*cos(q)^2) );
dX = [dx; dq; ddx ; ddq];

% H11 = M + m;
% H12 = m*l*cos(q);
% H22 = Ic + m*l^2;
% 
% C1  = - m*l*sin(q)*dq^2;
% C2  =   m*g*l*sin(q);
% 
% H = [H11, H12; H12, H22];
% b = [u + C1; -C2];
% 
% dd  = H \ b;
% dX = [dx; dq; dd(1); dd(2)];
end