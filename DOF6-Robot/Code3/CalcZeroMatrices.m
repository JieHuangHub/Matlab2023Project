function [Ti_list, T0i_list] = CalcZeroMatrices(n_axis)
% CalcZeroMatrices 计算6自由度机器人的零位变换矩阵
% 输入：n_axis - 轴数开关（可选，默认6）
%        - 若n_axis=1：仅计算1轴的零位矩阵（T01）
%        - 若n_axis=2：计算1、2轴的单个零位矩阵 + 累积到2轴的矩阵（T02）
%        - 若n_axis=6：计算所有6个连杆的单个零位矩阵 + 所有累积矩阵
% 输出：
%   Ti_list  - 细胞数组，Ti_list{i} = 第i个连杆的零位变换矩阵T(i-1,i)（4×4）
%   T0i_list - 细胞数组，T0i_list{i} = 累积到第i轴的零位变换矩阵T0i（4×4）

    % 输入参数默认值（未指定时计算所有6轴）
    if nargin < 1
        n_axis = 6;
    end
    if n_axis < 1 || n_axis > 6
        error('n_axis必须是1-6之间的整数！');
    end

    % ===== 1. 定义你的DH参数（与原FKfcn一致） =====
    % DH_params每行：[d, a, alpha, offset] （修正原注释的参数顺序，避免混淆）
    % 原注释的theta(变量)是q(i)，零位时q(i)=0，实际theta = q(i)+offset = offset
    DH_params = [
        0.1245    0.035    -pi/2    0;        % Link 1: d1, a1, alpha1, offset1
        0         0.146     0       -pi/2;    % Link 2: d2, a2, alpha2, offset2
        0         0.052    -pi/2    0;        % Link 3: d3, a3, alpha3, offset3
        0.117     0         pi/2    0;        % Link 4: d4, a4, alpha4, offset4
        0         0        -pi/2    0;        % Link 5: d5, a5, alpha5, offset5
        0.0775    0         0       0;        % Link 6: d6, a6, alpha6, offset6
    ];

    % ===== 2. 初始化输出变量 =====
    Ti_list = cell(1, n_axis);   % 单个连杆的零位矩阵（T01, T12, ..., T56）
    T0i_list = cell(1, n_axis);  % 累积的零位矩阵（T01, T02, ..., T06）
    T_prev = eye(4);             % 累积矩阵的初始值（基座坐标系）

    % ===== 3. 循环计算零位矩阵 =====
    for i = 1:n_axis
        % 零位时q(i)=0，因此实际theta = 0 + offset
        offset  = DH_params(i, 4);
        theta   = offset;
        d       = DH_params(i, 1);
        a       = DH_params(i, 2);
        alpha   = DH_params(i, 3);
        
        % 预计算三角函数
        ct = cos(theta);
        st = sin(theta);
        ca = cos(alpha);
        sa = sin(alpha);
        
        % 标准DH变换矩阵（单个连杆i的零位矩阵 T(i-1,i)）
        Ti = [
            ct,   -st*ca,   st*sa,   a*ct;
            st,    ct*ca,  -ct*sa,   a*st;
             0,       sa,      ca,      d;
             0,        0,       0,      1
        ];
        
        % 保存单个连杆的零位矩阵
        Ti_list{i} = Ti;
        
        % 计算累积零位矩阵（T0i = T0(i-1) * T(i-1,i)）
        T_prev = T_prev * Ti;
        T0i_list{i} = T_prev;
    end

    % ===== 4. 可视化输出结果（便于查看） =====
    disp('==================== 零位变换矩阵计算结果 ====================');
    for i = 1:n_axis
        disp(['--- 第', num2str(i), '个连杆的零位矩阵 T', num2str(i-1), num2str(i), ' ---']);
        disp(Ti_list{i});
        disp(['--- 累积到第', num2str(i), '轴的零位矩阵 T0', num2str(i), ' ---']);
        disp(T0i_list{i});
        disp('--------------------------------------------------');
    end
end