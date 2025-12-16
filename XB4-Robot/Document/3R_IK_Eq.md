## 一、符号定义

### 1.1 MDH参数（常量）

| 符号 | 值 (m) | 说明 |
|------|--------|------|
| d₁ | 0.342 | 基座高度 |
| a₁ | 0.040 | 肩关节偏移 |
| a₂ | 0.275 | 大臂长度 |
| a₃ | 0.025 | 小臂偏移 |
| d₄ | 0.280 | 腕部偏移 |


### 1.2 各关节MDH参数表

| 关节 i | α(i-1) | a(i-1) | d_i | θ_offset | 说明 |
|--------|--------|--------|-----|----------|------|
| 1 | 0 | 0 | d₁  | 0 | 基座高度 |
| 2 | -90° | a₁ | 0   | -90° | 肩关节偏移 |
| 3 | 0 | a₂ | 0   | 0 | 大臂 |
| 4 | -90° | a₃ | d₄  | 0 | 小臂、腕部 |
| 5 | 90° | 0 | 0   | 0 | 腕关节 |
| 6 | -90° | 0 | 0   | 0 | 末端工具 |

### 1.3 三角函数简写

| 简写 | 含义 |
|:----:|:-----|
| $c_i$ | $\cos(\theta_i)$ |
| $s_i$ | $\sin(\theta_i)$ |
| $c_{ij}$ | $\cos(\theta_i + \theta_j)$ |
| $s_{ij}$ | $\sin(\theta_i + \theta_j)$ |

### 1.4 末端位姿矩阵

目标位姿矩阵 ${}^{0}T_{6}$ 定义为：

$$
{}^{0}T_{6} = \begin{bmatrix} 
n_x & o_x & a_x & p_x \\ 
n_y & o_y & a_y & p_y \\ 
n_z & o_z & a_z & p_z \\ 
0 & 0 & 0 & 1 
\end{bmatrix}
= \begin{bmatrix} 
\vec{n} & \vec{o} & \vec{a} & \vec{p} \\ 
0 & 0 & 0 & 1 
\end{bmatrix}
$$

其中：
- $\vec{n} = (n_x, n_y, n_z)^T$：法向量（Normal）
- $\vec{o} = (o_x, o_y, o_z)^T$：方向向量（Orientation）
- $\vec{a} = (a_x, a_y, a_z)^T$：接近向量（Approach）
- $\vec{p} = (p_x, p_y, p_z)^T$：位置向量（Position）

---

## 二、正运动学

### 2.1 通用齐次变换矩阵（MDH Convention）

根据Modified DH参数，相邻坐标系间的齐次变换矩阵为：

$$
{}^{i-1}T_{i} = \begin{bmatrix}
c_{\theta_i} & -s_{\theta_i} & 0 & a_{i-1} \\
s_{\theta_i} c_{\alpha_{i-1}} & c_{\theta_i} c_{\alpha_{i-1}} & -s_{\alpha_{i-1}} & -s_{\alpha_{i-1}} d_i \\
s_{\theta_i} s_{\alpha_{i-1}} & c_{\theta_i} s_{\alpha_{i-1}} & c_{\alpha_{i-1}} & c_{\alpha_{i-1}} d_i \\
0 & 0 & 0 & 1
\end{bmatrix}
$$

### 2.2 各关节变换矩阵

#### 矩阵 ${}^{0}T_{1}$

$$
{}^{0}T_{1} = \begin{bmatrix}
c_1 & -s_1 & 0 & 0 \\
s_1 & c_1 & 0 & 0 \\
0 & 0 & 1 & d_1 \\
0 & 0 & 0 & 1
\end{bmatrix}, \quad \theta_1 = q_1
$$

#### 矩阵 ${}^{1}T_{2}$

$$
{}^{1}T_{2} = \begin{bmatrix}
c_2 & -s_2 & 0 & a_1 \\
0 & 0 & 1 & 0 \\
-s_2 & -c_2 & 0 & 0 \\
0 & 0 & 0 & 1
\end{bmatrix}, \quad \theta_2 = q_2 - \frac{\pi}{2}
$$

#### 矩阵 ${}^{2}T_{3}$

$$
{}^{2}T_{3} = \begin{bmatrix}
c_3 & -s_3 & 0 & a_2 \\
s_3 & c_3 & 0 & 0 \\
0 & 0 & 1 & 0 \\
0 & 0 & 0 & 1
\end{bmatrix}, \quad \theta_3 = q_3
$$

#### 矩阵 ${}^{3}T_{4}$

$$
{}^{3}T_{4} = \begin{bmatrix}
c_4 & -s_4 & 0 & a_3 \\
0 & 0 & 1 & d_4 \\
-s_4 & -c_4 & 0 & 0 \\
0 & 0 & 0 & 1
\end{bmatrix}, \quad \theta_4 = q_4
$$

#### 矩阵 ${}^{4}T_{5}$

$$
{}^{4}T_{5} = \begin{bmatrix}
c_5 & -s_5 & 0 & 0 \\
0 & 0 & -1 & 0 \\
s_5 & c_5 & 0 & 0 \\
0 & 0 & 0 & 1
\end{bmatrix}, \quad \theta_5 = q_5
$$

#### 矩阵 ${}^{5}T_{6}$

$$
{}^{5}T_{6} = \begin{bmatrix}
c_6 & -s_6 & 0 & 0 \\
0 & 0 & 1 & 0 \\
-s_6 & -c_6 & 0 & 0 \\
0 & 0 & 0 & 1
\end{bmatrix}, \quad \theta_6 = q_6
$$

---



