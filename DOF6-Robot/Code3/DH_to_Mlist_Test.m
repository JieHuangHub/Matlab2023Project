

% DH(i,:) = [a_i, d_i, alpha_i, theta_offset_i]
DH = [
    0.1245    0.035    -pi/2    0;        % Link 1 (offset=0)
    0         0.146     0       -pi/2;    % Link 2 (offset=-pi/2)
    0         0.052    -pi/2    0;        % Link 3 (offset=0)
    0.117     0         pi/2    0;        % Link 4 (offset=0)
    0         0        -pi/2    0;        % Link 5 (offset=0)
    0.0775    0         0       0;        % Link 6 (offset=0)
];

Mlist = DH_to_Mlist(DH);       % 默认最后一节 M_{n,n+1}=I

% fprintf(Mlist);

% 或者你有工具坐标系：
% Mlist = DH_to_Mlist(DH, M_tool);
