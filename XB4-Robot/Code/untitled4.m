% 运行诊断
diagnose_IK();



% 测试多个角度

debug_theta5([0; 0; 0; 0; 0.5; 0]);

debug_theta5([0.3; 0.4; -0.2; 0.5; 0.8; 0.1]);
debug_theta5([0; 0; 0; 0; -0.5; 0]);
debug_theta5([0; 0; 0; 0; 0; 0]);


% 如果还有问题，用这个详细调试
function debug_theta5(theta_test)
    d1 = 0.342; a1 = 0.040; a2 = 0.275; a3 = 0.025; d4 = 0.280; dt = 0.073;
    
    T = FK_MDH(theta_test);
    [sol, ~] = IK_MDH_Robot(T, d1, a1, a2, a3, d4, dt);
    
    % 找最接近的解clc
    min_err = inf;
    best_idx = 1;
    for i = 1:8
        if ~isnan(sol(1,i))
            err = norm(sol(:,i) - theta_test);
            if err < min_err
                min_err = err;
                best_idx = i;
            end
        end
    end
    
    fprintf('输入θ5: %.4f rad (%.2f°)\n', theta_test(5), rad2deg(theta_test(5)));
    fprintf('输出θ5: %.4f rad (%.2f°)\n', sol(5,best_idx), rad2deg(sol(5,best_idx)));
    fprintf('差异: %.4f rad (%.2f°)\n', sol(5,best_idx)-theta_test(5), ...
        rad2deg(sol(5,best_idx)-theta_test(5)));
end