%% 诊断脚本 - 找出θ5问题
function diagnose_IK()
    % DH参数
    d1 = 0.342; a1 = 0.040; a2 = 0.275; a3 = 0.025; d4 = 0.280; dt = 0.073;
    
    % 测试用关节角 (避开奇异位置)
    theta_test = [0.3; 0.5; -0.4; 0.6; 0.8; 0.2];
    
    % 正解
    T = FK_MDH(theta_test);
    fprintf('目标位姿 T:\n');
    disp(T);
    
    % 逆解
    [solutions, singular_flag] = IK_MDH_Robot(T, d1, a1, a2, a3, d4, dt);
    
    % 验证每组解
    fprintf('\n验证逆解结果:\n');
    fprintf('原始关节角: [%.4f, %.4f, %.4f, %.4f, %.4f, %.4f]\n', theta_test');
    fprintf('----------------------------------------\n');
    
    for i = 1:8
        if ~isnan(solutions(1,i))
            T_check = FK_MDH(solutions(:,i));
            pos_err = norm(T(1:3,4) - T_check(1:3,4));
            rot_err = norm(T(1:3,1:3) - T_check(1:3,1:3), 'fro');
            
            fprintf('解%d: [%.4f, %.4f, %.4f, %.4f, %.4f, %.4f]\n', ...
                i, solutions(:,i)');
            fprintf('    位置误差: %.6e, 姿态误差: %.6e\n', pos_err, rot_err);
            
            % 单独检查θ5
            fprintf('    θ5差异: %.4f rad (%.2f°)\n', ...
                solutions(5,i) - theta_test(5), ...
                rad2deg(solutions(5,i) - theta_test(5)));
        end
    end
end