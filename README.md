Forward Euler method applied to a conservative system like a simple harmonic oscillator will not show convergence because it is not a symplectic method.
Fixing this is done via the Semi-implicit Euler method which is a canonical transformation (e.g. an symplectomorphism).

The symplectic condition:

${\dot {\eta }}=J\nabla _{\eta }H$

The semi-implicit Euler method is a canonical transformation, i.e. it obeys the invariance of the Poisson brackets and is governed by the Poisson bracket differential equation:

$\dot\eta=\(\eta,H\)$

with $H$ being the Hamiltonian and \(,\) being the Poisson brackets.

Forward Euler method can still be applied to non-conservative systems because there the change (loss) of energy is physical. 

