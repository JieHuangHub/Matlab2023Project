$$
{}^{0}T_{6} = \begin{bmatrix}
n_x & o_x & a_x & p_x \\
n_y & o_y & a_y & p_y \\
n_z & o_z & a_z & p_z \\
0 & 0 & 0 & 1
\end{bmatrix}
$$

---

---

$${
({}^{0}T_{1})^{-1} \cdot {}^{0}T_{6}
=
\begin{bmatrix}
c_1 n_x + s_1 n_y & c_1 o_x + s_1 o_y & c_1 a_x + s_1 a_y & c_1 p_x + s_1 p_y - a_1\\
-n_z & -o_z & -a_z & -p_z + d_1\\
-s_1 n_x + c_1 n_y & -s_1 o_x + c_1 o_y & -s_1 a_x + c_1 a_y & -s_1 p_x + c_1 p_y\\
0 & 0 & 0 & 1
\end{bmatrix}
}$$

$$\boxed{{}^{1}T_{6}=
\begin{bmatrix}
c_{23} c_{4} c_{5} c_{6} - c_{23} s_{4} s_{6} - c_{6} s_{23} s_{5} & -c_{23} c_{4} c_{5} s_{6} - c_{23} c_{6} s_{4} + s_{23} s_{5} s_{6} & -c_{23} c_{4} s_{5} - c_{5} s_{23} & a_2 c_2 + a_3 c_{23} - d_4 s_{23} - d_6(c_{23} c_4 s_5 + c_5 s_{23})\\
c_{4} c_{5} c_{6} s_{23} - s_{23} s_{4} s_{6} + c_{23} c_{6} s_{5} & -c_{4} c_{5} s_{23} s_{6} - c_{6} s_{23} s_{4} - c_{23} s_{5} s_{6} & -c_{4} s_{23} s_{5} + c_{23} c_{5} & a_2 s_2 + a_3 s_{23} + d_4 c_{23} + d_6(-c_4 s_{23} s_5 + c_{23} c_5)\\
-c_{6} s_{4} c_{5} - c_{4} s_{6} & s_{4} c_{5} s_{6} - c_{4} c_{6} & s_{4} s_{5} & d_4 + d_6 s_4 s_5\\
0 & 0 & 0 & 1
\end{bmatrix}}$$

---

---

$${
\mathbf{M}_{15} = 
\begin{bmatrix}
c_1(c_6 n_x - s_6 o_x) + s_1(c_6 n_y - s_6 o_y) & c_1(s_6 n_x + c_6 o_x) + s_1(s_6 n_y + c_6 o_y) & c_1 a_x + s_1 a_y & c_1(p_x - d_6 a_x) + s_1(p_y - d_6 a_y) - a_1\\
-c_6 n_z + s_6 o_z & -s_6 n_z - c_6 o_z & -a_z & -p_z + d_6 a_z + d_1\\
-s_1(c_6 n_x - s_6 o_x) + c_1(c_6 n_y - s_6 o_y) & -s_1(s_6 n_x + c_6 o_x) + c_1(s_6 n_y + c_6 o_y) & -s_1 a_x + c_1 a_y & -s_1(p_x - d_6 a_x) + c_1(p_y - d_6 a_y)\\
0 & 0 & 0 & 1
\end{bmatrix}
}$$

$$\boxed{{}^{1}T_{5}=
\begin{bmatrix}
c_5c_{23}c_4-s_5s_{23} & -c_{23}s_4 & -c_5s_{23}-c_{23}c_4s_5 & a_{2}c_{2}+a_{3}c_{23}-d_4 s_{23}\\
c_5s_{23}c_4+c_{23}s_5 & -s_{23}s_4 & c_5c_{23}-s_{23}c_4s_5 & a_{2}s_{2}+a_{3}s_{23}+d_4 c_{23}\\
-c_5s_4 & -c_4 & s_4s_5 & 0\\
0 & 0 & 0 & 1
\end{bmatrix}}$$

---

---

$$
\mathbf{M}_{14} = 
\begin{bmatrix}
c_1[c_5(c_6 n_x - s_6 o_x) - s_5 a_x] + s_1[c_5(c_6 n_y - s_6 o_y) - s_5 a_y] & c_1[s_5(c_6 n_x - s_6 o_x) + c_5 a_x] + s_1[s_5(c_6 n_y - s_6 o_y) + c_5 a_y] & -c_1(s_6 n_x + c_6 o_x) - s_1(s_6 n_y + c_6 o_y) & c_1(p_x - d_6 a_x) + s_1(p_y - d_6 a_y) - a_1\\
-c_5(c_6 n_z - s_6 o_z) + s_5 a_z & -s_5(c_6 n_z - s_6 o_z) - c_5 a_z & s_6 n_z + c_6 o_z & -p_z + d_6 a_z + d_1\\
-s_1[c_5(c_6 n_x - s_6 o_x) - s_5 a_x] + c_1[c_5(c_6 n_y - s_6 o_y) - s_5 a_y] & -s_1[s_5(c_6 n_x - s_6 o_x) + c_5 a_x] + c_1[s_5(c_6 n_y - s_6 o_y) + c_5 a_y] & s_1(s_6 n_x + c_6 o_x) - c_1(s_6 n_y + c_6 o_y) & -s_1(p_x - d_6 a_x) + c_1(p_y - d_6 a_y)\\
0 & 0 & 0 & 1
\end{bmatrix}
$$

$$\boxed{{}^{1}T_{4}=
\begin{bmatrix}
c_{23}c_4 & -s_{23} & c_{23}s_4 & a_{2}c_{2}+a_{3}c_{23}-d_4 s_{23}\\
s_{23}c_4 & c_{23} & s_{23}s_4 & a_{2}s_{2}+a_{3}s_{23}+d_4 c_{23}\\
-s_4 & 0 & c_4 & 0\\
0 & 0 & 0 & 1
\end{bmatrix}}$$

---

---

$$\boxed{
{}^{2}T_{6}=
\begin{bmatrix}
c_6(c_3 c_4 c_5 - s_3 s_5) - c_3 s_4 s_6 & -s_6(c_3 c_4 c_5 - s_3 s_5) - c_3 c_6 s_4 & -c_3 c_4 s_5 - s_3 c_5 & a_3 c_3 - d_4 s_3 - d_6(c_3 c_4 s_5 + s_3 c_5)\\
c_6(c_3 s_5 + c_4 c_5 s_3) - s_3 s_4 s_6 & -s_6(c_3 s_5 + c_4 c_5 s_3) - c_6 s_3 s_4 & c_3 c_5 - c_4 s_3 s_5 & a_3 s_3 + d_4 c_3 + d_6(c_3 c_5 - c_4 s_3 s_5)\\
-c_4 s_6 - c_5 c_6 s_4 & -c_4 c_6 + c_5 s_4 s_6 & s_4 s_5 & d_6 s_4 s_5\\
0 & 0 & 0 & 1
\end{bmatrix}
}$$
---

---

$$\boxed{
{}^4T_6 = \begin{bmatrix}
c_5 c_6 & -c_5 s_6 & -s_5 & -d_6 s_5 \\
s_5 c_6 & -s_5 s_6 & c_5 & d_6 c_5 \\
-s_6 & -c_6 & 0 & 0 \\
0 & 0 & 0 & 1
\end{bmatrix}}
$$

---

---

$${
\mathbf{M}_{36} =
\begin{bmatrix}
c_1 c_{23} n_x + s_1 c_{23} n_y - s_{23} n_z & c_1 c_{23} o_x + s_1 c_{23} o_y - s_{23} o_z & c_1 c_{23} a_x + s_1 c_{23} a_y - s_{23} a_z & c_1 c_{23}(p_x - c_1 (a_1 + a_2 c_2 + a_3 c_{23})) + s_1 c_{23}(p_y - s_1 (a_1 + a_2 c_2 + a_3 c_{23})) - s_{23}(p_z - d_1 + a_2 s_2 + a_3 s_{23})\\
s_1 n_x - c_1 n_y & s_1 o_x - c_1 o_y & s_1 a_x - c_1 a_y & s_1 p_x - c_1 p_y\\
-c_1 s_{23} n_x - s_1 s_{23} n_y - c_{23} n_z & -c_1 s_{23} o_x - s_1 s_{23} o_y - c_{23} o_z & -c_1 s_{23} a_x - s_1 s_{23} a_y - c_{23} a_z & -c_1 s_{23}(p_x - c_1 (a_1 + a_2 c_2 + a_3 c_{23})) - s_1 s_{23}(p_y - s_1 (a_1 + a_2 c_2 + a_3 c_{23})) - c_{23}(p_z - d_1 + a_2 s_2 + a_3 s_{23})\\
0 & 0 & 0 & 1
\end{bmatrix}
}$$

$$\boxed{
{}^3T_6 = \begin{bmatrix}
c_4 c_5 c_6 - s_4 s_6 & -c_4 c_5 s_6 - s_4 c_6 & -c_4 s_5 & -d_6 c_4 s_5 \\
s_4 c_5 c_6 + c_4 s_6 & -s_4 c_5 s_6 + c_4 c_6 & -s_4 s_5 & -d_6 s_4 s_5 \\
s_5 c_6 & -s_5 s_6 & c_5 & d_6 c_5 + d_4 \\
0 & 0 & 0 & 1
\end{bmatrix}}
$$

---

---

$$\boxed{
{}^2T_5 = \begin{bmatrix}
c_3 c_4 c_5 - s_3 s_5 & -c_3 s_4 & -c_3 c_4 s_5 - s_3 c_5 & a_3 c_3 - d_4 s_3 \\
s_3 c_4 c_5 + c_3 s_5 & -s_3 s_4 & -s_3 c_4 s_5 + c_3 c_5 & a_3 s_3 + d_4 c_3 \\
-s_4 c_5 & -c_4 & s_4 s_5 & 0 \\
0 & 0 & 0 & 1
\end{bmatrix}}
$$

---

---

基于你提供的矩阵表达式和标准 DH 建模的正运动学解耦方法（Pieper 准则，即最后三个轴汇交于一点），我们可以将求解分为两个阶段：**位置问题（求 $\theta_1, \theta_2, \theta_3$）** 和 **姿态问题（求 $\theta_4, \theta_5, \theta_6$）**。

以下是根据矩阵元素对应相等原则推导出的各关节角表达式。

---

### 第一阶段：位置求解 ($\theta_1, \theta_3, \theta_2$)

我们利用手腕中心（Wrist Center）的位置来解耦。由 $\mathbf{M}_{14}$ 和 ${}^{1}T_{4}$ 的最后一列（位移列）对应相等可得。

令手腕中心在基坐标系中的位置为 $P_w$，其坐标 $(p_{wx}, p_{wy}, p_{wz})$ 由末端坐标 $(p_x, p_y, p_z)$ 沿接近向量 $\vec{a}$ 回退 $d_6$ 得到：
$$
\begin{cases}
p_{wx} = p_x - d_6 a_x \\
p_{wy} = p_y - d_6 a_y \\
p_{wz} = p_z - d_6 a_z
\end{cases}
$$

#### 1. 求解 $\theta_1$
观察矩阵 $\mathbf{M}_{14}$ 的第 3 行第 4 列元素，并令其等于 ${}^{1}T_{4}$ 的对应元素（为0）：
$$
-s_1(p_x - d_6 a_x) + c_1(p_y - d_6 a_y) = 0
$$
即：
$$
-s_1 p_{wx} + c_1 p_{wy} = 0 \implies \frac{s_1}{c_1} = \frac{p_{wy}}{p_{wx}}
$$
**表达式：**
$$ \theta_1 = \text{atan2}(p_{wy}, p_{wx}) $$
*(注：通常有两个解 $\theta_1$ 和 $\theta_1 + 180^\circ$，对应手臂在“左手”或“右手”构型)*

#### 2. 求解 $\theta_3$
观察 $\mathbf{M}_{14}$ 与 ${}^{1}T_{4}$ 的第 1 行第 4 列和第 2 行第 4 列。
令：
$$
\begin{cases}
A = c_1 p_{wx} + s_1 p_{wy} - a_1 \\
B = -p_{wz} + d_1 \quad (\text{注意：你的公式中 } M_{14}(2,4) = -p_z + d_6 a_z + d_1 = -p_{wz} + d_1)
\end{cases}
$$
对应 ${}^{1}T_{4}$ 的元素：
$$
\begin{cases}
A = a_2 c_2 + a_3 c_{23} - d_4 s_{23} \\
B = a_2 s_2 + a_3 s_{23} + d_4 c_{23}
\end{cases}
$$
将两式平方相加 ($A^2 + B^2$)，利用和差角公式消去 $\theta_2$，整理后得到关于 $\theta_3$ 的方程：
$$
A^2 + B^2 = a_2^2 + a_3^2 + d_4^2 + 2a_2(a_3 c_3 - d_4 s_3)
$$
令 $K = \frac{A^2 + B^2 - a_2^2 - a_3^2 - d_4^2}{2a_2}$，则有：
$$ a_3 c_3 - d_4 s_3 = K $$
利用三角代换 $\rho = \sqrt{a_3^2 + d_4^2}, \tan \phi = \frac{d_4}{a_3}$，可得 $\rho \cos(\theta_3 + \phi) = K$。

**表达式：**
$$ \theta_3 = \pm \text{acos}\left(\frac{K}{\sqrt{a_3^2 + d_4^2}}\right) - \text{atan2}(d_4, a_3) $$
*(注：$\pm$ 对应肘部向上或向下的解)*

#### 3. 求解 $\theta_2$
展开 $A$ 和 $B$ 的表达式，利用 $c_{23} = c_2 c_3 - s_2 s_3$ 等公式，将其写成关于 $s_2$ 和 $c_2$ 的线性方程组：
$$
\begin{cases}
A = (a_2 + a_3 c_3 - d_4 s_3)c_2 - (a_3 s_3 + d_4 c_3)s_2 \\
B = (a_2 + a_3 c_3 - d_4 s_3)s_2 + (a_3 s_3 + d_4 c_3)c_2
\end{cases}
$$
令 $k_1 = a_2 + a_3 c_3 - d_4 s_3$，$k_2 = a_3 s_3 + d_4 c_3$。方程组变为：
$$
\begin{cases}
A = k_1 c_2 - k_2 s_2 \\
B = k_1 s_2 + k_2 c_2
\end{cases}
$$
解得 $s_2, c_2$：
$$ s_2 = \frac{k_1 B - k_2 A}{k_1^2 + k_2^2}, \quad c_2 = \frac{k_1 A + k_2 B}{k_1^2 + k_2^2} $$

**表达式：**
$$ \theta_2 = \text{atan2}(k_1 B - k_2 A, \,\, k_1 A + k_2 B) $$

---

### 第二阶段：姿态求解 ($\theta_4, \theta_5, \theta_6$)

此时 $\theta_1, \theta_2, \theta_3$ 已知，因此 $s_1, c_1, s_{23}, c_{23}$ 均为已知量。我们利用旋转矩阵的关系求解。

#### 4. 求解 $\theta_5$
观察 ${}^{1}T_{6}$ 和 $({}^{0}T_{1})^{-1} {}^{0}T_{6}$ 的第 3 列（$\vec{a}$ 向量列）。
根据矩阵乘法推导可得：
$$
c_5 = -s_{23}(c_1 a_x + s_1 a_y) - c_{23} a_z
$$
(推导逻辑：将 $\vec{a}$ 向量投影到关节3的 $Z$ 轴方向上)。

**表达式：**
$$ \theta_5 = \text{atan2}(\pm\sqrt{1-c_5^2}, \,\, c_5) $$
*(注：$s_5 > 0$ 对应一组解，$s_5 < 0$ 对应另一组翻转解)*

#### 5. 求解 $\theta_4$
观察 ${}^{1}T_{6}$ 矩阵的 $(3,3)$ 元素和组合元素。
由对应关系可推导出：
$$
\begin{cases}
s_4 s_5 = -s_1 a_x + c_1 a_y \\
c_4 s_5 = -c_{23}(c_1 a_x + s_1 a_y) + s_{23} a_z
\end{cases}
$$
(推导逻辑：将 $\vec{a}$ 向量投影到关节3的 $Y$ 和 $X$ 轴方向)。

**表达式（当 $s_5 \neq 0$）：**
$$ \theta_4 = \text{atan2}(-s_1 a_x + c_1 a_y, \,\, -c_{23}(c_1 a_x + s_1 a_y) + s_{23} a_z) $$

#### 6. 求解 $\theta_6$
利用 ${}^{3}T_{6}$ 中 $(3,1)$ 和 $(3,2)$ 元素的定义：
$$
\begin{cases}
s_5 c_6 = -c_1 s_{23} n_x - s_1 s_{23} n_y - c_{23} n_z \\
-s_5 s_6 = -c_1 s_{23} o_x - s_1 s_{23} o_y - c_{23} o_z
\end{cases}
$$
(推导逻辑：将 $\vec{n}$ 和 $\vec{o}$ 向量投影到关节3的 $Z$ 轴方向)。

整理得：
$$
\begin{cases}
\text{num} = c_1 s_{23} o_x + s_1 s_{23} o_y + c_{23} o_z \quad (\text{对应 } s_6 s_5) \\
\text{den} = -c_1 s_{23} n_x - s_1 s_{23} n_y - c_{23} n_z \quad (\text{对应 } c_6 s_5)
\end{cases}
$$

**表达式（当 $s_5 \neq 0$）：**
$$ \theta_6 = \text{atan2}(c_1 s_{23} o_x + s_1 s_{23} o_y + c_{23} o_z, \,\, -c_1 s_{23} n_x - s_1 s_{23} n_y - c_{23} n_z) $$

---

### 总结：六个关节角的计算顺序

1.  **$\theta_1$**: $\text{atan2}(p_y - d_6 a_y, p_x - d_6 a_x)$
2.  **$\theta_3$**: 由 $A^2+B^2$ 推导出的 $\text{acos}$ 公式。
3.  **$\theta_2$**: $\text{atan2}$ 线性组合公式。
4.  **$\theta_5$**: $\text{acos}$ 公式（基于 $\vec{a}$ 在 $z_3$ 的投影）。
5.  **$\theta_4$**: $\text{atan2}$ 公式（基于 $\vec{a}$ 在 $x_3, y_3$ 的投影）。
6.  **$\theta_6$**: $\text{atan2}$ 公式（基于 $\vec{n}, \vec{o}$ 在 $z_3$ 的投影）。





