function T = ForwardKinematics(thetalist, Mlist, Slist)
    % 输入:
    %   thetalist: n维关节角度向量
    %   Mlist:     相对位置矩阵列表 (用于计算Home Position的全局M)
    %   Slist:     空间坐标系下的螺旋轴矩阵 (每列为一个轴)
    % 输出:
    %   T:         4x4 齐次变换矩阵 (基座 -> 末端)

    % 1. 计算全局 Home Position (M)
    %    Mlist 包含 M01, M12, M23, M34... 需要链式相乘得到 M_base_end
    M = eye(4);
    num_transforms = size(Mlist, 3);
    for i = 1:num_transforms
        M = M * Mlist(:, :, i); 
    end

    % 2. 应用指数积公式 (PoE in Space Frame)
    %    T = e^(S1*t1) * ... * e^(Sn*tn) * M
    T_exponentials = eye(4);
    n = length(thetalist); % 关节数量
    
    for i = 1:n
        S = Slist(:, i);       % 第i个螺旋轴
        theta = thetalist(i);  % 第i个角度
        
        % 计算矩阵指数并累乘
        term = MatrixExp6(VecTose3(S) * theta);
        T_exponentials = T_exponentials * term;
    end
    
    % 3. 最终结果
    T = T_exponentials * M;
end

%% --- 辅助函数 (如果不使用mr库，需要以下函数) ---

function se3mat = VecTose3(V)
    % 将6维向量转换为4x4 se(3)矩阵
    % V = [omega; v]
    omega = V(1:3);
    v = V(4:6);
    so3mat = [0, -omega(3), omega(2); 
              omega(3), 0, -omega(1); 
              -omega(2), omega(1), 0];
    se3mat = [so3mat, v; 0, 0, 0, 0];
end

function T = MatrixExp6(se3mat)
    % 计算 se(3) 的矩阵指数 -> SE(3)
    omgtheta = so3ToVec(se3mat(1:3, 1:3));
    if norm(omgtheta) < 1e-6
        T = [eye(3), se3mat(1:3, 4); 0, 0, 0, 1];
    else
        theta = norm(omgtheta);
        omgmat = se3mat(1:3, 1:3) / theta; 
        T3 = eye(3) + sin(theta) * omgmat + (1 - cos(theta)) * (omgmat * omgmat);
        Gtheta = eye(3)*theta + (1 - cos(theta)) * omgmat + (theta - sin(theta)) * (omgmat * omgmat);
        T = [T3, Gtheta * se3mat(1:3, 4) / theta; 0, 0, 0, 1];
    end
end

function omg = so3ToVec(so3mat)
    % 从反对称矩阵提取向量
    omg = [so3mat(3, 2); so3mat(1, 3); so3mat(2, 1)];
end