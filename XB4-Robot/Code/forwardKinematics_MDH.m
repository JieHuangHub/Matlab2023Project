function T = forwardKinematics_MDH(theta, MDH)
%#codegen
% forwardKinematics_MDH - MDH正运动学
%
% 输入:
%   theta - 6x1 关节角度 (弧度)
%   MDH   - 6x4 MDH参数 [a, alpha, d, theta_offset]
%
% 输出:
%   T - 4x4 末端齐次变换矩阵

    T = eye(4);
    
    for i = 1:6
        a_i = MDH(i, 1);
        alpha_i = MDH(i, 2);
        d_i = MDH(i, 3);
        theta_offset_i = MDH(i, 4);
        
        theta_i = theta(i) + theta_offset_i;
        
        ct = cos(theta_i);
        st = sin(theta_i);
        ca = cos(alpha_i);
        sa = sin(alpha_i);
        
        % MDH变换矩阵
        Ti = [ct,    -st,    0,    a_i;
              st*ca,  ct*ca, -sa, -sa*d_i;
              st*sa,  ct*sa,  ca,  ca*d_i;
              0,      0,      0,   1];
        
        T = T * Ti;
    end
end