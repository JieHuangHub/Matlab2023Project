

%% 1) 基本设置
MODEL = 'New_PD';

% 6 个可调 PD（建议写全路径，避免同名/层级导致选错块）
TunedBlocks = strcat(MODEL, {'/PD1','/PD2','/PD3','/PD4','/PD5','/PD6'});

load_system(MODEL);
ST0 = slTuner(MODEL, TunedBlocks);

%% 2) 声明信号点（参考 r、测量 y、控制 u）
r = [MODEL '/D2R/1'];        % 6维参考
y = [MODEL '/SDHROBOT/1'];   % 6维关节测量
u = TunedBlocks;             % 各 PD 输出视作控制量（用于加约束时更直观）

addPoint(ST0, r);
addPoint(ST0, y);
addPoint(ST0, u);

%% 3) 整定目标（先“保守”一点，避免把 PD 调得过硬导致发散）
Ts = 0.4;  % 先别追求太快（你原来 0.8 也不算快，但实际可能被模型/尺度放大）% 0.3 0.4 0.5
TR = TuningGoal.StepTracking(r, y, Ts, 0);   % r->y 跟踪（6x6 自动对应通道）

% --- 可选：加稳定裕度约束（强烈建议加；若版本/接口不匹配就先注释掉） ---
% MS = TuningGoal.Margins(u, y, 6, 45);      % 目标：≥6 dB 增益裕度、≥45° 相位裕度
% Goals = [TR MS];

Goals = TR;

%% 4) 开始整定
opt = looptuneOptions('RandomStart', 50, 'UseParallel', false);  % 30, 50
[ST1, fSoft] = looptune(ST0, u, y, Goals, opt);

%% 5) 写回参数
writeBlockValue(ST1);

fprintf('looptune 完成。fSoft = %.3f（<=1 通常表示目标满足得更好）\n', fSoft);





