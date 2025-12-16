% 测试代码
function test_IK()
    % 你的DH参数
    d1=0.342;a1=0.040;a2=0.275;a3=0.025;d4=0.280;dt=0.073;
    
    % 用已知关节角正解得到T
    theta_known = [0.5; 0.3; -0.2; 0.8; 0.6; 0.4];  % 示例
    T = FK_MDH(theta_known);
    
    % 逆解
    [solutions, ~] = IK_6DOF_Robot_Fixed(T, d1, a1, a2, a3, d4, dt);
    
    % 验证每组解
    for i = 1:8
        if ~isnan(solutions(1,i))
            T_check = FK_MDH(solutions(:,i));
            err = norm(T - T_check, 'fro');
            fprintf('Solution %d: error = %.6e, theta5 = %.4f\n', i, err, solutions(5,i));
        end
    end
end