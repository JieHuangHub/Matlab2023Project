wp_test = [0.393 0 0.64]';

R1 = [0 0 1;
      0 -1 0;
      1  0 0];

% 取第1个点
p = wp_1(: , 1);  % 取第一列 [0.393; 0; 0.64]

T = [R1, p;
     0, 0, 0, 1];

[solutions, singular_flag] = IK_6DOF_Robot(T, d1, a1, a2, a3, d4, dt);
disp('奇异标记（true表示奇异）：');
disp(singular_flag);
disp('θ5的所有解：');
disp(solutions(5,: ));



% % 计算home点的目标齐次矩阵
% Radian_home = [0,0,0,0,0,0]; % home点关节角
% T_home = FK_MDH(Radian_home);
% disp('home点的齐次矩阵T_home：');
% disp(T_home);
% % 提取home点的位置（验证X=0.393, Y=0, Z=0.64）
% pos_home = T_home(1:3,4);
% disp('home点位置：');
% disp(pos_home);

