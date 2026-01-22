import pinocchio as pin
import numpy as np
import os

# 1. 设置 URDF 文件路径
urdf_filename = '/home/jiehuang/Documents/Custom-Robot/Matlab_Study/Matlab2023Project/DOF6-Robot/Code3/URDFDummy.SLDASM/urdf/URDFDummy.SLDASM.urdf'

# 检查文件是否存在
if not os.path.exists(urdf_filename):
    print(f"Error: 文件未找到 -> {urdf_filename}")
    exit()

# 2. 加载模型
# 如果 URDF 中包含 mesh 文件引用，可能需要提供 mesh 文件夹路径，通常如下：
# model = pin.buildModelFromUrdf(urdf_filename, package_dirs='/path/to/meshes')
try:
    model = pin.buildModelFromUrdf(urdf_filename)
except Exception as e:
    print(f"加载 URDF 失败: {e}")
    exit()

# 创建数据对象 (data 用于存储计算过程中的中间变量，如速度、加速度、力等)
data = model.createData()

# 3. 定义关节状态 (Position, Velocity, Acceleration)
q = np.array([0, 0, 0, 0.0, 0.0, 0.0])      # 关节位置 (rad 或 m)
v = np.array([0, 0, 0, 0.0, 0.0, 0.0])      # 关节速度 (rad/s 或 m/s)
a = np.array([0, 0, 0, 0.0, 0.0, 0.0])      # 关节加速度 (rad/s^2 或 m/s^2)

# 确保输入维度与模型匹配
if model.nq != len(q):
    print(f"警告: 输入 q 的维度 ({len(q)}) 与模型自由度 ({model.nq}) 不匹配！")

# ==========================================
# 4. 正运动学 (Forward Kinematics)
# ==========================================
print("-" * 30)
print("正运动学 (Forward Kinematics)")
print("-" * 30)

# 计算所有关节的运动学
pin.forwardKinematics(model, data, q)
# 更新 Frame (坐标系) 的位置
pin.updateFramePlacements(model, data)

# 获取末端执行器的 Frame ID
# 通常 URDF 的最后一个 Frame 是末端执行器。
# 如果你知道名字，可以使用 model.getFrameId("end_effector_name")
ee_frame_id = model.nframes - 1
ee_frame_name = model.frames[ee_frame_id].name

# 获取末端执行器的位姿 (SE3 对象: 包含旋转矩阵和平移向量)
ee_pose = data.oMf[ee_frame_id]

print(f"末端执行器名称: {ee_frame_name}")
print(f"末端位置 (Translation):\n{ee_pose.translation}")
print(f"末端旋转矩阵 (Rotation):\n{ee_pose.rotation}")

# 如果需要欧拉角或四元数，可以进一步转换
# rpy = pin.utils.matrixToRpy(ee_pose.rotation) # Roll-Pitch-Yaw

# ==========================================
# 5. 逆动力学 (Inverse Dynamics)
# ==========================================
print("\n" + "-" * 30)
print("逆动力学 (Inverse Dynamics - RNEA)")
print("-" * 30)

# 使用递归牛顿-欧拉算法 (RNEA) 计算力矩
# tau = M(q)a + C(q,v)v + g(q)
tau = pin.rnea(model, data, q, v, a)

print(f"计算出的关节力矩 (Torques):\n{tau}")

# 额外功能：分别获取重力项 (Gravity vector)
# 当 v=0, a=0 时，rnea 计算的就是重力补偿力矩
g_vector = pin.computeGeneralizedGravity(model, data, q)
print(f"\n重力补偿力矩 (Gravity Vector):\n{g_vector}")

# 额外功能：获取质量矩阵 (Mass Matrix)
M = pin.crba(model, data, q)
# 只有在调用 crba 后 M 才会被存入 data.M
# 注意：标准的 crba 只计算 M 上三角部分，pinocchio 做了优化，如果需要完整矩阵需利用对称性
M_full = data.M
# print(f"\n质量矩阵 M(q):\n{M_full}")