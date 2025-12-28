# 球形腕机械臂逆运动学公式推导

## 1. 前提条件

### 1.1 适用范围
本公式适用于满足 **Pieper准则** 的6轴机械臂，即：
- 最后三个关节轴（关节4、5、6）相交于一点（腕心）
- 这类机械臂的逆运动学可以解耦为 **位置问题** 和 **姿态问题**

### 1.2 DH参数定义

| 参数 | 含义 | 说明 |
|------|------|------|
| $a_1$ | 连杆1长度 | 通常为0 |
| $a_2$ | 连杆2长度 | 上臂长度 |
| $a_3$ | 连杆3长度 | 前臂长度 |
| $d_1$ | 连杆1偏移 | 基座高度 |
| $d_4$ | 连杆4偏移 | 肘部偏移 |
| $d_6$ | 连杆6偏移 | 工具偏移 |

### 1.3 输入：末端位姿矩阵

$$
T_6^0 = \begin{bmatrix} 
n_x & o_x & a_x & p_x \\
n_y & o_y & a_y & p_y \\
n_z & o_z & a_z & p_z \\
0 & 0 & 0 & 1
\end{bmatrix} = \begin{bmatrix} 
\vec{n} & \vec{o} & \vec{a} & \vec{p} \\
0 & 0 & 0 & 1
\end{bmatrix}
$$

其中：
- $\vec{n} = (n_x, n_y, n_z)^T$ ：法向量 (normal)
- $\vec{o} = (o_x, o_y, o_z)^T$ ：方向向量 (orientation)
- $\vec{a} = (a_x, a_y, a_z)^T$ ：接近向量 (approach)
- $\vec{p} = (p_x, p_y, p_z)^T$ ：位置向量 (position)

---

## 2. 腕心位置计算

由于最后三轴相交于腕心，腕心位置可以通过末端位置沿接近向量 $\vec{a}$ 回退 $d_6$ 距离得到：

$$
\boxed{
\begin{aligned}
p_{wx} &= p_x - d_6 \cdot a_x \\
p_{wy} &= p_y - d_6 \cdot a_y \\
p_{wz} &= p_z - d_6 \cdot a_z
\end{aligned}
}
$$

向量形式：
$$
\vec{P}_w = \vec{p} - d_6 \cdot \vec{a}
$$

---

## 3. 第一阶段：位置求解（$\theta_1, \theta_3, \theta_2$）

### 3.1 求解 $\theta_1$（关节1）

#### 推导过程
观察腕心在XY平面的投影，关节1的旋转决定了腕心在水平面的方向：

$$
\frac{\sin\theta_1}{\cos\theta_1} = \frac{p_{wy}}{p_{wx}}
$$

#### 求解公式
$$
\boxed{\theta_1 = \text{atan2}(p_{wy}, p_{wx})}
$$

#### 多解情况
$\theta_1$ 有两个解，对应左臂/右臂配置：
$$
\begin{cases}
\theta_1^{(1)} = \text{atan2}(p_{wy}, p_{wx}) \\
\theta_1^{(2)} = \text{atan2}(-p_{wy}, -p_{wx}) = \theta_1^{(1)} + \pi
\end{cases}
$$

---

### 3.2 求解 $\theta_3$（关节3）

#### 3.2.1 定义中间变量

在已知 $\theta_1$ 的情况下，定义：

$$
\boxed{
\begin{aligned}
A &= \cos\theta_1 \cdot p_{wx} + \sin\theta_1 \cdot p_{wy} - a_1 \\
B &= -p_{wz} + d_1
\end{aligned}
}
$$

**物理含义**：
- $A$ ：腕心在关节1坐标系XZ平面的X方向投影（减去连杆1长度）
- $B$ ：腕心在关节1坐标系XZ平面的Z方向投影

#### 3.2.2 几何约束方程

根据连杆几何关系：
$$
\begin{cases}
A = a_2 \cos\theta_2 + a_3 \cos(\theta_2+\theta_3) - d_4 \sin(\theta_2+\theta_3) \\
B = a_2 \sin\theta_2 + a_3 \sin(\theta_2+\theta_3) + d_4 \cos(\theta_2+\theta_3)
\end{cases}
$$

#### 3.2.3 消去 $\theta_2$

将两式平方相加：
$$
A^2 + B^2 = a_2^2 + a_3^2 + d_4^2 + 2a_2(a_3 \cos\theta_3 - d_4 \sin\theta_3)
$$

整理得：
$$
a_3 \cos\theta_3 - d_4 \sin\theta_3 = \frac{A^2 + B^2 - a_2^2 - a_3^2 - d_4^2}{2a_2}
$$

#### 3.2.4 定义辅助变量 $K$

$$
\boxed{K = \frac{A^2 + B^2 - a_2^2 - a_3^2 - d_4^2}{2a_2}}
$$

则有：
$$
a_3 \cos\theta_3 - d_4 \sin\theta_3 = K
$$

#### 3.2.5 三角代换求解

引入极坐标变换：
$$
\boxed{
\begin{aligned}
\rho &= \sqrt{a_3^2 + d_4^2} \\
\phi &= \text{atan2}(d_4, a_3)
\end{aligned}
}
$$

则原方程变为：
$$
\rho \cos(\theta_3 + \phi) = K
$$

即：
$$
\cos(\theta_3 + \phi) = \frac{K}{\rho}
$$

#### 3.2.6 求解公式

$$
\theta_3 + \phi = \pm \arccos\left(\frac{K}{\rho}\right)
$$

$$
\boxed{\theta_3 = \pm \arccos\left(\frac{K}{\sqrt{a_3^2 + d_4^2}}\right) - \text{atan2}(d_4, a_3)}
$$

#### 多解情况
$\theta_3$ 有两个解，对应肘上/肘下配置：
$$
\begin{cases}
\theta_3^{(1)} = +\arccos\left(\frac{K}{\rho}\right) - \phi & \text{(肘上)} \\
\theta_3^{(2)} = -\arccos\left(\frac{K}{\rho}\right) - \phi & \text{(肘下)}
\end{cases}
$$

#### 解的存在条件
$$
\left|\frac{K}{\rho}\right| \leq 1 \quad \Rightarrow \quad |K| \leq \sqrt{a_3^2 + d_4^2}
$$

---

### 3.3 求解 $\theta_2$（关节2）

#### 3.3.1 定义系数

在已知 $\theta_3$ 的情况下，定义：

$$
\boxed{
\begin{aligned}
k_1 &= a_2 + a_3 \cos\theta_3 - d_4 \sin\theta_3 \\
k_2 &= a_3 \sin\theta_3 + d_4 \cos\theta_3
\end{aligned}
}
$$

#### 3.3.2 线性方程组

将 $A$、$B$ 的表达式改写为：
$$
\begin{cases}
A = k_1 \cos\theta_2 - k_2 \sin\theta_2 \\
B = k_1 \sin\theta_2 + k_2 \cos\theta_2
\end{cases}
$$

#### 3.3.3 求解 $\sin\theta_2$ 和 $\cos\theta_2$

通过线性方程组求解：
$$
\begin{aligned}
\sin\theta_2 &= \frac{k_1 B - k_2 A}{k_1^2 + k_2^2} \\
\cos\theta_2 &= \frac{k_1 A + k_2 B}{k_1^2 + k_2^2}
\end{aligned}
$$

#### 3.3.4 求解公式

$$
\boxed{\theta_2 = \text{atan2}(k_1 B - k_2 A, \; k_1 A + k_2 B)}
$$

> **注**：使用 atan2 函数时，分母 $k_1^2 + k_2^2$ 会被约去，因此无需显式计算。

---

## 4. 第二阶段：姿态求解（$\theta_5, \theta_4, \theta_6$）

此时 $\theta_1, \theta_2, \theta_3$ 已知，以下为已知量：

$$
\boxed{
\begin{aligned}
c_1 &= \cos\theta_1, \quad s_1 = \sin\theta_1 \\
\theta_{23} &= \theta_2 + \theta_3 \\
c_{23} &= \cos\theta_{23}, \quad s_{23} = \sin\theta_{23}
\end{aligned}
}
$$

---

### 4.1 求解 $\theta_5$（关节5）

#### 4.1.1 推导过程

将接近向量 $\vec{a}$ 投影到关节3坐标系的Z轴方向，得到 $\cos\theta_5$：

$$
\boxed{\cos\theta_5 = -\sin\theta_{23}(\cos\theta_1 \cdot a_x + \sin\theta_1 \cdot a_y) - \cos\theta_{23} \cdot a_z}
$$

展开形式：
$$
c_5 = -s_{23}(c_1 a_x + s_1 a_y) - c_{23} a_z
$$

#### 4.1.2 求解公式

$$
\sin\theta_5 = \pm\sqrt{1 - \cos^2\theta_5}
$$

$$
\boxed{\theta_5 = \text{atan2}(\pm\sqrt{1-c_5^2}, \; c_5)}
$$

#### 多解情况
$\theta_5$ 有两个解，对应腕正/腕反配置：
$$
\begin{cases}
\theta_5^{(1)} = \text{atan2}(+\sqrt{1-c_5^2}, \; c_5) & \text{(腕正, } s_5 > 0\text{)} \\
\theta_5^{(2)} = \text{atan2}(-\sqrt{1-c_5^2}, \; c_5) & \text{(腕反, } s_5 < 0\text{)}
\end{cases}
$$

---

### 4.2 求解 $\theta_4$（关节4）

#### 4.2.1 推导过程

将接近向量 $\vec{a}$ 投影到关节3坐标系的X轴和Y轴方向：

$$
\boxed{
\begin{aligned}
\sin\theta_4 \cdot \sin\theta_5 &= -\sin\theta_1 \cdot a_x + \cos\theta_1 \cdot a_y \\
\cos\theta_4 \cdot \sin\theta_5 &= -\cos\theta_{23}(\cos\theta_1 \cdot a_x + \sin\theta_1 \cdot a_y) + \sin\theta_{23} \cdot a_z
\end{aligned}
}
$$

简写形式：
$$
\begin{aligned}
s_4 \cdot s_5 &= -s_1 a_x + c_1 a_y \\
c_4 \cdot s_5 &= -c_{23}(c_1 a_x + s_1 a_y) + s_{23} a_z
\end{aligned}
$$

#### 4.2.2 求解公式（当 $\sin\theta_5 \neq 0$）

$$
\boxed{\theta_4 = \text{atan2}(-\sin\theta_1 \cdot a_x + \cos\theta_1 \cdot a_y, \; -\cos\theta_{23}(\cos\theta_1 \cdot a_x + \sin\theta_1 \cdot a_y) + \sin\theta_{23} \cdot a_z)}
$$

简写：
$$
\theta_4 = \text{atan2}(s_4 s_5, \; c_4 s_5)
$$

---

### 4.3 求解 $\theta_6$（关节6）

#### 4.3.1 推导过程

将法向量 $\vec{n}$ 和方向向量 $\vec{o}$ 投影到关节3坐标系的Z轴方向：

$$
\boxed{
\begin{aligned}
\sin\theta_6 \cdot \sin\theta_5 &= \cos\theta_1 \sin\theta_{23} \cdot o_x + \sin\theta_1 \sin\theta_{23} \cdot o_y + \cos\theta_{23} \cdot o_z \\
\cos\theta_6 \cdot \sin\theta_5 &= -\cos\theta_1 \sin\theta_{23} \cdot n_x - \sin\theta_1 \sin\theta_{23} \cdot n_y - \cos\theta_{23} \cdot n_z
\end{aligned}
}
$$

简写形式：
$$
\begin{aligned}
s_6 \cdot s_5 &= c_1 s_{23} o_x + s_1 s_{23} o_y + c_{23} o_z \\
c_6 \cdot s_5 &= -c_1 s_{23} n_x - s_1 s_{23} n_y - c_{23} n_z
\end{aligned}
$$

#### 4.3.2 求解公式（当 $\sin\theta_5 \neq 0$）

$$
\boxed{\theta_6 = \text{atan2}(\cos\theta_1 \sin\theta_{23} \cdot o_x + \sin\theta_1 \sin\theta_{23} \cdot o_y + \cos\theta_{23} \cdot o_z, \; -\cos\theta_1 \sin\theta_{23} \cdot n_x - \sin\theta_1 \sin\theta_{23} \cdot n_y - \cos\theta_{23} \cdot n_z)}
$$

简写：
$$
\theta_6 = \text{atan2}(s_6 s_5, \; c_6 s_5)
$$

---

### 4.4 奇异位形处理（$\sin\theta_5 = 0$）

当 $\theta_5 = 0$ 或 $\theta_5 = \pi$ 时，$\sin\theta_5 = 0$，此时关节4和关节6轴线重合，产生**腕部奇异**。

#### 奇异位形特征
$$
s_5 = 0 \Rightarrow \theta_4 + \theta_6 = \text{常数}
$$

#### 处理方法
任意指定 $\theta_4$（通常取 $\theta_4 = 0$ 或保持当前值），然后求解组合角：

$$
\theta_4 + \theta_6 = \text{atan2}(-s_1 n_x + c_1 n_y, \; c_1 c_{23} n_x + s_1 c_{23} n_y - s_{23} n_z)
$$

$$
\theta_6 = (\theta_4 + \theta_6) - \theta_4
$$

---

## 5. 完整求解流程图

```
输入：末端位姿矩阵 T
        │
        ▼
┌───────────────────────────────────┐
│ 步骤1：计算腕心位置                │
│ pwx = px - d6·ax                  │
│ pwy = py - d6·ay                  │
│ pwz = pz - d6·az                  │
└───────────────┬───────────────────┘
                │
                ▼
┌───────────────────────────────────┐
│ 步骤2：求解 θ1（2个解）            │
│ θ1 = atan2(pwy, pwx)              │
│ θ1' = θ1 + π                      │
└───────────────┬───────────────────┘
                │
        ┌───────┴───────┐
        ▼               ▼
    [θ1解1]         [θ1解2]
        │               │
        ▼               ▼
┌───────────────────────────────────┐
│ 步骤3：计算中间变量 A, B           │
│ A = c1·pwx + s1·pwy - a1          │
│ B = -pwz + d1                     │
└───────────────┬───────────────────┘
                │
                ▼
┌───────────────────────────────────┐
│ 步骤4：求解 θ3（2个解）            │
│ K = (A²+B²-a2²-a3²-d4²)/(2a2)     │
│ ρ = √(a3²+d4²)                    │
│ φ = atan2(d4, a3)                 │
│ θ3 = ±acos(K/ρ) - φ               │
└───────────────┬───────────────────┘
                │
        ┌───────┴───────┐
        ▼               ▼
    [θ3解1]         [θ3解2]
    (肘上)          (肘下)
        │               │
        ▼               ▼
┌───────────────────────────────────┐
│ 步骤5：求解 θ2                     │
│ k1 = a2 + a3·c3 - d4·s3           │
│ k2 = a3·s3 + d4·c3                │
│ θ2 = atan2(k1·B-k2·A, k1·A+k2·B)  │
└───────────────┬───────────────────┘
                │
                ▼
┌───────────────────────────────────┐
│ 步骤6：计算 θ23 及三角函数         │
│ θ23 = θ2 + θ3                     │
│ c23 = cos(θ23), s23 = sin(θ23)    │
└───────────────┬───────────────────┘
                │
                ▼
┌───────────────────────────────────┐
│ 步骤7：求解 θ5（2个解）            │
│ c5 = -s23(c1·ax+s1·ay) - c23·az   │
│ θ5 = atan2(±√(1-c5²), c5)         │
└───────────────┬───────────────────┘
                │
        ┌───────┴───────┐
        ▼               ▼
    [θ5解1]         [θ5解2]
    (腕正)          (腕反)
        │               │
        ▼               ▼
┌───────────────────────────────────┐
│ 步骤8：求解 θ4                     │
│ s4·s5 = -s1·ax + c1·ay            │
│ c4·s5 = -c23(c1·ax+s1·ay)+s23·az  │
│ θ4 = atan2(s4·s5, c4·s5)          │
└───────────────┬───────────────────┘
                │
                ▼
┌───────────────────────────────────┐
│ 步骤9：求解 θ6                     │
│ s6·s5 = c1·s23·ox+s1·s23·oy+c23·oz│
│ c6·s5 = -c1·s23·nx-s1·s23·ny-c23·nz│
│ θ6 = atan2(s6·s5, c6·s5)          │
└───────────────┬───────────────────┘
                │
                ▼
        输出：8组关节角解
```

---

## 6. 公式汇总表

### 6.1 腕心位置
| 公式 | 表达式 |
|------|--------|
| 腕心X | $p_{wx} = p_x - d_6 a_x$ |
| 腕心Y | $p_{wy} = p_y - d_6 a_y$ |
| 腕心Z | $p_{wz} = p_z - d_6 a_z$ |

### 6.2 位置求解
| 关节 | 公式 | 解数 |
|------|------|------|
| $\theta_1$ | $\text{atan2}(p_{wy}, p_{wx})$ | 2 |
| 中间变量A | $c_1 p_{wx} + s_1 p_{wy} - a_1$ | - |
| 中间变量B | $-p_{wz} + d_1$ | - |
| 中间变量K | $\frac{A^2+B^2-a_2^2-a_3^2-d_4^2}{2a_2}$ | - |
| $\rho$ | $\sqrt{a_3^2 + d_4^2}$ | - |
| $\phi$ | $\text{atan2}(d_4, a_3)$ | - |
| $\theta_3$ | $\pm\arccos(K/\rho) - \phi$ | 2 |
| $k_1$ | $a_2 + a_3 c_3 - d_4 s_3$ | - |
| $k_2$ | $a_3 s_3 + d_4 c_3$ | - |
| $\theta_2$ | $\text{atan2}(k_1 B - k_2 A, k_1 A + k_2 B)$ | 1 |

### 6.3 姿态求解
| 关节 | 公式 | 解数 |
|------|------|------|
| $\cos\theta_5$ | $-s_{23}(c_1 a_x + s_1 a_y) - c_{23} a_z$ | - |
| $\theta_5$ | $\text{atan2}(\pm\sqrt{1-c_5^2}, c_5)$ | 2 |
| $s_4 s_5$ | $-s_1 a_x + c_1 a_y$ | - |
| $c_4 s_5$ | $-c_{23}(c_1 a_x + s_1 a_y) + s_{23} a_z$ | - |
| $\theta_4$ | $\text{atan2}(s_4 s_5, c_4 s_5)$ | 1 |
| $s_6 s_5$ | $c_1 s_{23} o_x + s_1 s_{23} o_y + c_{23} o_z$ | - |
| $c_6 s_5$ | $-c_1 s_{23} n_x - s_1 s_{23} n_y - c_{23} n_z$ | - |
| $\theta_6$ | $\text{atan2}(s_6 s_5, c_6 s_5)$ | 1 |

### 6.4 总解数
$$
\text{总解数} = 2(\theta_1) \times 2(\theta_3) \times 2(\theta_5) = 8 \text{ 组解}
$$

---

## 7. 符号说明

| 符号 | 含义 |
|------|------|
| $c_i$ | $\cos\theta_i$ |
| $s_i$ | $\sin\theta_i$ |
| $c_{23}$ | $\cos(\theta_2 + \theta_3)$ |
| $s_{23}$ | $\sin(\theta_2 + \theta_3)$ |
| $\vec{n}$ | 末端坐标系X轴在基坐标系的方向（法向量） |
| $\vec{o}$ | 末端坐标系Y轴在基坐标系的方向（方向向量） |
| $\vec{a}$ | 末端坐标系Z轴在基坐标系的方向（接近向量） |
| $\vec{p}$ | 末端在基坐标系的位置向量 |
| $\vec{P}_w$ | 腕心在基坐标系的位置向量 |

---

## 8. 注意事项

### 8.1 数值稳定性
1. **acos 输入范围**：确保 $|K/\rho| \leq 1$，超出范围时需钳位处理
2. **除零保护**：当 $k_1^2 + k_2^2 \approx 0$ 时需特殊处理
3. **奇异位形**：当 $|s_5| < \epsilon$（如 $10^{-6}$）时，$\theta_4$ 和 $\theta_6$ 耦合

### 8.2 角度归一化
所有输出角度应归一化到 $[-\pi, \pi]$ 范围：
$$
\theta = \theta - 2\pi \cdot \text{round}\left(\frac{\theta}{2\pi}\right)
$$

### 8.3 解的有效性验证
- 检查解是否满足关节限位
- 可通过正运动学验证解的正确性
- 排除包含 NaN 或 Inf 的无效解