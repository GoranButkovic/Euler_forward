This project compares two **numerical methods** for solving a **differential equation** governing a **conservative system**. The goal is to show how one method preserves the **symplectic structure**, while the other one does not. 

In the provided MATLAB and Python files there are codes for solving a second-order ordinary differential equation for a simple harmonic oscillator:

$$\ddot y+y=0$$

using the **forward Euler method** and the **semi-implicit Euler method** (symplectic Euler method).

------------------------------------------------------
The other two MATLAB files show the classical central-force problem (Earth's orbit) solved with Euler forward and symplectic Euler method, governed of course by the following differential equation:

$$\mathbf{F} = -\frac{GMm}{r^2} \hat{\mathbf{r}}$$

substituting Newton's second law $\mathbf{F} = m\mathbf{a}$ 

we obtain the two differential equations governing the system: 

$$\frac{d^2x}{dt^2} = -\frac{GM}{r^3}x, \space \frac{d^2y}{dt^2} = -\frac{GM}{r^3}y$$

where $r = \sqrt{x^2+y^2}$.

------------------------------------------------------
**Forward Euler method** applied to a conservative system like a simple harmonic oscillator will not show convergence because it is not a symplectic method.
Fixing this is done via the **semi-implicit Euler method** which is a **canonical transformation** (i.e. a symplectomorphism).

**The symplectic condition**:

$${\dot {\eta }}=J\nabla _{\eta }H.$$

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

**Proof that the semi-implicit Euler method is symplectic:**

The **Hamilton's equations** are: 

$${\displaystyle {\frac {\mathrm {d} {\boldsymbol {q}}}{\mathrm {d} t}}={\frac {\partial {\mathcal {H}}}{\partial {\boldsymbol {p}}}},\quad {\frac {\mathrm {d} {\boldsymbol {p}}}{\mathrm {d} t}}=-{\frac {\partial {\mathcal {H}}}{\partial {\boldsymbol {q}}}}}$$

Taking the finite difference of each equation we get:

$$
\dot p  = - \frac{\partial H}{\partial q} \approx \frac{p_{n+1} - p_n}{h}
\longrightarrow
p_{n+1} = p_n - h \frac{\partial H}{\partial q}(q_n)
$$

$$
\dot q = \frac{\partial H}{\partial p}(p_{n+1}) \approx \frac{q_{n+1} - q_n}{h}
\longrightarrow
q_{n+1} = q_n + h \frac{\partial H}{\partial p}(p_{n+1})
$$

```math
J = \begin{bmatrix}\frac{\partial q'}{\partial q} & \frac{\partial q'}{\partial p} \\
\frac{\partial p'}{\partial q} & \frac{\partial p'}{\partial p}\end{bmatrix} = \begin{bmatrix}
1 + h H_{pq} - \dfrac{h^2 H_{pp} H_{qq}}{1 + h H_{qp}} & \dfrac{h H_{pp}}{1 + h H_{qp}} \\
-\dfrac{h H_{qq}}{1 + h H_{qp}} & \dfrac{1}{1 + h H_{qp}}
\end{bmatrix}
```

$$det(J) = 1$$

The **semi-implicit Euler method** is a **volume-preserving transformation** or a **measure-preserving map** since its **Jacobian** is equal to unity.
