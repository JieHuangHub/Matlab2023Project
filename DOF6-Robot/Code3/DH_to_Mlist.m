function Mlist = DH_to_Mlist(DH, M_tool)
%#codegen
%DH_to_Mlist  Convert standard DH parameters to Mlist (home transforms)
%
% Inputs:
%   DH     : n×4 matrix, each row [a_i, d_i, alpha_i, theta_offset_i]
%            (standard DH: Rotz(theta)*Transz(d)*Transx(a)*Rotx(alpha))
%   M_tool : (optional) 4×4 fixed transform from frame {n} to {n+1}
%            If omitted, use eye(4).
%
% Output:
%   Mlist  : 4×4×(n+1), where:
%            Mlist(:,:,1)   = M01
%            Mlist(:,:,2)   = M12
%            ...
%            Mlist(:,:,n)   = M_{n-1,n}
%            Mlist(:,:,n+1) = M_{n,n+1} (= M_tool or I)

    if nargin < 2
        M_tool = eye(4);
    end

    n = size(DH, 1);
    Mlist = zeros(4,4,n+1);

    for i = 1:n
        a     = DH(i,1);
        d     = DH(i,2);
        alpha = DH(i,3);
        th0   = DH(i,4);   % theta offset defines home (theta=0)

        Mlist(:,:,i) = Rotz(th0) * Transz(d) * Transx(a) * Rotx(alpha);
    end

    Mlist(:,:,n+1) = M_tool;
end

% -------- helper transforms --------
function R = Rotx(a)
    ca = cos(a); sa = sin(a);
    R = [1 0 0 0;
         0 ca -sa 0;
         0 sa  ca 0;
         0 0 0 1];
end

function R = Rotz(t)
    ct = cos(t); st = sin(t);
    R = [ct -st 0 0;
         st  ct 0 0;
         0   0  1 0;
         0   0  0 1];
end

function T = Transx(x)
    T = [1 0 0 x;
         0 1 0 0;
         0 0 1 0;
         0 0 0 1];
end

function T = Transz(z)
    T = [1 0 0 0;
         0 1 0 0;
         0 0 1 z;
         0 0 0 1];
end
