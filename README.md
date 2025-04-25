We are solving a second-order ordinary differential equation for a simple harmonic oscillator:

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

**Proof that the semi-implicit Euler method is symplectic:**

The Hamilton's equations are: 

$${\displaystyle {\frac {\mathrm {d} {\boldsymbol {q}}}{\mathrm {d} t}}={\frac {\partial {\mathcal {H}}}{\partial {\boldsymbol {p}}}},\quad {\frac {\mathrm {d} {\boldsymbol {p}}}{\mathrm {d} t}}=-{\frac {\partial {\mathcal {H}}}{\partial {\boldsymbol {q}}}}}$$

Takind the finite difference of the equations we get:

$$\dot p  =- \frac{\partial H}{\partial q} \approx \frac{p_{n+1}-p_n}{h}\longrightarrow p_{n+1} = p_n - h \frac{\partial H}{\partial q}(q_n) <br>

\dot q =  \frac{\partial H}{\partial p}(p_{n+1}) \approx \frac{q_{n+1}-q_n}{h}\longrightarrow q_{n+1} = q_n + h \frac{\partial H}{\partial p}(p_{n+1})$$




