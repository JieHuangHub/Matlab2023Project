%% import_urdf_robot.m
% 功能：
%   1) 导入 URDF 机械臂模型
%   2) 显示关节/刚体父子关系
%   3) 可视化机械臂
%   4) 导入 Simscape Multibody 模型
%
% 说明：
%   - 需要 Robotics System Toolbox
%   - URDF 文件路径请根据实际情况修改

clear; clc;

%% 1. URDF 文件路径
urdfFile = '/home/jiehuang/Documents/Custom-Robot/Matlab_Study/Matlab2023Project/DOF6-Robot/Code3/URDFDummy4/urdf/URDFDummy4.urdf'; % /home/jiehuang/Documents/Custom-Robot/Matlab_Study/Matlab2023Project/DOF6-Robot/Code3/URDFDummy4/urdf

%% 2. 导入刚体树模型（RigidBodyTree）
jxb = importrobot(urdfFile);

%% 3. 显示关节与刚体的父子关系
disp('--- Robot Structure ---');
showdetails(jxb);

%% 4. 可视化机械臂模型
% figure('Name','URDF Robot Visualization');
show(jxb, ...
    'Frames', 'on', ...     % 是否显示坐标系
    'Visuals', 'on');        % 是否显示几何模型
title('URDF Robot Model');

%% 5. 导入 Simscape Multibody 模型
jxb_sm = smimport(urdfFile);

disp('Simscape Multibody model imported successfully.');
