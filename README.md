# Matlab2023Project

本项目包含多个基于 MATLAB/Simulink 的机器人仿真、控制及强化学习项目。

## 环境要求

- MATLAB R2023b 或更高版本
- Simulink + Simscape Multibody
- Reinforcement Learning Toolbox
- Ubuntu 22. 04（推荐）

## 项目结构

### 🤖 机械臂项目

#### 📁 [Planar-Robotic-Arm](./Planar-Robotic-Arm)
**2轴平面机械臂仿真项目**
- 机械臂模型由 SolidWorks 设计并导入 Simulink 仿真
- 包含正运动学仿真和 PID 控制
- 子目录：`Code/`（代码）、`Model/`（模型）、`XML/`（配置文件）、`images/`（图片）

#### 📁 [3DOF-Robot](./3DOF-Robot)
**三自由度机器人仿真项目**
- 3DOF 机械臂建模与控制仿真
- 子目录：`Code/`（代码）

#### 📁 [DOF6-Robot](./DOF6-Robot)
**六自由度机器人仿真项目**
- 6DOF 工业机器人建模与仿真
- 子目录：`Code/`（代码）、`XML/`（配置文件）

#### 📁 [XB4-Robot](./XB4-Robot)
**XB4 机器人仿真项目**
- XB4 型号机器人的建模与控制
- 子目录：`Code/`（代码）、`Mode/`（模式配置）

---

### 🎯 倒立摆（CartPole）项目

#### 📁 [CartPole-RL](./CartPole-RL)
**倒立摆强化学习训练项目（主要项目）**
- 基于 MATLAB/Simulink 的倒立摆强化学习训练
- 小车模型由 SolidWorks 设计并导入 Simulink 仿真
- 支持多种训练环境和算法（DDPG、SAC）
- 包含已训练的 Agent 模型
- 详细使用说明请参考 [CartPole-RL/README.md](./CartPole-RL/README.md)

#### 📁 [ProjectForCarPole](./ProjectForCarPole)
**倒立摆基础仿真项目**
- 基于 Simscape Multibody 的倒立摆物理仿真
- 子目录：`Code/`（代码）、`XML/`（配置文件）、`slprj/`（Simulink 项目文件）

#### 📁 [ProjectForCarPole_RL](./ProjectForCarPole_RL)
**倒立摆强化学习项目（早期版本）**
- 倒立摆的强化学习控制实现
- 子目录：`Code/`（代码）、`XML/`（配置文件）

#### 📁 [Project_CarPole_MatlabModel](./Project_CarPole_MatlabModel)
**倒立摆 MATLAB 数学模型**
- 基于数学方程的倒立摆模型
- 子目录：`Code/`（代码）、`Model/`（模型）

#### 📁 [Project_CartPole_MatlabModel_RL](./Project_CartPole_MatlabModel_RL)
**倒立摆数学模型强化学习版本**
- 结合数学模型与强化学习的倒立摆控制
- 子目录：`Code/`（代码）、`Model/`（模型）

---

## 主要功能

| 项目类型 | 项目名称 | 主要内容 |
|---------|---------|---------|
| 机械臂 | Planar-Robotic-Arm | 2轴平面机械臂 PID 控制 |
| 机械臂 | 3DOF-Robot | 三自由度机器人仿真 |
| 机械臂 | DOF6-Robot | 六自由度机器人仿真 |
| 机械臂 | XB4-Robot | XB4 机器人仿真 |
| 倒立摆 | CartPole-RL | 强化学习控制（DDPG/SAC） |
| 倒立摆 | ProjectForCarPole | 基础物理仿真 |
| 倒立摆 | Project_CarPole_MatlabModel | 数学模型仿真 |

## 快速开始

1. 克隆本仓库
2. 使用 MATLAB R2023b 打开对应项目文件夹
3. 根据各子项目的 README 进行配置和运行

## 参考资料

- [MATLAB Simscape Multibody 官方文档](https://www.mathworks.com/products/simscape-multibody.html)
- [Reinforcement Learning Toolbox](https://www.mathworks.com/products/reinforcement-learning.html)