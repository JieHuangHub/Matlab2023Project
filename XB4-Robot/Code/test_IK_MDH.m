function test_IK_MDH()
    d1 = 0.342; a1 = 0.040; a2 = 0.275; a3 = 0.025; d4 = 0.280; dt = 0.073;
    
    % 多组测试角度
    test_cases = {
        [0.3; 0.5; -0.4; 0.6; 0.8; 0.2];
        [0; 0; 0; 0; 0.5; 0];
        [0.5; 0.3; 0.2; -0.4; 0.6; 0.1];
        [-0.3; 0.4; -0.3; 0.2; -0.5; 0.3];
        [0; 0; 0; 0; 0; 0];
    };
    
    fprintf('====== IK_MDH_Robot 验证 ======\n\n');
    
    for tc = 1:length(test_cases)
        theta_orig = test_cases{tc};
        T = FK_MDH(theta_orig);
        [solutions, ~] = IK_MDH_Robot(T, d1, a1, a2, a3, d4, dt);
        
        fprintf('测试%d: 原始角 = [%.3f, %.3f, %.3f, %.3f, %.3f, %.3f]\n', ...
            tc, theta_orig');
        
        % 找最佳匹配解
        best_err = inf;
        best_idx = 0;
        
        for i = 1:8
            if ~isnan(solutions(1,i))
                T_check = FK_MDH(solutions(:,i));
                err = norm(T - T_check, 'fro');
                if err < best_err
                    best_err = err;
                    best_idx = i;
                end
            end
        end
        
        if best_idx > 0
            fprintf('最佳解%d: [%.3f, %.3f, %.3f, %.3f, %.3f, %.3f]\n', ...
                best_idx, solutions(:,best_idx)');
            fprintf('位姿误差: %.2e\n', best_err);
            fprintf('θ5: 原=%.4f, 解=%.4f, 差=%.4f (%.2f°)\n', ...
                theta_orig(5), solutions(5,best_idx), ...
                solutions(5,best_idx)-theta_orig(5), ...
                rad2deg(solutions(5,best_idx)-theta_orig(5)));
        else
            fprintf('无有效解!\n');
        end
        fprintf('\n');
    end
end