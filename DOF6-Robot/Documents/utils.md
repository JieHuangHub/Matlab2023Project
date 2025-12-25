# 矩阵 $\mathbf{M}_{10}$ 的显式推导

本文推导乘积矩阵：
$$\mathbf{M}_{10} = ({}^{0}T_{1})^{-1} \cdot {}^{0}T_{6}$$

其中 ${}^{0}T_6$ 用末端位姿 $(n, o, a, p)$ 表示。

---

## 1) 已知矩阵

### $({}^{0}T_1)^{-1}$

由 ${}^{0}T_1$ 可得其逆：
$$\boxed{({}^{0}T_{1})^{-1}=
\begin{bmatrix}
c_1 & s_1 & 0 & -a_1\\
0 & 0 & -1 & d_1\\
-s_1 & c_1 & 0 & 0\\
0 & 0 & 0 & 1
\end{bmatrix}
=
\begin{bmatrix}
R_{10} & t_{10}\\
0 & 1
\end{bmatrix}}$$

其中：
$$R_{10}=
\begin{bmatrix}
c_1 & s_1 & 0\\
0 & 0 & -1\\
-s_1 & c_1 & 0
\end{bmatrix},\quad
t_{10}=
\begin{bmatrix}
-a_1\\ d_1\\ 0
\end{bmatrix}$$

---

### ${}^{0}T_6$（末端位姿表示）

$${}^{0}T_{6}=
\begin{bmatrix}
n_x & o_x & a_x & p_x\\
n_y & o_y & a_y & p_y\\
n_z & o_z & a_z & p_z\\
0 & 0 & 0 & 1
\end{bmatrix}
=
\begin{bmatrix}
R_{06} & p\\
0 & 1
\end{bmatrix},\quad
R_{06}=[n\ \ o\ \ a]$$

---

## 2) 块矩阵相乘

$$({}^{0}T_1)^{-1} \cdot {}^{0}T_6
=
\begin{bmatrix}
R_{10} R_{06} & R_{10} p + t_{10}\\
0 & 1
\end{bmatrix}$$

---

## 3) 展开旋转项 $R_{10} R_{06}$

因为 $R_{06} = [n\ \ o\ \ a]$，所以：
$$R_{10} R_{06} = [R_{10} n\ \ R_{10} o\ \ R_{10} a]$$

对任意向量 $w = [w_x, w_y, w_z]^{\mathsf T}$：
$$R_{10} w =
\begin{bmatrix}
c_1 w_x + s_1 w_y\\
-w_z\\
-s_1 w_x + c_1 w_y
\end{bmatrix}$$

### 三列分别为：

**第 1 列** $R_{10} n$：
$$\begin{bmatrix}
c_1 n_x + s_1 n_y\\
-n_z\\
-s_1 n_x + c_1 n_y
\end{bmatrix}$$

**第 2 列** $R_{10} o$：
$$\begin{bmatrix}
c_1 o_x + s_1 o_y\\
-o_z\\
-s_1 o_x + c_1 o_y
\end{bmatrix}$$

**第 3 列** $R_{10} a$：
$$\begin{bmatrix}
c_1 a_x + s_1 a_y\\
-a_z\\
-s_1 a_x + c_1 a_y
\end{bmatrix}$$

### 旋转矩阵显式结果：

$$R_{10} R_{06} =
\begin{bmatrix}
c_1 n_x + s_1 n_y & c_1 o_x + s_1 o_y & c_1 a_x + s_1 a_y\\
-n_z & -o_z & -a_z\\
-s_1 n_x + c_1 n_y & -s_1 o_x + c_1 o_y & -s_1 a_x + c_1 a_y
\end{bmatrix}$$

---

## 4) 展开平移项 $R_{10} p + t_{10}$

$$R_{10} p =
\begin{bmatrix}
c_1 p_x + s_1 p_y\\
-p_z\\
-s_1 p_x + c_1 p_y
\end{bmatrix}$$

加上 $t_{10} = [-a_1,\ d_1,\ 0]^{\mathsf T}$：

$$R_{10} p + t_{10} =
\begin{bmatrix}
c_1 p_x + s_1 p_y - a_1\\
-p_z + d_1\\
-s_1 p_x + c_1 p_y
\end{bmatrix}$$

---

## 5) 完整的 $\mathbf{M}_{10}$ 矩阵

$$\boxed{
\mathbf{M}_{10} = ({}^{0}T_{1})^{-1} \cdot {}^{0}T_{6} =
\begin{bmatrix}
m_{11} & m_{12} & m_{13} & m_{14}\\
m_{21} & m_{22} & m_{23} & m_{24}\\
m_{31} & m_{32} & m_{33} & m_{34}\\
0 & 0 & 0 & 1
\end{bmatrix}
}$$

其中各元素为：

### 第一行

$$\begin{aligned}
m_{11} &= c_1 n_x + s_1 n_y\\
m_{12} &= c_1 o_x + s_1 o_y\\
m_{13} &= c_1 a_x + s_1 a_y\\
m_{14} &= c_1 p_x + s_1 p_y - a_1
\end{aligned}$$

### 第二行

$$\begin{aligned}
m_{21} &= -n_z\\
m_{22} &= -o_z\\
m_{23} &= -a_z\\
m_{24} &= -p_z + d_1
\end{aligned}$$

### 第三行

$$\begin{aligned}
m_{31} &= -s_1 n_x + c_1 n_y\\
m_{32} &= -s_1 o_x + c_1 o_y\\
m_{33} &= -s_1 a_x + c_1 a_y\\
m_{34} &= -s_1 p_x + c_1 p_y
\end{aligned}$$

---

## 6) 完整矩阵展开形式

$$\boxed{
({}^{0}T_{1})^{-1} \cdot {}^{0}T_{6}
=
\begin{bmatrix}
c_1 n_x + s_1 n_y & c_1 o_x + s_1 o_y & c_1 a_x + s_1 a_y & c_1 p_x + s_1 p_y - a_1\\
-n_z & -o_z & -a_z & -p_z + d_1\\
-s_1 n_x + c_1 n_y & -s_1 o_x + c_1 o_y & -s_1 a_x + c_1 a_y & -s_1 p_x + c_1 p_y\\
0 & 0 & 0 & 1
\end{bmatrix}
}$$

---

## 7) 关键等式（用于逆运动学）

由于：
$${}^{0}T_6 = {}^{0}T_1 \cdot {}^{1}T_2 \cdot {}^{2}T_3 \cdot {}^{3}T_4 \cdot {}^{4}T_5 \cdot {}^{5}T_6$$

因此：
$$\mathbf{M}_{10} = {}^{1}T_2 \cdot {}^{2}T_3 \cdot {}^{3}T_4 \cdot {}^{4}T_5 \cdot {}^{5}T_6 = {}^{1}T_6$$

**逐元素对应，即可建立求解 $\theta_2, \theta_3, \theta_4, \theta_5, \theta_6$ 的方程组。**

### 常用对应元素（选取最干净的项）

| 位置 | $\mathbf{M}_{10}$ 元素 | 对应 ${}^{1}T_6$ 元素 | 用途 |
|: ----:|:----------------------:|:---------------------:|:-----|
| $(2,4)$ | $-p_z + d_1$ | $a_2 s_2 + a_3 s_{23} + d_4 c_{23} + \cdots$ | 求 $\theta_2, \theta_3$ |
| $(3,4)$ | $-s_1 p_x + c_1 p_y$ | $0$ (若无偏置) | 验证/约束 |
| $(2,3)$ | $-a_z$ | $-c_{23} c_4 s_5 - c_5 s_{23}$ | 求 $\theta_5$ |

---

## 8) MATLAB 验证代码

```matlab
%% M10 矩阵符号计算验证
syms c1 s1 real
syms nx ny nz ox oy oz ax ay az px py pz real
syms a1 d1 real

% M10 矩阵各元素
m11 = c1*nx + s1*ny;
m12 = c1*ox + s1*oy;
m13 = c1*ax + s1*ay;
m14 = c1*px + s1*py - a1;

m21 = -nz;
m22 = -oz;
m23 = -az;
m24 = -pz + d1;

m31 = -s1*nx + c1*ny;
m32 = -s1*ox + c1*oy;
m33 = -s1*ax + c1*ay;
m34 = -s1*px + c1*py;

% 完整 M10 矩阵
M10 = [m11, m12, m13, m14;
       m21, m22, m23, m24;
       m31, m32, m33, m34;
         0,   0,   0,   1];

disp('M10 = ');
disp(M10);

%% 验证：通过矩阵乘法直接计算
T01_inv = [c1,  s1,  0, -a1;
            0,   0, -1,  d1;
          -s1,  c1,  0,   0;
            0,   0,  0,   1];

T06 = [nx, ox, ax, px;
       ny, oy, ay, py;
       nz, oz, az, pz;
        0,  0,  0,  1];

M10_verify = T01_inv * T06;

disp('M10 (verified) = ');
disp(simplify(M10_verify));

% 检验差值（应为零矩阵）
disp('Difference (should be zero):');
disp(simplify(M10 - M10_verify));
```

---

## 9) 结构特点总结

| 特征 | 说明 |
|:----:|:-----|
| 第二行 | 仅含 $n_z, o_z, a_z, p_z$，与 $\theta_1$ 无关 |
| 平移列 | 结构简单，适合建立位置方程 |
| 旋转部分 | 每个元素都是 $c_1, s_1$ 与 $(n, o, a)$ 分量的线性组合 |


# 矩阵 ${}^{2}T_{6}$ 的显式推导

本文推导变换矩阵：
$${}^{2}T_{6} = {}^{2}T_{3} \cdot {}^{3}T_{4} \cdot {}^{4}T_{5} \cdot {}^{5}T_{6} = {}^{2}T_{5} \cdot {}^{5}T_{6}$$

---

## 1) 已知矩阵

### ${}^{2}T_{5}$（前面已推导）

$${}^{2}T_{5}=
\begin{bmatrix}
c_3 c_4 c_5 - s_3 s_5 & -c_3 s_4 & -c_3 c_4 s_5 - s_3 c_5 & a_3 c_3 - d_4 s_3\\
s_3 c_4 c_5 + c_3 s_5 & -s_3 s_4 & -s_3 c_4 s_5 + c_3 c_5 & a_3 s_3 + d_4 c_3\\
-s_4 c_5 & -c_4 & s_4 s_5 & 0\\
0 & 0 & 0 & 1
\end{bmatrix}$$

---

### ${}^{5}T_{6}$

$${}^{5}T_{6}=
\begin{bmatrix}
c_6 & -s_6 & 0 & 0\\
s_6 & c_6 & 0 & 0\\
0 & 0 & 1 & d_6\\
0 & 0 & 0 & 1
\end{bmatrix}$$

---

## 2) 矩阵相乘 ${}^{2}T_{6} = {}^{2}T_{5} \cdot {}^{5}T_{6}$

利用齐次变换矩阵乘法规则：
$${}^{2}T_{6} = 
\begin{bmatrix}
R_{25} \cdot R_{56} & R_{25} \cdot p_{56} + p_{25}\\
0 & 1
\end{bmatrix}$$

---

## 3) 完整的 ${}^{2}T_{6}$ 矩阵

$$\boxed{
{}^{2}T_{6}=
\begin{bmatrix}
r_{11} & r_{12} & r_{13} & p_x\\
r_{21} & r_{22} & r_{23} & p_y\\
r_{31} & r_{32} & r_{33} & p_z\\
0 & 0 & 0 & 1
\end{bmatrix}
}$$

其中各元素为：

### 第一行

$$\begin{aligned}
r_{11} &= c_6(c_3 c_4 c_5 - s_3 s_5) - c_3 s_4 s_6\\
r_{12} &= -s_6(c_3 c_4 c_5 - s_3 s_5) - c_3 c_6 s_4\\
r_{13} &= -c_3 c_4 s_5 - s_3 c_5\\
p_x &= a_3 c_3 - d_4 s_3 - d_6(c_3 c_4 s_5 + s_3 c_5)
\end{aligned}$$

### 第二行

$$\begin{aligned}
r_{21} &= c_6(c_3 s_5 + c_4 c_5 s_3) - s_3 s_4 s_6\\
r_{22} &= -s_6(c_3 s_5 + c_4 c_5 s_3) - c_6 s_3 s_4\\
r_{23} &= c_3 c_5 - c_4 s_3 s_5\\
p_y &= a_3 s_3 + d_4 c_3 + d_6(c_3 c_5 - c_4 s_3 s_5)
\end{aligned}$$

### 第三行

$$\begin{aligned}
r_{31} &= -c_4 s_6 - c_5 c_6 s_4\\
r_{32} &= -c_4 c_6 + c_5 s_4 s_6\\
r_{33} &= s_4 s_5\\
p_z &= d_6 s_4 s_5
\end{aligned}$$

---

## 4) 完整矩阵展开形式

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

## 5) 结构特点分析

### 第三行特点（最适合 IK）

| 元素 | 表达式 | 特点 |
|:----:|:------:|:-----|
| $r_{31}$ | $-c_4 s_6 - c_5 c_6 s_4$ | 仅含 $\theta_4, \theta_5, \theta_6$ |
| $r_{32}$ | $-c_4 c_6 + c_5 s_4 s_6$ | 仅含 $\theta_4, \theta_5, \theta_6$ |
| $r_{33}$ | $s_4 s_5$ | **最简洁**，仅含 $\theta_4, \theta_5$ |
| $p_z$ | $d_6 s_4 s_5$ | 与 $r_{33}$ 成比例 |

### 第三列特点（接近向量）

| 元素 | 表达式 | 特点 |
|:----:|:------:|:-----|
| $r_{13}$ | $-c_3 c_4 s_5 - s_3 c_5$ | 含 $\theta_3, \theta_4, \theta_5$ |
| $r_{23}$ | $c_3 c_5 - c_4 s_3 s_5$ | 含 $\theta_3, \theta_4, \theta_5$ |
| $r_{33}$ | $s_4 s_5$ | 不含 $\theta_3$ |

---

## 6) 逆运动学常用等式

### 从 $r_{33} = s_4 s_5$ 求解

若已知目标姿态的 $(3,3)$ 元素为 $a_z'$，则：
$$s_4 s_5 = a_z'$$

### 从第三行求 $\theta_6$

利用 $r_{31}$ 和 $r_{32}$：
$$\frac{r_{31}}{r_{32}} = \frac{-c_4 s_6 - c_5 c_6 s_4}{-c_4 c_6 + c_5 s_4 s_6}$$

### 从平移列求解

$$p_z = d_6 s_4 s_5 = d_6 \cdot r_{33}$$

这提供了一个自检条件。

---

## 7) MATLAB 验证代码

```matlab
%% T26 矩阵符号计算验证
clear; clc;

syms c3 s3 c4 s4 c5 s5 c6 s6 real
syms a3 d4 d6 real

% T25 矩阵（已知）
T25 = [c3*c4*c5 - s3*s5,  -c3*s4,  -c3*c4*s5 - s3*c5,  a3*c3 - d4*s3;
       s3*c4*c5 + c3*s5,  -s3*s4,  -s3*c4*s5 + c3*c5,  a3*s3 + d4*c3;
              -s4*c5,      -c4,              s4*s5,              0;
                   0,        0,                  0,              1];

% T56 矩阵
T56 = [c6, -s6, 0,  0;
       s6,  c6, 0,  0;
        0,   0, 1, d6;
        0,   0, 0,  1];

% 计算 T26
T26_calc = T25 * T56;
T26_simplified = simplify(T26_calc);

disp('T26 (calculated) = ');
disp(T26_simplified);

%% 显式 T26 矩阵（验证用）
r11 = c6*(c3*c4*c5 - s3*s5) - c3*s4*s6;
r12 = -s6*(c3*c4*c5 - s3*s5) - c3*c6*s4;
r13 = -c3*c4*s5 - s3*c5;
px  = a3*c3 - d4*s3 - d6*(c3*c4*s5 + s3*c5);

r21 = c6*(c3*s5 + c4*c5*s3) - s3*s4*s6;
r22 = -s6*(c3*s5 + c4*c5*s3) - c6*s3*s4;
r23 = c3*c5 - c4*s3*s5;
py  = a3*s3 + d4*c3 + d6*(c3*c5 - c4*s3*s5);

r31 = -c4*s6 - c5*c6*s4;
r32 = -c4*c6 + c5*s4*s6;
r33 = s4*s5;
pz  = d6*s4*s5;

T26_explicit = [r11, r12, r13, px;
                r21, r22, r23, py;
                r31, r32, r33, pz;
                  0,   0,   0,  1];

disp('T26 (explicit) = ');
disp(T26_explicit);

% 验证差值（应为零矩阵）
disp('Difference (should be zero):');
disp(simplify(T26_simplified - T26_explicit));

%% 提取关键元素用于 IK
disp('=== Key elements for IK ===');
disp(['r33 = s4*s5 = ', char(r33)]);
disp(['pz = d6*s4*s5 = ', char(pz)]);
disp(['r13 = ', char(r13)]);
disp(['r23 = ', char(r23)]);
```

---

## 8) 与其他变换矩阵的关系

| 关系式 | 用途 |
|:------:|:-----|
| ${}^{2}T_{6} = {}^{2}T_{3} \cdot {}^{3}T_{6}$ | 分解为关节 3 前后 |
| ${}^{2}T_{6} = {}^{2}T_{4} \cdot {}^{4}T_{6}$ | 分解为关节 4 前后 |
| ${}^{2}T_{6} = {}^{2}T_{5} \cdot {}^{5}T_{6}$ | **本文采用**，最简洁 |
| ${}^{1}T_{6} = {}^{1}T_{2} \cdot {}^{2}T_{6}$ | 连接到关节 1 |

---

## 9) 汇总表

| 矩阵元素 | 表达式 | 涉及变量 |
|:--------:|:------:|:--------:|
| $r_{11}$ | $c_6(c_3 c_4 c_5 - s_3 s_5) - c_3 s_4 s_6$ | $\theta_3, \theta_4, \theta_5, \theta_6$ |
| $r_{12}$ | $-s_6(c_3 c_4 c_5 - s_3 s_5) - c_3 c_6 s_4$ | $\theta_3, \theta_4, \theta_5, \theta_6$ |
| $r_{13}$ | $-c_3 c_4 s_5 - s_3 c_5$ | $\theta_3, \theta_4, \theta_5$ |
| $r_{21}$ | $c_6(c_3 s_5 + c_4 c_5 s_3) - s_3 s_4 s_6$ | $\theta_3, \theta_4, \theta_5, \theta_6$ |
| $r_{22}$ | $-s_6(c_3 s_5 + c_4 c_5 s_3) - c_6 s_3 s_4$ | $\theta_3, \theta_4, \theta_5, \theta_6$ |
| $r_{23}$ | $c_3 c_5 - c_4 s_3 s_5$ | $\theta_3, \theta_4, \theta_5$ |
| $r_{31}$ | $-c_4 s_6 - c_5 c_6 s_4$ | $\theta_4, \theta_5, \theta_6$ |
| $r_{32}$ | $-c_4 c_6 + c_5 s_4 s_6$ | $\theta_4, \theta_5, \theta_6$ |
| $r_{33}$ | $s_4 s_5$ | $\theta_4, \theta_5$ |
| $p_x$ | $a_3 c_3 - d_4 s_3 - d_6(c_3 c_4 s_5 + s_3 c_5)$ | $\theta_3, \theta_4, \theta_5$ |
| $p_y$ | $a_3 s_3 + d_4 c_3 + d_6(c_3 c_5 - c_4 s_3 s_5)$ | $\theta_3, \theta_4, \theta_5$ |
| $p_z$ | $d_6 s_4 s_5$ | $\theta_4, \theta_5$ |



# 矩阵 $\mathbf{M}_{36}$ 的显式推导

本文推导乘积矩阵：
$$\mathbf{M}_{36} = ({}^{0}T_{3})^{-1} \cdot {}^{0}T_{6}$$

其中 ${}^{0}T_6$ 用末端位姿 $(n, o, a, p)$ 表示。

---

## 符号约定

$$c_i = \cos\theta_i,\quad s_i = \sin\theta_i$$

$$c_{23} = c_2 c_3 - s_2 s_3 = \cos(\theta_2 + \theta_3)$$

$$s_{23} = c_2 s_3 + c_3 s_2 = \sin(\theta_2 + \theta_3)$$

$$A = a_1 + a_2 c_2 + a_3 c_{23}$$

---

## 1) ${}^{0}T_{3}$ 矩阵

由 ${}^{0}T_1 \cdot {}^{1}T_2 \cdot {}^{2}T_3$ 相乘得到：

$${}^{0}T_{3}=
\begin{bmatrix}
c_1 c_{23} & s_1 & -c_1 s_{23} & c_1 A\\
s_1 c_{23} & -c_1 & -s_1 s_{23} & s_1 A\\
-s_{23} & 0 & -c_{23} & d_1 - a_2 s_2 - a_3 s_{23}\\
0 & 0 & 0 & 1
\end{bmatrix}$$

即：
$${}^{0}T_3 = \begin{bmatrix} R_{03} & p_{03}\\ 0 & 1 \end{bmatrix}$$

其中：
$$R_{03}=
\begin{bmatrix}
c_1 c_{23} & s_1 & -c_1 s_{23}\\
s_1 c_{23} & -c_1 & -s_1 s_{23}\\
-s_{23} & 0 & -c_{23}
\end{bmatrix},\quad
p_{03}=
\begin{bmatrix}
c_1 A\\
s_1 A\\
d_1 - a_2 s_2 - a_3 s_{23}
\end{bmatrix}$$

---

## 2) $({}^{0}T_{3})^{-1}$ 矩阵

齐次变换逆：
$$({}^{0}T_3)^{-1} =
\begin{bmatrix}
R_{03}^{\mathsf T} & -R_{03}^{\mathsf T} p_{03}\\
0 & 1
\end{bmatrix}$$

其中：
$$R_{03}^{\mathsf T}=
\begin{bmatrix}
c_1 c_{23} & s_1 c_{23} & -s_{23}\\
s_1 & -c_1 & 0\\
-c_1 s_{23} & -s_1 s_{23} & -c_{23}
\end{bmatrix}$$

---

## 3) ${}^{0}T_6$（末端位姿表示）

$${}^{0}T_{6}=
\begin{bmatrix}
n_x & o_x & a_x & p_x\\
n_y & o_y & a_y & p_y\\
n_z & o_z & a_z & p_z\\
0 & 0 & 0 & 1
\end{bmatrix}
=
\begin{bmatrix}
R_{06} & p\\
0 & 1
\end{bmatrix},\quad
R_{06}=[n\ \ o\ \ a]$$

---

## 4) 矩阵相乘结果

$$({}^{0}T_{3})^{-1} \cdot {}^{0}T_{6}
=
\begin{bmatrix}
R_{03}^{\mathsf T} R_{06} & R_{03}^{\mathsf T}(p - p_{03})\\
0 & 1
\end{bmatrix}$$

---

## 5) 旋转部分 $R_{36} = R_{03}^{\mathsf T} R_{06}$

对任意向量 $w = [w_x, w_y, w_z]^{\mathsf T}$：
$$R_{03}^{\mathsf T} w =
\begin{bmatrix}
c_1 c_{23} w_x + s_1 c_{23} w_y - s_{23} w_z\\
s_1 w_x - c_1 w_y\\
-c_1 s_{23} w_x - s_1 s_{23} w_y - c_{23} w_z
\end{bmatrix}$$

因此 $R_{36} = [R_{03}^{\mathsf T} n\ \ R_{03}^{\mathsf T} o\ \ R_{03}^{\mathsf T} a]$

---

## 6) 平移部分 $p_{36} = R_{03}^{\mathsf T}(p - p_{03})$

定义差向量：
$$\Delta p = p - p_{03} =
\begin{bmatrix}
p_x - c_1 A\\
p_y - s_1 A\\
p_z - (d_1 - a_2 s_2 - a_3 s_{23})
\end{bmatrix}
=
\begin{bmatrix}
\Delta x\\
\Delta y\\
\Delta z
\end{bmatrix}$$

则：
$$p_{36} = R_{03}^{\mathsf T} \Delta p =
\begin{bmatrix}
c_1 c_{23} \Delta x + s_1 c_{23} \Delta y - s_{23} \Delta z\\
s_1 \Delta x - c_1 \Delta y\\
-c_1 s_{23} \Delta x - s_1 s_{23} \Delta y - c_{23} \Delta z
\end{bmatrix}$$

---

## 7) 完整的 $\mathbf{M}_{36}$ 矩阵

$$\boxed{
\mathbf{M}_{36} = ({}^{0}T_{3})^{-1} \cdot {}^{0}T_{6} =
\begin{bmatrix}
m_{11} & m_{12} & m_{13} & m_{14}\\
m_{21} & m_{22} & m_{23} & m_{24}\\
m_{31} & m_{32} & m_{33} & m_{34}\\
0 & 0 & 0 & 1
\end{bmatrix}
}$$

其中各元素为：

### 第一行

$$\begin{aligned}
m_{11} &= c_1 c_{23} n_x + s_1 c_{23} n_y - s_{23} n_z\\
m_{12} &= c_1 c_{23} o_x + s_1 c_{23} o_y - s_{23} o_z\\
m_{13} &= c_1 c_{23} a_x + s_1 c_{23} a_y - s_{23} a_z\\
m_{14} &= c_1 c_{23}(p_x - c_1 A) + s_1 c_{23}(p_y - s_1 A) - s_{23}(p_z - d_1 + a_2 s_2 + a_3 s_{23})
\end{aligned}$$

### 第二行

$$\begin{aligned}
m_{21} &= s_1 n_x - c_1 n_y\\
m_{22} &= s_1 o_x - c_1 o_y\\
m_{23} &= s_1 a_x - c_1 a_y\\
m_{24} &= s_1(p_x - c_1 A) - c_1(p_y - s_1 A)
\end{aligned}$$

### 第三行

$$\begin{aligned}
m_{31} &= -c_1 s_{23} n_x - s_1 s_{23} n_y - c_{23} n_z\\
m_{32} &= -c_1 s_{23} o_x - s_1 s_{23} o_y - c_{23} o_z\\
m_{33} &= -c_1 s_{23} a_x - s_1 s_{23} a_y - c_{23} a_z\\
m_{34} &= -c_1 s_{23}(p_x - c_1 A) - s_1 s_{23}(p_y - s_1 A) - c_{23}(p_z - d_1 + a_2 s_2 + a_3 s_{23})
\end{aligned}$$

---

## 8) 简化后的平移元素

利用 $A = a_1 + a_2 c_2 + a_3 c_{23}$，平移元素可进一步化简：

### $m_{14}$ 化简

$$\begin{aligned}
m_{14} &= c_1 c_{23} p_x + s_1 c_{23} p_y - s_{23} p_z + s_{23} d_1 - a_2 s_{23} s_2 - a_3 s_{23}^2\\
&\quad - c_{23}(c_1^2 + s_1^2) A\\
&= c_1 c_{23} p_x + s_1 c_{23} p_y - s_{23} p_z + s_{23} d_1 - c_{23} A - a_2 s_{23} s_2 - a_3 s_{23}^2
\end{aligned}$$

### $m_{24}$ 化简

$$\begin{aligned}
m_{24} &= s_1 p_x - c_1 p_y - s_1 c_1 A + c_1 s_1 A\\
&= s_1 p_x - c_1 p_y
\end{aligned}$$

### $m_{34}$ 化简

$$\begin{aligned}
m_{34} &= -c_1 s_{23} p_x - s_1 s_{23} p_y - c_{23} p_z + c_{23} d_1 - a_2 c_{23} s_2 - a_3 c_{23} s_{23}\\
&\quad + s_{23}(c_1^2 + s_1^2) A\\
&= -c_1 s_{23} p_x - s_1 s_{23} p_y - c_{23} p_z + c_{23} d_1 + s_{23} A - a_2 c_{23} s_2 - a_3 c_{23} s_{23}
\end{aligned}$$

---

## 9) 完整矩阵展开形式

$$\boxed{
\mathbf{M}_{36} =
\begin{bmatrix}
c_1 c_{23} n_x + s_1 c_{23} n_y - s_{23} n_z & c_1 c_{23} o_x + s_1 c_{23} o_y - s_{23} o_z & c_1 c_{23} a_x + s_1 c_{23} a_y - s_{23} a_z & m_{14}\\
s_1 n_x - c_1 n_y & s_1 o_x - c_1 o_y & s_1 a_x - c_1 a_y & s_1 p_x - c_1 p_y\\
-c_1 s_{23} n_x - s_1 s_{23} n_y - c_{23} n_z & -c_1 s_{23} o_x - s_1 s_{23} o_y - c_{23} o_z & -c_1 s_{23} a_x - s_1 s_{23} a_y - c_{23} a_z & m_{34}\\
0 & 0 & 0 & 1
\end{bmatrix}
}$$

$$\boxed{
\mathbf{M}_{36} =
\begin{bmatrix}
c_1 c_{23} n_x + s_1 c_{23} n_y - s_{23} n_z & c_1 c_{23} o_x + s_1 c_{23} o_y - s_{23} o_z & c_1 c_{23} a_x + s_1 c_{23} a_y - s_{23} a_z & c_1 c_{23}(p_x - c_1 (a_1 + a_2 c_2 + a_3 c_{23})) + s_1 c_{23}(p_y - s_1 (a_1 + a_2 c_2 + a_3 c_{23})) - s_{23}(p_z - d_1 + a_2 s_2 + a_3 s_{23})\\
s_1 n_x - c_1 n_y & s_1 o_x - c_1 o_y & s_1 a_x - c_1 a_y & s_1 p_x - c_1 p_y\\
-c_1 s_{23} n_x - s_1 s_{23} n_y - c_{23} n_z & -c_1 s_{23} o_x - s_1 s_{23} o_y - c_{23} o_z & -c_1 s_{23} a_x - s_1 s_{23} a_y - c_{23} a_z & -c_1 s_{23}(p_x - c_1 (a_1 + a_2 c_2 + a_3 c_{23})) - s_1 s_{23}(p_y - s_1 (a_1 + a_2 c_2 + a_3 c_{23})) - c_{23}(p_z - d_1 + a_2 s_2 + a_3 s_{23})\\
0 & 0 & 0 & 1
\end{bmatrix}
}$$

其中：
$$\begin{aligned}
m_{14} &= c_1 c_{23}(p_x - c_1 A) + s_1 c_{23}(p_y - s_1 A) - s_{23}(p_z - d_1 + a_2 s_2 + a_3 s_{23})\\
m_{34} &= -c_1 s_{23}(p_x - c_1 A) - s_1 s_{23}(p_y - s_1 A) - c_{23}(p_z - d_1 + a_2 s_2 + a_3 s_{23})
\end{aligned}$$

---

## 10) 关键等式（用于逆运动学）

由于：
$${}^{0}T_6 = {}^{0}T_3 \cdot {}^{3}T_4 \cdot {}^{4}T_5 \cdot {}^{5}T_6$$

因此：
$$\mathbf{M}_{36} = {}^{3}T_4 \cdot {}^{4}T_5 \cdot {}^{5}T_6 = {}^{3}T_6$$

**逐元素对应 ${}^{3}T_6$，即可建立求解 $\theta_4, \theta_5, \theta_6$ 的方程组。**

### 常用对应元素

| 位置 | $\mathbf{M}_{36}$ 元素 | 对应 ${}^{3}T_6$ 元素 | 特点 |
|: ----:|:----------------------:|:---------------------:|:-----|
| $(2,1)$ | $s_1 n_x - c_1 n_y$ | $c_4 s_6 + c_5 c_6 s_4$ | 不含 $\theta_3$ |
| $(2,2)$ | $s_1 o_x - c_1 o_y$ | $c_4 c_6 - c_5 s_4 s_6$ | 不含 $\theta_3$ |
| $(2,3)$ | $s_1 a_x - c_1 a_y$ | $-s_4 s_5$ | **最简洁** |
| $(3,3)$ | $-c_1 s_{23} a_x - s_1 s_{23} a_y - c_{23} a_z$ | $c_5$ | 可求 $\theta_5$ |

---

## 11) MATLAB 验证代码

```matlab
%% M36 矩阵符号计算验证
clear; clc;

syms c1 s1 c2 s2 c3 s3 real
syms nx ny nz ox oy oz ax ay az px py pz real
syms a1 a2 a3 d1 real

% 复合角
c23 = c2*c3 - s2*s3;
s23 = c2*s3 + c3*s2;

% 辅助量
A = a1 + a2*c2 + a3*c23;

% R03 转置
R03_T = [c1*c23,  s1*c23, -s23;
              s1,     -c1,    0;
        -c1*s23, -s1*s23, -c23];

% p03
p03 = [c1*A;
       s1*A;
       d1 - a2*s2 - a3*s23];

% 末端位姿
R06 = [nx, ox, ax;
       ny, oy, ay;
       nz, oz, az];

p = [px; py; pz];

% 计算 M36
R36 = R03_T * R06;
p36 = R03_T * (p - p03);

M36 = [R36, p36;
       0, 0, 0, 1];

M36_simplified = simplify(M36);

disp('M36 = ');
disp(M36_simplified);

%% 显式各元素
disp('=== Rotation elements ===');
disp(['m11 = ', char(simplify(R36(1,1)))]);
disp(['m12 = ', char(simplify(R36(1,2)))]);
disp(['m13 = ', char(simplify(R36(1,3)))]);
disp(['m21 = ', char(simplify(R36(2,1)))]);
disp(['m22 = ', char(simplify(R36(2,2)))]);
disp(['m23 = ', char(simplify(R36(2,3)))]);
disp(['m31 = ', char(simplify(R36(3,1)))]);
disp(['m32 = ', char(simplify(R36(3,2)))]);
disp(['m33 = ', char(simplify(R36(3,3)))]);

disp('=== Translation elements ===');
disp(['m14 = ', char(simplify(p36(1)))]);
disp(['m24 = ', char(simplify(p36(2)))]);
disp(['m34 = ', char(simplify(p36(3)))]);

%% 验证 m24 简化
m24_simplified = simplify(s1*px - c1*py);
disp(['m24 simplified = ', char(m24_simplified)]);
```

---

## 12) 结构特点总结

| 行 | 特点 |
|:--:|:-----|
| 第一行 | 含 $c_{23}$ 因子，与 $\theta_2, \theta_3$ 耦合 |
| **第二行** | **不含 $c_{23}, s_{23}$**，仅含 $c_1, s_1$，最适合求解 $\theta_4, \theta_5, \theta_6$ |
| 第三行 | 含 $s_{23}, c_{23}$ 因子，与 $\theta_2, \theta_3$ 耦合 |



























