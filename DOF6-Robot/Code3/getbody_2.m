% 确保你的工作区里已经有了 smiData 变量
% 如果没有，请先运行你提供的那个 .m 文件

fprintf('=== 机器人惯性张量提取报告 (单位: kg*m^2) ===\n');

% 遍历所有的 Solid
for i = 1:length(smiData.Solid)
    id = smiData.Solid(i).ID;
    
    % 过滤掉太小的零件（比如螺丝、垫片），只看主要部件
    % 这里设定阈值为 0.05kg (50g)，你可以根据需要调整
    if smiData.Solid(i).mass < 0.05 
        continue; 
    end
    
    % 获取数据
    moi = smiData.Solid(i).MoI; % [Ixx, Iyy, Izz]
    poi = smiData.Solid(i).PoI; % [Iyz, Ixz, Ixy]
    
    % 构建 3x3 矩阵
    % 注意：SolidWorks 导出的 PoI 顺序通常对应 [Iyz, Ixz, Ixy]
    I_tensor = [moi(1), poi(3), poi(2); ...
                poi(3), moi(2), poi(1); ...
                poi(2), poi(1), moi(3)];
            
    % 单位换算：kg*mm^2 -> kg*m^2
    I_tensor_SI = I_tensor * 1e-6;
    
    % 打印结果
    fprintf('\n------------------------------------------------\n');
    fprintf('零件 ID: %s\n', id);
    fprintf('质量: %.4f kg\n', smiData.Solid(i).mass);
    fprintf('惯性张量矩阵 I (相对于该零件质心):\n');
    disp(I_tensor_SI);
end