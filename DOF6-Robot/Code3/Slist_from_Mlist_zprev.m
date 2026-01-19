function [wlist, rlist, Slist] = Slist_from_Mlist_zprev(Mlist)
% Assumption: joint i axis is z-axis of frame {i-1} at home, expressed in {0}
    n = size(Mlist,3) - 1;          % M01..M_n,n+1  => n joints
    T = eye(4);                      % T0,0
    wlist = zeros(3,n);
    rlist = zeros(3,n);
    Slist = zeros(6,n);

    z = [0;0;1];

    for i = 1:n
        R = T(1:3,1:3);
        p = T(1:3,4);

        w = R*z;         % z-axis of frame {i-1} in space
        r = p;           % origin of frame {i-1} in space

        v = -cross(w, r);

        wlist(:,i) = w;
        rlist(:,i) = r;
        Slist(:,i) = [w; v];

        % advance to next frame: T0,i = T0,i-1 * M_{i-1,i}
        T = T * Mlist(:,:,i);
    end
end
