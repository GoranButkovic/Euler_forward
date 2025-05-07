% 1-Body Problem Numerical Integration using Symplectic Euler Method - Extended Duration
clear; clc; close all;

% Constants
G = 6.67430e-11;  % Gravitational constant (m^3 kg^-1 s^-2)
M = 1.989e30;     % Mass of central body (Sun, kg)
mu = G*M;

% Initial conditions (Earth-like orbit)
r0 = 1.496e11;     % Initial distance (m) ~1 AU
v0 = 2.9783e4;     % Initial tangential velocity (m/s)

% Time parameters
dt = 86400;        % Time step (1 day in seconds)
t_total = 10*365.25*86400; % Total time (10 years)
n_steps = round(t_total/dt);

% Initialize arrays
x = zeros(n_steps, 1);
y = zeros(n_steps, 1);
vx = zeros(n_steps, 1);
vy = zeros(n_steps, 1);
t = zeros(n_steps, 1);

% Initial conditions (starting on x-axis, moving in y-direction)
x(1) = r0;
y(1) = 0;
vx(1) = 0;
vy(1) = v0;

% Explicit Euler integration
for i = 1:n_steps-1
    r = sqrt(x(i)^2 + y(i)^2);
    ax = -mu * x(i) / r^3;
    ay = -mu * y(i) / r^3;
    
    vx(i+1) = vx(i) + ax * dt;
    vy(i+1) = vy(i) + ay * dt;
    
    x(i+1) = x(i) + vx(i+1) * dt;
    y(i+1) = y(i) + vy(i+1) * dt;
    
    t(i+1) = t(i) + dt;
end

% Plot the orbit (full 10 years)
figure;
plot(x, y, 'b-');
hold on;
plot(0, 0, 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'r'); % Central mass
xlabel('x (m)');
ylabel('y (m)');
title('10-Year Orbit using Symplectic Euler Method');
axis equal;
grid on;

% Plot first year vs subsequent years to show divergence
figure;
plot(x(1:366), y(1:366), 'b-', 'LineWidth', 2); % First year
hold on;
plot(x(367:end), y(367:end), 'r-', 'LineWidth', 1); % Subsequent years
plot(0, 0, 'ko', 'MarkerSize', 10, 'MarkerFaceColor', 'r');
legend('First Year', 'Years 2-10', 'Central Mass');
xlabel('x (m)');
ylabel('y (m)');
title('Orbit Comparison: First Year vs Subsequent Years');
axis equal;
grid on;

% Plot energy to check stability
r = sqrt(x.^2 + y.^2);
v = sqrt(vx.^2 + vy.^2);
E = 0.5*v.^2 - mu./r;  % Specific energy (energy per unit mass)

figure;
plot(t/86400/365.25, E);
xlabel('Time (years)');
ylabel('Specific Energy (m^2/s^2)');
title('Energy Evolution Over 10 Years');
grid on;

% Calculate and display orbital parameters
periods = 0:2*pi*sqrt(r0^3/mu):t_total; % Theoretical periods
fprintf('Theoretical orbital period: %.2f days\n', 2*pi*sqrt(r0^3/mu)/86400);
fprintf('Simulation duration: %.1f years\n', t_total/86400/365.25);