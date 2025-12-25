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


