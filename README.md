We are solving the second-order ordinary differential equation for a simple harmonic oscillator:

$$\ddot y+y=0$$

using the forward Euler method and the semi-implicit Euler method (symplectic Euler method).

Forward Euler method applied to a conservative system like a simple harmonic oscillator will not show convergence because it is not a symplectic method.
Fixing this is done via the semi-implicit Euler method which is a canonical transformation (e.g. a symplectomorphism).

The symplectic condition:

$${\dot {\eta }}=J\nabla _{\eta }H$$

The semi-implicit Euler method is a canonical transformation, i.e. it obeys the invariance of the Poisson brackets and is governed by the Poisson bracket differential equation:

$$\dot\eta=\lbrace\eta,H\rbrace=𝓛_{X_H} η$$

where $\eta=\eta(q,p)$, $H$ is the Hamiltonian, $\lbrace,\rbrace$ being the Poisson brackets and $𝓛_{X_H}$ being the Lie derivative of the function $\eta$ along the Hamiltonian vector field $X_H$.

Forward Euler method can still be applied to non-conservative systems because there the change of energy is physical. 

\usepackage{amsmath}
\usepackage{geometry}
\geometry{margin=1in}

\begin{document}

\section*{Euler Methods for \(\dot{x} = v, \; \dot{v} = -x\)}

\begin{center}
\begin{tabular}{|c|c|}
\hline
\textbf{Explicit Euler} & \textbf{Semi-Implicit Euler} \\
\hline
\(
\begin{aligned}
x_{i+1} &= x_i + h v_i \\
v_{i+1} &= v_i - h x_i
\end{aligned}
\)
&
\(
\begin{aligned}
v_{i+1} &= v_i - h x_i \\
x_{i+1} &= x_i + h v_{i+1}
\end{aligned}
\)
\\
\hline
\end{tabular}
\end{center}


