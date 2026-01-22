"""
基于 Pinocchio 库的机器人正运动学和逆动力学计算
适用于 6-DOF 机械臂
"""

import numpy as np
import pinocchio as pin

# ==================== 配置参数 ====================
urdf_filename = '/home/jiehuang/Documents/Custom-Robot/Matlab_Study/Matlab2023Project/DOF6-Robot/Code3/URDFDummy4/urdf/URDFDummy4.urdf'

# 关节状态
q = np.array([0.0, 0.0, 0.0, 0.0, 0.0, 0.0])  # 关节位置 (rad)
# q = np.array([45, -45, 45, 45, 45, 45])  # 关节位置 (rad)

v = np.array([0.0, 0.0, 0.0, 0.0, 0.0, 0.0])  # 关节速度 (rad/s)
a = np.array([0.0, 0.0, 0.0, 0.0, 0.0, 0.0])  # 关节加速度 (rad/s^2)


# ==================== 加载机器人模型 ====================
def load_robot_model(urdf_path):
    """
    从 URDF 文件加载机器人模型

    参数:
        urdf_path:  URDF 文件路径

    返回:
        model:  Pinocchio 模型
        data:  Pinocchio 数据结构
    """
    # 加载 URDF 模型
    model = pin.buildModelFromUrdf(urdf_path)

    # 创建数据结构
    data = model.createData()

    print(f"机器人名称: {model.name}")
    print(f"自由度 (nq): {model.nq}")
    print(f"速度维度 (nv): {model.nv}")
    print(f"关节数量: {model.njoints}")
    print(f"连杆数量: {model.nbodies}")
    print("-" * 50)

    # 打印关节信息
    print("关节信息:")
    for i, name in enumerate(model.names):
        print(f"  关节 {i}: {name}")

    return model, data


# ==================== 正运动学 ====================
def forward_kinematics(model, data, q):
    """
    计算正运动学 - 根据关节角度计算末端执行器位姿

    参数:
        model:  Pinocchio 模型
        data: Pinocchio 数据结构
        q: 关节位置数组

    返回:
        end_effector_pose: 末端执行器的位姿 (SE3)
    """
    # 计算正运动学
    pin.forwardKinematics(model, data, q)

    # 更新所有连杆的位姿
    pin.updateFramePlacements(model, data)

    # 获取末端执行器的帧ID (最后一个帧)
    end_effector_frame_id = model.nframes - 1

    # 获取末端执行器位姿
    end_effector_pose = data.oMf[end_effector_frame_id]

    return end_effector_pose


def get_all_joint_poses(model, data, q):
    """
    获取所有关节的位姿

    参数:
        model: Pinocchio 模型
        data: Pinocchio 数据结构
        q: 关节位置数组

    返回:
        joint_poses: 所有关节位姿的列表
    """
    # 计算正运动学
    pin.forwardKinematics(model, data, q)

    joint_poses = []
    for i in range(model.njoints):
        joint_poses.append(data.oMi[i].copy())

    return joint_poses


def compute_jacobian(model, data, q, frame_id=None):
    """
    计算雅可比矩阵

    参数:
        model: Pinocchio 模型
        data:  Pinocchio 数据结构
        q: 关节位置数组
        frame_id: 帧ID (默认为末端执行器)

    返回:
        J: 6 x nv 雅可比矩阵
    """
    if frame_id is None:
        frame_id = model.nframes - 1

    # 计算帧雅可比矩阵 (世界坐标系)
    J = pin.computeFrameJacobian(model, data, q, frame_id, pin.ReferenceFrame.WORLD)

    return J


# ==================== 逆动力学 ====================
def inverse_dynamics(model, data, q, v, a):
    """
    计算逆动力学 - 根据关节位置、速度、加速度计算所需关节力矩

    使用递归牛顿-欧拉算法 (RNEA)

    参数:
        model:  Pinocchio 模型
        data: Pinocchio 数据结构
        q: 关节位置数组
        v: 关节速度数组
        a: 关节加速度数组

    返回:
        tau:  关节力矩数组
    """
    # 使用 RNEA 算法计算逆动力学
    tau = pin.rnea(model, data, q, v, a)

    return tau


def compute_dynamics_components(model, data, q, v):
    """
    计算动力学各组成部分:  M(q), C(q,v), g(q)
    动力学方程: tau = M(q) * a + C(q, v) * v + g(q)

    参数:
        model: Pinocchio 模型
        data:  Pinocchio 数据结构
        q: 关节位置数组
        v: 关节速度数组

    返回:
        M: 质量矩阵 (nv x nv)
        C: 科里奥利矩阵 (nv x nv)
        g: 重力项 (nv,)
    """
    # 计算质量矩阵 M(q)
    M = pin.crba(model, data, q)

    # 计算科里奥利矩阵 C(q, v)
    # 使用 computeCoriolisMatrix 或通过非线性效应计算
    pin.computeCoriolisMatrix(model, data, q, v)
    C = data.C.copy()

    # 计算重力项 g(q)
    # 通过设置 v=0, a=0 调用 rnea
    g = pin.computeGeneralizedGravity(model, data, q)

    return M, C, g


def compute_nonlinear_effects(model, data, q, v):
    """
    计算非线性效应 (科里奥利力 + 重力)
    nle = C(q,v)*v + g(q)

    参数:
        model: Pinocchio 模型
        data: Pinocchio 数据结构
        q: 关节位置数组
        v: 关节速度数组

    返回:
        nle: 非线性效应项
    """
    nle = pin.nonLinearEffects(model, data, q, v)
    return nle


# ==================== 主程序 ====================
def main():
    print("=" * 60)
    print("Pinocchio 机器人正运动学和逆动力学计算")
    print("=" * 60)

    # 1. 加载机器人模型
    print("\n[1] 加载机器人模型")
    print("-" * 50)
    try:
        model, data = load_robot_model(urdf_filename)
    except Exception as e:
        print(f"加载 URDF 文件失败: {e}")
        print("请检查 URDF 文件路径是否正确")
        return

    # 2. 正运动学计算
    print("\n[2] 正运动学计算")
    print("-" * 50)
    print(f"输入关节位置 q: {q}")

    # 计算末端执行器位姿
    end_effector_pose = forward_kinematics(model, data, q)

    # 提取位置和旋转
    position = end_effector_pose.translation
    rotation_matrix = end_effector_pose.rotation

    # 将旋转矩阵转换为欧拉角 (RPY:  Roll-Pitch-Yaw)
    rpy = pin.rpy.matrixToRpy(rotation_matrix)

    print(f"\n末端执行器位置 (x, y, z):")
    print(f"  x = {position[0]:.6f} m")
    print(f"  y = {position[1]:.6f} m")
    print(f"  z = {position[2]:.6f} m")

    print(f"\n末端执行器姿态 (RPY):")
    print(f"  Roll  = {np.rad2deg(rpy[0]):.6f} deg")
    print(f"  Pitch = {np.rad2deg(rpy[1]):.6f} deg")
    print(f"  Yaw   = {np.rad2deg(rpy[2]):.6f} deg")

    print(f"\n旋转矩阵:")
    print(rotation_matrix)

    print(f"\n齐次变换矩阵 (4x4):")
    print(end_effector_pose.homogeneous)

    # 计算雅可比矩阵
    J = compute_jacobian(model, data, q)
    print(f"\n雅可比矩阵 J (6 x {model.nv}):")
    print(J)

    # 3. 逆动力学计算
    print("\n[3] 逆动力学计算")
    print("-" * 50)
    print(f"输入关节位置 q: {q}")
    print(f"输入关节速度 v: {v}")
    print(f"输入关节加速度 a: {a}")

    # 计算关节力矩
    tau = inverse_dynamics(model, data, q, v, a)

    print(f"\n计算得到的关节力矩 tau:")
    for i, t in enumerate(tau):
        print(f"  关节 {i + 1}: {t:.6f} N·m")

    # 4. 动力学分量计算
    print("\n[4] 动力学分量计算")
    print("-" * 50)

    M, C, g = compute_dynamics_components(model, data, q, v)

    print(f"\n质量矩阵 M(q) ({model.nv} x {model.nv}):")
    print(M)

    print(f"\n科里奥利矩阵 C(q,v) ({model.nv} x {model.nv}):")
    print(C)

    print(f"\n重力项 g(q):")
    print(g)

    # 验证:  tau = M*a + C*v + g
    tau_verify = M @ a + C @ v + g
    print(f"\n验证 (tau = M*a + C*v + g):")
    print(f"  RNEA 计算的 tau: {tau}")
    print(f"  分量计算的 tau:   {tau_verify}")
    print(f"  误差: {np.linalg.norm(tau - tau_verify):.2e}")

    # 5. 显示所有关节位姿
    print("\n[5] 所有关节位姿")
    print("-" * 50)
    joint_poses = get_all_joint_poses(model, data, q)
    for i, pose in enumerate(joint_poses):
        if i < len(model.names):
            print(f"\n关节 {i} ({model.names[i]}):")
            print(f"  位置: {pose.translation}")


if __name__ == "__main__":
    main()