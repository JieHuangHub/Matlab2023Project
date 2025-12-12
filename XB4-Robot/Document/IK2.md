# 6自由度机械臂逆运动学 - 完整8组解

## 一、多解来源分析

### 1.1 三种构型选择

| 构型 | 选择 | 影响的关节 | 几何意义 |
|------|------|------------|----------|
| **肩部构型** | 左肩 / 右肩 | $\theta_1$ | 基座旋转方向 |
| **肘部构型** | 肘上 / 肘下 | $\theta_3, \theta_2$ | 手臂弯曲方向 |
| **腕部构型** | 翻腕 / 不翻腕 | $\theta_4, \theta_5, \theta_6$ | 腕部翻转180° |

总解数：$2 \times 2 \times 2 = 8$ 组

### 1.2 构型编码

使用三个标志位表示构型：

```
cfg = [shoulder, elbow, wrist]

shoulder:   0 = 前伸（默认）    1 = 后伸
elbow:     0 = 肘上           1 = 肘下  
wrist:     0 = 不翻腕（默认）  1 = 翻腕
```

### 6R 机械臂逆运动学的 8 种构型组合

| 解编号 | shoulder | elbow | wrist | 构型描述 |
|--------|----------|-------|-------|----------|
| 1 | 0 | 0 | 0 | 前伸 - 肘上 - 不翻腕 |
| 2 | 0 | 0 | 1 | 前伸 - 肘上 - 翻腕 |
| 3 | 0 | 1 | 0 | 前伸 - 肘下 - 不翻腕 |
| 4 | 0 | 1 | 1 | 前伸 - 肘下 - 翻腕 |
| 5 | 1 | 0 | 0 | 后伸 - 肘上 - 不翻腕 |
| 6 | 1 | 0 | 1 | 后伸 - 肘上 - 翻腕 |
| 7 | 1 | 1 | 0 | 后伸 - 肘下 - 不翻腕 |
| 8 | 1 | 1 | 1 | 后伸 - 肘下 - 翻腕 |


---

## 二、完整求解公式

### 2.1 预处理：计算腕部中心

腕部中心位置（消除工具长度 $d_t$ 的影响）：

$$
\vec{P}_w = \vec{P} - d_t \cdot \vec{a} = \begin{bmatrix} p_x - d_t a_x \\ p_y - d_t a_y \\ p_z - d_t a_z \end{bmatrix}
$$

记为：

$$
P_{wx} = p_x - d_t a_x
$$

$$
P_{wy} = p_y - d_t a_y  
$$

$$
P_{wz} = p_z - d_t a_z
$$

---

### 2.2 求解 $\theta_1$（2个解）

#### 基础解

$$
\theta_1^{base} = \text{atan2}(P_{wy}, P_{wx})
$$

#### 完整两个解

$$
\boxed{
\theta_1 = \begin{cases}
\theta_1^{base} & \text{if } shoulder = 0 \text{ (前伸)} \\[8pt]
\theta_1^{base} + \pi & \text{if } shoulder = 1 \text{ (后伸)}
\end{cases}
}
$$

> **注意**：选择后伸构型后，需要对 $\theta_1$ 进行角度归一化到 $[-\pi, \pi]$

#### 角度归一化函数

$$
\text{normalize}(\theta) = \text{atan2}(\sin\theta, \cos\theta)
$$

---

### 2.3 求解 $\theta_3$（2个解）

#### 步骤1：计算腕部中心在关节1坐标系中的位置

$$
m = c_1 P_{wx} + s_1 P_{wy} - a_1
$$

$$
n = P_{wz} - d_1
$$

#### 步骤2：计算判别式

$$
K = m^2 + n^2 - a_2^2 - a_3^2 - d_4^2
$$

$$
D = 2a_2\sqrt{a_3^2 + d_4^2}
$$

#### 步骤3：检查可达性

$$
\text{如果 } |K| > |D|, \text{ 则目标点不可达}
$$

#### 步骤4：求解

$$
\phi = \text{atan2}(-d_4, a_3)
$$

$$
\psi = \arccos\left(\frac{K}{D}\right)
$$

#### 完整两个解

$$
\boxed{
\theta_3 = \begin{cases}
\phi + \psi & \text{if } elbow = 0 \text{ (肘上)} \\[8pt]
\phi - \psi & \text{if } elbow = 1 \text{ (肘下)}
\end{cases}
}
$$

---

### 2.4 求解 $\theta_2$（由 $\theta_1, \theta_3$ 唯一确定）

#### 步骤1：计算系数

$$
k_1 = a_2 + a_3 c_3 - d_4 s_3
$$

$$
k_2 = -a_3 s_3 - d_4 c_3
$$

#### 步骤2：求解

$$
\boxed{\theta_2 = \text{atan2}(k_2 m - k_1 n, \ k_1 m + k_2 n)}
$$

其中 $m, n$ 的计算使用当前 $\theta_1$ 值。

---

### 2.5 求解 $\theta_4, \theta_5, \theta_6$（腕部构型影响）

#### 预计算：中间变量

首先计算一些公共表达式：

$$
c_{23} = \cos(\theta_2 + \theta_3), \quad s_{23} = \sin(\theta_2 + \theta_3)
$$

$$
A_x = c_1 a_x + s_1 a_y
$$

$$
A_y = -s_1 a_x + c_1 a_y
$$

$$
A_z = a_z
$$

$$
N_x = c_1 n_x + s_1 n_y
$$

$$
N_y = -s_1 n_x + c_1 n_y
$$

$$
N_z = n_z
$$

#### 2.5.1 求解 $\theta_5$（基础解）

$$
s_5^{base} = -c_4^{base}(c_{23} A_x - s_{23} A_z) - s_4^{base} A_y
$$

$$
c_5^{base} = -s_{23} A_x - c_{23} A_z
$$

但这里 $\theta_4$ 尚未求出，我们需要换一种方法。

**方法：先求 $c_5$，再根据构型确定 $s_5$ 的符号**

$$
c_5 = -s_{23} A_x - c_{23} A_z = -s_{23}(c_1 a_x + s_1 a_y) - c_{23} a_z
$$

$$
s_5^2 = 1 - c_5^2
$$

#### 完整两个解（腕部构型）

$$
\boxed{
\theta_5 = \begin{cases}
\text{atan2}(+\sqrt{1 - c_5^2}, \ c_5) & \text{if } wrist = 0 \text{ (不翻腕)} \\[8pt]
\text{atan2}(-\sqrt{1 - c_5^2}, \ c_5) & \text{if } wrist = 1 \text{ (翻腕)}
\end{cases}
}
$$

或等价地：

$$
\boxed{
\theta_5 = \begin{cases}
\arccos(c_5) & \text{if } wrist = 0 \\[8pt]
-\arccos(c_5) & \text{if } wrist = 1
\end{cases}
}
$$

---

#### 2.5.2 求解 $\theta_4$

**非奇异情况**（$s_5 \neq 0$）：

从矩阵方程中：

$$
L_{13} = c_{23} A_x - s_{23} A_z = -c_4 s_5
$$

$$
L_{33} = A_y = s_4 s_5
$$

$$
\boxed{\theta_4 = \text{atan2}(L_{33}, -L_{13}) = \text{atan2}(A_y, -(c_{23} A_x - s_{23} A_z))}
$$

**但需要根据腕部构型调整**：

当 $wrist = 1$（翻腕）时，$s_5$ 变号，所以：

$$
\boxed{
\theta_4 = \begin{cases}
\text{atan2}(A_y, -(c_{23} A_x - s_{23} A_z)) & \text{if } wrist = 0 \\[8pt]
\text{atan2}(-A_y, +(c_{23} A_x - s_{23} A_z)) & \text{if } wrist = 1
\end{cases}
}
$$

简化形式：

$$
\boxed{
\theta_4 = \begin{cases}
\text{atan2}(L_{33}, -L_{13}) & \text{if } wrist = 0 \\[8pt]
\text{atan2}(-L_{33}, +L_{13}) = \text{atan2}(L_{33}, -L_{13}) + \pi & \text{if } wrist = 1
\end{cases}
}
$$

---

#### 2.5.3 求解 $\theta_6$

从矩阵方程 $T_{50}^{-1} T_{60} = T_{65}$ 中：

**计算 $T_{50}$ 旋转矩阵第1列和第3列**（使用当前 $\theta_1 \sim \theta_5$）：

$$
r_{11}^{(5)} = c_5(c_1 c_{23} c_4 + s_1 s_4) - s_5 c_1 s_{23}
$$

$$
r_{21}^{(5)} = c_5(s_1 c_{23} c_4 - c_1 s_4) - s_5 s_1 s_{23}
$$

$$
r_{31}^{(5)} = -c_5 s_{23} c_4 + s_5 c_{23}
$$

$$
r_{13}^{(5)} = c_1 c_{23} s_4 - s_1 c_4
$$

$$
r_{23}^{(5)} = s_1 c_{23} s_4 + c_1 c_4
$$

$$
r_{33}^{(5)} = -s_{23} s_4
$$

**计算**：

$$
u_{11} = r_{11}^{(5)} n_x + r_{21}^{(5)} n_y + r_{31}^{(5)} n_z
$$

$$
u_{31} = r_{13}^{(5)} n_x + r_{23}^{(5)} n_y + r_{33}^{(5)} n_z
$$

$$
\boxed{\theta_6 = \text{atan2}(-u_{31}, u_{11})}
$$

> **注意**：$\theta_6$ 的计算已经隐含了腕部构型的影响（因为使用了当前的 $\theta_4, \theta_5$）

---

## 三、奇异位形处理

### 3.1 腕部奇异（$s_5 \approx 0$）

当 $|s_5| < \epsilon$（如 $\epsilon = 10^{-6}$）时：

**问题**：$\theta_4$ 和 $\theta_6$ 耦合，只有 $\theta_4 + \theta_6$ 或 $\theta_4 - \theta_6$ 可确定。

**处理方法**：

$$
\text{令 } \theta_4 = \theta_{4,prev} \text{ (保持上一时刻值，或设为0)}
$$

然后从旋转矩阵关系求 $\theta_6$：

当 $\theta_5 \approx 0$ 时：

$$
\theta_4 + \theta_6 = \text{atan2}(r_{12}^{target}, r_{11}^{target}) - \text{(前三关节贡献)}
$$

当 $\theta_5 \approx \pi$ 时：

$$
\theta_4 - \theta_6 = \text{atan2}(-r_{12}^{target}, r_{11}^{target}) - \text{(前三关节贡献)}
$$

**简化处理**：

```python
if abs(s5) < 1e-6:
    theta4 = theta4_prev  # 或 0
    # 从旋转矩阵直接计算 theta6
    # R_30^T * R_target = R_63
    # 当 s5≈0 时，R_63 简化
    theta6 = atan2(... ) - theta4  # 具体公式见下
```

### 3.2 肩部奇异（腕部中心在Z轴上）

当 $P_{wx}^2 + P_{wy}^2 < \epsilon$ 时：

**问题**：$\theta_1$ 不定

**处理方法**：

$$
\theta_1 = \theta_{1,prev} \text{ (保持上一时刻值)}
$$

### 3.3 肘部奇异（手臂完全伸直或折叠）

当 $|K| \approx |D|$ 时：

**问题**：$\arccos$ 参数接近 $\pm 1$，$\theta_3$ 只有一个解

**处理方法**：

$$
\theta_3 = \phi \pm 0 = \phi \text{ (单一解)}
$$

---

## 四、完整求解算法

### 4.1 伪代码

```
function inverse_kinematics(T_target, config):
    # 输入：目标位姿 T_target, 构型选择 config = [shoulder, elbow, wrist]
    # 输出：关节角 [θ1, θ2, θ3, θ4, θ5, θ6] 或 None（不可达）
    
    # 提取目标位姿
    n = T_target[0:3, 0]  # 法向量
    o = T_target[0:3, 1]  # 方向向量
    a = T_target[0:3, 2]  # 接近向量
    p = T_target[0:3, 3]  # 位置向量
    
    # ========== Step 0: 预处理 ==========
    # 计算腕部中心
    Pw = p - dt * a
    Pwx, Pwy, Pwz = Pw[0], Pw[1], Pw[2]
    
    # ========== Step 1: 求解 θ1 ==========
    theta1_base = atan2(Pwy, Pwx)
    
    if config. shoulder == 0:
        theta1 = theta1_base
    else:
        theta1 = normalize(theta1_base + pi)
    
    c1, s1 = cos(theta1), sin(theta1)
    
    # ========== Step 2: 求解 θ3 ==========
    m = c1 * Pwx + s1 * Pwy - a1
    n_val = Pwz - d1
    
    K = m^2 + n_val^2 - a2^2 - a3^2 - d4^2
    D = 2 * a2 * sqrt(a3^2 + d4^2)
    
    # 可达性检查
    if abs(K) > abs(D):
        return None  # 不可达
    
    phi = atan2(-d4, a3)
    psi = acos(K / D)
    
    if config.elbow == 0:
        theta3 = phi + psi  # 肘上
    else:
        theta3 = phi - psi  # 肘下
    
    c3, s3 = cos(theta3), sin(theta3)
    
    # ========== Step 3: 求解 θ2 ==========
    k1 = a2 + a3 * c3 - d4 * s3
    k2 = -a3 * s3 - d4 * c3
    
    theta2 = atan2(k2 * m - k1 * n_val, k1 * m + k2 * n_val)
    
    c2, s2 = cos(theta2), sin(theta2)
    c23 = cos(theta2 + theta3)
    s23 = sin(theta2 + theta3)
    
    # ========== Step 4: 求解 θ5 ==========
    Ax = c1 * a[0] + s1 * a[1]
    Ay = -s1 * a[0] + c1 * a[1]
    Az = a[2]
    
    c5 = -s23 * Ax - c23 * Az
    
    # 限制 c5 在 [-1, 1] 范围内（数值稳定性）
    c5 = clip(c5, -1, 1)
    
    if config.wrist == 0:
        theta5 = acos(c5)      # 不翻腕，s5 >= 0
    else:
        theta5 = -acos(c5)     # 翻腕，s5 <= 0
    
    s5 = sin(theta5)
    
    # ========== Step 5: 求解 θ4 ==========
    L13 = c23 * Ax - s23 * Az
    L33 = Ay
    
    # 奇异检查
    if abs(s5) < 1e-10:
        # 腕部奇异，θ4 设为上一时刻值或 0
        theta4 = 0  # 或 theta4_prev
    else:
        if config.wrist == 0:
            theta4 = atan2(L33, -L13)
        else:
            theta4 = atan2(-L33, L13)
    
    c4, s4 = cos(theta4), sin(theta4)
    
    # ========== Step 6: 求解 θ6 ==========
    # 计算 T50 的旋转矩阵元素
    r11_5 = c5 * (c1 * c23 * c4 + s1 * s4) - s5 * c1 * s23
    r21_5 = c5 * (s1 * c23 * c4 - c1 * s4) - s5 * s1 * s23
    r31_5 = -c5 * s23 * c4 + s5 * c23
    
    r13_5 = c1 * c23 * s4 - s1 * c4
    r23_5 = s1 * c23 * s4 + c1 * c4
    r33_5 = -s23 * s4
    
    nx, ny, nz = n[0], n[1], n[2]
    
    u11 = r11_5 * nx + r21_5 * ny + r31_5 * nz
    u31 = r13_5 * nx + r23_5 * ny + r33_5 * nz
    
    theta6 = atan2(-u31, u11)
    
    # ========== 返回结果 ==========
    return [theta1, theta2, theta3, theta4, theta5, theta6]
```

### 4.2 获取全部8组解

```
function get_all_solutions(T_target):
    solutions = []
    
    for shoulder in [0, 1]:
        for elbow in [0, 1]:
            for wrist in [0, 1]:
                config = Configuration(shoulder, elbow, wrist)
                result = inverse_kinematics(T_target, config)
                
                if result is not None: 
                    # 检查关节限位
                    if check_joint_limits(result):
                        solutions.append({
                            'config': config,
                            'joints': result
                        })
    
    return solutions
```

---

## 五、公式汇总（完整版）

### 5.1 $\theta_1$ 完整公式

$$
\boxed{
\theta_1 = \text{atan2}(p_y - d_t a_y, \ p_x - d_t a_x) + shoulder \cdot \pi
}
$$

其中 $shoulder \in \{0, 1\}$

---

### 5.2 $\theta_3$ 完整公式

**中间变量**：

$$
m = c_1(p_x - d_t a_x) + s_1(p_y - d_t a_y) - a_1
$$

$$
n = (p_z - d_t a_z) - d_1
$$

$$
K = m^2 + n^2 - a_2^2 - a_3^2 - d_4^2
$$

**求解**：

$$
\boxed{
\theta_3 = \text{atan2}(-d_4, a_3) + (1 - 2 \cdot elbow) \cdot \arccos\left(\frac{K}{2a_2\sqrt{a_3^2 + d_4^2}}\right)
}
$$

其中 $elbow \in \{0, 1\}$，$(1 - 2 \cdot elbow)$ 产生 $+1$ 或 $-1$

---

### 5.3 $\theta_2$ 完整公式

**系数**：

$$
k_1 = a_2 + a_3 \cos\theta_3 - d_4 \sin\theta_3
$$

$$
k_2 = -a_3 \sin\theta_3 - d_4 \cos\theta_3
$$

**求解**：

$$
\boxed{\theta_2 = \text{atan2}(k_2 m - k_1 n, \ k_1 m + k_2 n)}
$$

---

### 5.4 $\theta_5$ 完整公式

**中间变量**：

$$
c_5 = -\sin(\theta_2 + \theta_3)(c_1 a_x + s_1 a_y) - \cos(\theta_2 + \theta_3) a_z
$$

**求解**：

$$
\boxed{
\theta_5 = (1 - 2 \cdot wrist) \cdot \arccos(c_5)
}
$$

其中 $wrist \in \{0, 1\}$

---

### 5.5 $\theta_4$ 完整公式

**中间变量**：

$$
L_{13} = c_{23}(c_1 a_x + s_1 a_y) - s_{23} a_z
$$

$$
L_{33} = -s_1 a_x + c_1 a_y
$$

**求解**：

$$
\boxed{
\theta_4 = \text{atan2}\Big((1 - 2 \cdot wrist) \cdot L_{33}, \ -(1 - 2 \cdot wrist) \cdot L_{13}\Big)
}
$$

或简化为：

$$
\boxed{
\theta_4 = \text{atan2}(L_{33}, -L_{13}) + wrist \cdot \pi
}
$$

---

### 5.6 $\theta_6$ 完整公式

**$T_{50}$ 旋转矩阵元素**：

$$
r_{11}^{(5)} = c_5(c_1 c_{23} c_4 + s_1 s_4) - s_5 c_1 s_{23}
$$

$$
r_{21}^{(5)} = c_5(s_1 c_{23} c_4 - c_1 s_4) - s_5 s_1 s_{23}
$$

$$
r_{31}^{(5)} = -c_5 s_{23} c_4 + s_5 c_{23}
$$

$$
r_{13}^{(5)} = c_1 c_{23} s_4 - s_1 c_4
$$

$$
r_{23}^{(5)} = s_1 c_{23} s_4 + c_1 c_4
$$

$$
r_{33}^{(5)} = -s_{23} s_4
$$

**求解**：

$$
u_{11} = r_{11}^{(5)} n_x + r_{21}^{(5)} n_y + r_{31}^{(5)} n_z
$$

$$
u_{31} = r_{13}^{(5)} n_x + r_{23}^{(5)} n_y + r_{33}^{(5)} n_z
$$

$$
\boxed{\theta_6 = \text{atan2}(-u_{31}, u_{11})}
$$

---

## 六、求解流程图

```
                    输入:  目标位姿 T₆₀
                           │
                           ▼
              ┌────────────────────────┐
              │  计算腕部中心 Pw = P - dt·a  │
              └────────────┬───────────┘
                           │
           ┌───────────────┴───────────────┐
           │         遍历 8 种构型           │
           │  shoulder ∈ {0,1}             │
           │  elbow ∈ {0,1}                │
           │  wrist ∈ {0,1}                │
           └───────────────┬───────────────┘
                           │
                           ▼
              ┌────────────────────────┐
              │  Step 1: 求 θ₁          │
              │  θ₁ = atan2(Pwy,Pwx)    │
              │       + shoulder·π     │
              └────────────┬───────────┘
                           │
                           ▼
              ┌────────────────────────┐
              │  Step 2: 计算 m, n, K    │
              │  检查可达性:  |K| ≤ |D|   │
              └────────────┬───────────┘
                           │
                    ┌──────┴──────┐
                    │             │
                不可达           可达
                    │             │
                    ▼             ▼
                 跳过        ┌────────────────────────┐
                           │  Step 3: 求 θ₃          │
                           │  θ₃ = φ ± ψ (根据elbow) │
                           └────────────┬───────────┘
                                       │
                                       ▼
                           ┌────────────────────────┐
                           │  Step 4: 求 θ₂          │
                           │  θ₂ = atan2(...)       │
                           └────────────┬───────────┘
                                       │
                                       ▼
                           ┌────────────────────────┐
                           │  Step 5: 求 θ₅          │
                           │  θ₅ = ±acos(c₅)        │
                           │      (根据wrist)       │
                           └────────────┬───────────┘
                                       │
                                       ▼
                           ┌────────────────────────┐
                           │  Step 6: 求 θ₄          │
                           │  检查奇异:  |s₅| < ε    │
                           └────────────┬───────────┘
                                       │
                                       ▼
                           ┌────────────────────────┐
                           │  Step 7: 求 θ₆          │
                           └────────────┬───────────┘
                                       │
                                       ▼
                           ┌────────────────────────┐
                           │  检查关节限位           │
                           └────────────┬───────────┘
                                       │
                                ┌──────┴──────┐
                                │             │
                             超限           合法
                                │             │
                                ▼             ▼
                             丢弃         保存解
                           
                           │
                           ▼
              ┌────────────────────────┐
              │    输出:  有效解列表      │
              │    (0~8组解)           │
              └────────────────────────┘
```

---

## 七、验证与测试

### 7.1 正运动学验证

对于每组逆运动学解 $[\theta_1, \theta_2, \theta_3, \theta_4, \theta_5, \theta_6]$：

```
T_calc = T₁₀(θ₁) · T₂₁(θ₂) · T₃₂(θ₃) · T₄₃(θ₄) · T₅₄(θ₅) · T₆₅(θ₆)

位置误差:  ε_p = ||P_calc - P_target||
姿态误差: ε_R = ||R_calc - R_target||_F

验证通过条件:  ε_p < 1e-6 且 ε_R < 1e-6
```

### 7.2 测试用例

**特殊位姿测试**：

| 测试点 | 位置 | 姿态 | 预期解数 |
|--------|------|------|----------|
| 零位 | $(d_4+d_t+a_1, 0, a_3+a_2+d_1)$ | $R_z(0)$ | 8 |
| 正上方 | $(0, 0, a_2+a_3+d_4+d_1)$ | $R_x(\pi)$ | 肩部奇异 |
| 完全伸展 | 最远点 | - | 肘部奇异，≤4解 |
| 腕部奇异 | 任意 | $\theta_5=0$ | 腕部奇异 |