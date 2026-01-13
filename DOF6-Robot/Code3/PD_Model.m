

%% 1) 基本设置
MODEL = 'New_PID';                 % 用模型的实际名称
TunedBlocks = {'PD1', 'PD2', 'PD3', 'PD4', 'PD5', 'PD6'};    % 待整定的 PD 块

ST0 = slTuner(MODEL, TunedBlocks);

%% 2) 声明线化/测量/参考点（名字必须与模型中的一致）
% 将 PD 输出端口、Robot 输出端口、Signal Editor 的 q1/q2/q3 端口都加入
addPoint(ST0, TunedBlocks);  % 相当于把 PD 输出标为“控制输入”候选
addPoint(ST0, '/SDHROBOT/1');    % 关节角测量（与你的模型端口名一致）
addPoint(ST0, { ...
    '/Demux/q1', ...
    '/Demux/q2', ...
    '/Demux/q3', ...
    '/Demux/q4', ...
    '/Demux/q5', ...
    '/Demux/q6'});

%% 3) 定义控制量、测量量、参考信号，并整定
Controls     = TunedBlocks;                     % 执行器命令：PD1/PD2/PD3
Measurements = [MODEL '/SDHROBOT/1'];              % 关节测量
RefSignals   = { [MODEL '/Demux/q1'], ...
                 [MODEL '/Demux/q2'], ...
                 [MODEL '/Demux/q3'], ...
                 [MODEL '/Demux/q4'], ...
                 [MODEL '/Demux/q5'], ...
                 [MODEL '/Demux/q6']};

options = looptuneOptions('RandomStart',80,'UseParallel',false);

% 期望阶跃跟踪：上升时间≈0.05 s（可按需要调）
TR  = TuningGoal.StepTracking(RefSignals, Measurements, 0.5, 0);

ST1 = looptune(ST0, Controls, Measurements, TR, options);

%% 4) 把整定结果写回模型
writeBlockValue(ST1);




% %% 1) 基本设置
% % 请将 'YourModelName' 替换为你实际的 Simulink 文件名（不带 .slx）
% MODEL = 'New_PID';
% 
% % 声明 6 个 PD 控制器模块为待整定对象
% TunedBlocks = {'PD1', 'PD2', 'PD3', 'PD4', 'PD5', 'PD6'};    
% 
% % 创建 slTuner 接口
% ST0 = slTuner(MODEL, TunedBlocks);
% 
% %% 2) 声明线化/测量/参考点
% % 这一步非常关键，告诉 MATLAB 信号流的“切入点”和“切出点”
% 
% % 2.1 添加 PD 控制器的输出作为“控制输入”点
% addPoint(ST0, TunedBlocks);
% 
% % 2.2 添加参考信号点 (Reference)
% % 从截图中看，'D2R' 模块输出的是干净的 6 维参考信号向量
% % 我们直接选取 D2R 模块的输出端口 1
% addPoint(ST0, [MODEL '/D2R/1']); 
% 
% % 2.3 添加测量信号点 (Measurement)
% % 假设 SDHROBOT 的第 1 个输出端口输出的是 6 个关节的角度
% addPoint(ST0, [MODEL '/SDHROBOT/1']);
% 
% %% 3) 定义整定目标 (Tuning Goals)
% 
% % 定义控制量 (Controls): 6个 PD 模块
% Controls = TunedBlocks;
% 
% % 定义测量量 (Measurements): 机器人的输出 (6维向量)
% % 注意：这里直接引用机器人的输出端口
% Measurements = [MODEL '/SDHROBOT/1'];
% 
% % 定义参考信号 (RefSignals): 期望轨迹 (6维向量)
% % 这里直接引用 D2R 转换后的输出
% RefSignals   = [MODEL '/D2R/1'];
% 
% % 设置整定选项
% options = looptuneOptions('RandomStart', 100, 'UseParallel', false);
% 
% % 设置设计要求：阶跃跟踪
% % 6自由度机械臂建议响应时间设为 0.1s - 0.2s，太快会导致力矩过大
% % 这个目标会自动处理 Input(D2R) 到 Output(Robot) 的 6x6 对应关系
% TR = TuningGoal.StepTracking(RefSignals, Measurements, 0.8, 0);
% 
% % 如果需要限制超调量，可以取消下面这行的注释
% % TR.Overshoot = 10; % 允许最大 10% 超调
% 
% %% 4) 开始整定
% fprintf('开始整定 6 自由度机械臂参数...\n');
% ST1 = looptune(ST0, Controls, Measurements, TR, options);
% 
% %% 5) 将参数写回模型
% writeBlockValue(ST1);
% fprintf('整定完成，参数已更新到模型中。\n');