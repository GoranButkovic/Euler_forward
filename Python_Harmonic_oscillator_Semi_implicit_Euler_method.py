#Semi-implicit Euler method for simple harmonic oscillator, doesn't diverge, it oscillates physically like it should.


import numpy as np
import matplotlib.pyplot as plt

# Parameters
h = 0.01          # Step size
t_start, t_end = 0, 100  # Time range
x = np.arange(t_start, t_end, h)  # Time vector
N = len(x)        # Number of steps

# Initialize arrays
y = np.zeros(N)    # Solution array
v = np.zeros(N)    # First derivative array

# Initial conditions
y[0] = 0          # y(0) = 0
v[0] = 1          # y'(0) = 1

# Forward Euler loop
for i in range(N-1):
    v[i+1] = v[i] - h * y[i]         # % Update v implicitly (using current y)
    y[i+1] = y[i] + h * v[i+1]       # Update y
           
# Create figure with subplots
plt.figure(figsize=(10, 8))
plt.clf()  # Clear current figure

# First subplot: Position vs Time
plt.subplot(2, 1, 1)
plt.plot(x, y)
plt.xlabel('Time')
plt.ylabel('Position y(t)')
plt.title('Simple Harmonic Oscillator - Position vs Time')
plt.grid(True)

# Second subplot: Phase Portrait with Hamiltonian Flow
plt.subplot(2, 1, 2)

# Generate a grid for Hamiltonian contours
y_grid = np.linspace(-np.pi, np.pi, 50)
v_grid = np.linspace(-2, 2, 50)
Y, V = np.meshgrid(y_grid, v_grid)
H_grid = 0.5 * V**2 - np.cos(Y)  # Hamiltonian on grid

# Plot contours of H (energy levels)
contour = plt.contour(Y, V, H_grid, 20, linewidths=0.5)
plt.clabel(contour, inline=True, fontsize=8)  # Optional: label contour lines

# Plot the trajectory in phase space
plt.plot(y, v, 'r', linewidth=1.5)
plt.xlabel('Position y')
plt.ylabel('Velocity v')
plt.title('Phase Portrait with Hamiltonian Flow')
plt.grid(True)

plt.tight_layout()  # Adjust spacing between subplots
plt.show()
