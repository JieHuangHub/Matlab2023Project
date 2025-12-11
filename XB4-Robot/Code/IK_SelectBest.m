function theta_best = IK_SelectBest(theta_all, q_home, weights)
%#codegen
% 固定输出大小
theta_best = zeros(1, 6);

min_cost = 1e10;  % 用大数代替inf
found = false;

for i = 1:8
    % 检查有效性
    valid = true;
    for j = 1:6
        if isnan(theta_all(i,j))
            valid = false;
            break;
        end
    end
    
    if valid
        cost = 0;
        for j = 1:6
            d = theta_all(i,j) - q_home(j);
            d = mod(d + pi, 2*pi) - pi;
            cost = cost + weights(j) * d * d;
        end
        
        if cost < min_cost
            min_cost = cost;
            for k = 1:6
                theta_best(k) = theta_all(i,k);
            end
            found = true;
        end
    end
end

if ~found
    for k = 1:6
        theta_best(k) = q_home(k);
    end
end
end