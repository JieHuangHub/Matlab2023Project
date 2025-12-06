%% 1) 基本设置
MODEL = 'DOF3_RRR_C';                 % 用模型的实际名称
TunedBlocks = {'PD1','PD2','PD3'};    % 待整定的 PD 块

ST0 = slTuner(MODEL, TunedBlocks);

%% 2) 声明线化/测量/参考点（名字必须与模型中的一致）
% 将 PD 输出端口、Robot 输出端口、Signal Editor 的 q1/q2/q3 端口都加入
addPoint(ST0, TunedBlocks);  % 相当于把 PD 输出标为“控制输入”候选
addPoint(ST0, 'Robot/1');    % 关节角测量（与你的模型端口名一致）
addPoint(ST0, { ...
    'Signal Editor/q1', ...
    'Signal Editor/q2', ...
    'Signal Editor/q3' });

%% 3) 定义控制量、测量量、参考信号，并整定
Controls     = TunedBlocks;                     % 执行器命令：PD1/PD2/PD3
Measurements = [MODEL '/Robot/1'];              % 关节测量
RefSignals   = { [MODEL '/Signal Editor/q1'], ...
                 [MODEL '/Signal Editor/q2'], ...
                 [MODEL '/Signal Editor/q3'] };

options = looptuneOptions('RandomStart',80,'UseParallel',false);

% 期望阶跃跟踪：上升时间≈0.05 s（可按需要调）
TR  = TuningGoal.StepTracking(RefSignals, Measurements, 0.05, 0);

ST1 = looptune(ST0, Controls, Measurements, TR, options);

%% 4) 把整定结果写回模型
writeBlockValue(ST1);
