# XB4 六轴机械臂仿真项目

基于 MATLAB/Simulink 的 XB4 六轴机械臂运动学仿真项目，包含正运动学（FK）、逆运动学（IK）、雅可比矩阵及轨迹规划等功能。

## 环境要求

- MATLAB R2023b 或更高版本
- Simulink + Simscape Multibody
- Robotics System Toolbox
- Ubuntu 22.04（推荐）

## 项目结构

```
XB4-Robot/
├── Code/                          # 代码文件夹
│   ├── set_mode_parameter.m       # 机械臂参数配置脚本
│   ├── XB4Robot.slx               # XB4 机械臂主仿真模型
│   ├── MainControl.slx            # 主控制仿真模型
│   ├── CopyZeroMain.slx           # 零位复制仿真模型
│   ├── YouTubeVideo_FK.slx        # 正运动学仿真
│   ├── YouTubeVideo_IK. slx        # 逆运动学仿真
│   ├── YouTubeVideo_IK_wp.slx     # 带路径点的逆运动学仿真
│   ├── YouTubeVideo_IK_wp_constant_vectory.slx  # 恒定速度轨迹逆运动学
│   ├── YouTubeVideo_jacbain_end_vectory. slx     # 雅可比矩阵末端速度控制
│   ├── ik_fk_verify.slx           # 正逆运动学验证
│   ├── URDF_XG_Robot_Arm_Urdf_Control_V3.slx    # URDF 模型控制
│   ├── sim004.slx / sim005.slx    # 仿真测试文件
│   ├── robot005.slx               # 机器人模型文件
│   └── trajectIK.mat              # 轨迹数据文件
└── Mode/                          # 模式配置文件夹
```

## 机械臂参数

### XB4 模式 (mode=0)
| 参数 | 值 |
|-----|-----|
| d1 | 0.342 m |
| a1 | 0.040 m |
| a2 | 0.275 m |
| a3 | 0.025 m |
| d4 | 0.280 m |
| dt | 73 mm |


## D-H 参数表

| 关节 | a (mm) | α (rad) | d (mm) | θ (rad) |
|-----|--------|---------|--------|---------|
| 1 | 40 | π/2 | 342 | 0 |
| 2 | 275 | 0 | 0 | 0 |
| 3 | 25 | π/2 | 0 | 0 |
| 4 | 0 | -π/2 | 280 | 0 |
| 5 | 0 | π/2 | 0 | 0 |
| 6 | 0 | 0 | 73 | 0 |

## 使用方法

### 1. 配置机械臂参数

运行参数配置脚本：
```matlab
run('Code/set_mode_parameter.m')
```

### 2. 选择仿真模型

根据需求选择对应的仿真模型：

| 仿真模型 | 功能说明 |
|---------|---------|
| `XB4Robot.slx` | XB4 机械臂主仿真模型 |
| `YouTubeVideo_FK.slx` | 正运动学仿真 |
| `YouTubeVideo_IK.slx` | 逆运动学仿真 |
| `YouTubeVideo_IK_wp.slx` | 带路径点的逆运动学 |
| `YouTubeVideo_jacbain_end_vectory. slx` | 雅可比矩阵末端速度控制 |
| `ik_fk_verify. slx` | 正逆运动学验证 |

### 3. 运行仿真

双击打开对应的 `. slx` 文件，点击运行按钮开始仿真。

## 主要功能

- ✅ **正运动学 (FK)** - 由关节角度计算末端位姿
- ✅ **逆运动学 (IK)** - 由末端位姿求解关节角度
- ✅ **雅可比矩阵** - 末端速度与关节速度映射
- ✅ **轨迹规划** - 路径点轨迹插值与跟踪
- ✅ **URDF 支持** - 支持 URDF 模型导入

## 示例轨迹点

默认轨迹路径点 (单位: 米)：
```matlab
wp = [
    0.393, 0, 0.64;   % 起始点
    0.275, 0, 0.53;
    0.475, 0, 0.53;
    0.475, 0, 0.33;
    0.275, 0, 0.33;
    0.275, 0, 0.53;
    0.393, 0, 0.64    % 终点（返回起始位置）
]';
```