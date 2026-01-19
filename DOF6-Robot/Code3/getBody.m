


robot = importrobot('SDHDummy'); % 确保不加 .xml 后缀，或者根据版本加

% 获取所有刚体的名字
bodyNames = robot.BodyNames;

fprintf('=== 机器人全关节惯性参数表 ===\n');

for i = 1:length(bodyNames)
    name = bodyNames{i};
    % 跳过基座（通常叫 base 或 root，没有上一级关节）
    if strcmp(name, robot.BaseName)
        continue;
    end
    
    body = robot.getBody(name);
    mass = body.Mass;
    com = body.CenterOfMass;
    I_vec = body.Inertia;
    
    % 构造矩阵
    I_mat = [I_vec(1) I_vec(6) I_vec(5); ...
             I_vec(6) I_vec(2) I_vec(4); ...
             I_vec(5) I_vec(4) I_vec(3)];
         
    fprintf('\n---------------------------------\n');
    fprintf('关节/刚体名称: %s\n', name);
    fprintf('质量: %.4f kg\n', mass);
    fprintf('质心位置 (相对于关节坐标系): [%.4f, %.4f, %.4f] m\n', com);
    fprintf('惯性张量 (相对于关节坐标系):\n');
    disp(I_mat);
end