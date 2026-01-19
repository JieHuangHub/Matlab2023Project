

% 调用函数，指定n_axis=1
% [Ti_1, T0i_1] = CalcZeroMatrices(6);

% 零位测试
q_zero = [0,0,0,0,0,0];
T_zero = Simulink_POE_FK(q_zero);
disp('零位时末端齐次变换矩阵：');
disp(T_zero);


