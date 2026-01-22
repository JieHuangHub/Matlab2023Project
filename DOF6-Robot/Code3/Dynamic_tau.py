import pinocchio
import numpy as np
from os.path import dirname, join, abspath

# 1. 设置 URDF 路径 (参考你的截图)
# 假设你的文件结构，这里指向你的 example-robot-data
# pinocchio_model_dir = join(dirname(dirname(str(abspath(__file__)))), "models")
urdf_filename = '/home/jiehuang/Documents/Custom-Robot/Matlab_Study/Matlab2023Project/DOF6-Robot/Code3/URDFDummy.SLDASM/urdf/URDFDummy.SLDASM.urdf'

# 2. 加载模型
model = pinocchio.buildModelFromUrdf(urdf_filename)
print('Model name: ' + model.name)

# 3. 创建 Data (用于存储算法中间计算结果)
data = model.createData()

# 4. 定义状态 (参考你的截图 image_69ee05.png)
# 注意：数组长度必须与机器人的自由度匹配 (UR5 为 6)
q = np.array([0, 0, 0, 0.0, 0.0, 0.0])  # 关节位置
v = np.array([0, 0, 0, 0.0, 0.0, 0.0])  # 关节速度
a = np.array([0, 0, 0, 0.0, 0.0, 0.0])  # 关节加速度

# 5. 计算 Tau (逆动力学)
# 使用 RNEA 算法计算: tau = M(q)a + C(q,v)v + g(q)
tau = pinocchio.rnea(model, data, q, v, a)

# 6. 输出结果
# 方法 A: 全局设置 numpy 打印精度 (推荐，对所有 numpy 数组生效)
np.set_printoptions(precision=5, suppress=True)
print("计算出的 Tau (方法 A):")
print(tau)

# # 方法 B: 使用格式化字符串单独打印 (如果你只想格式化这一行)
# print("\n计算出的 Tau (方法 B):")
# print(["{:.5f}".format(t) for t in tau])