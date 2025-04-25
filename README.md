We are solving the second-order ordinary differential equation for a simple harmonic oscillator:

$$\ddot y+y=0$$

using the **forward Euler method** and the **semi-implicit Euler method** (symplectic Euler method).

**Forward Euler method** applied to a conservative system like a simple harmonic oscillator will not show convergence because it is not a symplectic method.
Fixing this is done via the **semi-implicit Euler method** which is a **canonical transformation** (i.e. a symplectomorphism).

**The symplectic condition:**

$${\dot {\eta }}=J\nabla _{\eta }H$$

The **semi-implicit Euler method** is a canonical transformation, i.e. it obeys the **invariance of the Poisson brackets** and is governed by the **Poisson bracket differential equation:**

$$\dot\eta=\lbrace\eta,H\rbrace=𝓛_{X_H} η$$

where $\eta=\eta(q,p)$, $H$ is the Hamiltonian, $\lbrace,\rbrace$ being the Poisson brackets and $𝓛_{X_H}$ being the Lie derivative of the function $\eta$ along the Hamiltonian vector field $X_H$.

The **semi-implicit Euler method** preserves the phase space volume as required by **Liouville's theorem**.

**Forward Euler method** can still be applied to non-conservative systems because there the change of energy is physical. 

**Euler methods comparison table:**

<div align="center">

| Method | Update Equations |
|--------|------------------|
| **Explicit Euler** | $y_{i+1} = y_i + h v_i$ <br> $v_{i+1} = v_i - h y_i$ |
| **Semi-Implicit Euler** | $v_{i+1} = v_i - h y_i$ <br> $y_{i+1} = y_i + h v_{i+1}$ |

</div>


$v_{i+1} = v_i - h y_i$ <br> $y_{i+1} = y_i + h v_{i+1}$

$p_{n+1} = p_n - h \frac{\partial H}{\partial q}(q_n) \\
q_{n+1} = q_n + h \frac{\partial H}{\partial p}(p_{n+1})$

$J = 
\begin{bmatrix}
\frac{\partial q'}{\partial q} & \frac{\partial q'}{\partial p} \\
\frac{\partial p'}{\partial q} & \frac{\partial p'}{\partial p}
\end{bmatrix} = 
\begin{bmatrix}
1 + h \frac{\partial^2 H}{\partial q \, \partial p} & h\frac{\partial^2 H}{\partial q \, \partial p}\\
 -h \frac{\partial^2 H}{\partial q \, \partial p} & 1-h\frac{\partial^2 H}{\partial q \, \partial p}
\end{bmatrix}$


$\det(J) = \left(1 + h^2 \frac{\partial^2 H}{\partial q \, \partial p}\right) \left(1-h \frac{\partial^2 H}{\partial q \, \partial p}\right)+h^2\left(\frac{\partial^2 H}{\partial q \, \partial p}\right)^2 = 1 - \left(h\frac{\partial^2 H}{\partial q \, \partial p}\right)^2 + h^2 \left(\frac{\partial^2 H}{\partial q \, \partial p}\right)^2 = 1$


