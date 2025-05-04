%MATLAB ode45

% Define the system of differential equations
omega = 1; % Set the angular frequency (you can change this value)
tspan = [0 100000]; % Time span for the solution
initial_conditions = [0.8; 0]; % Initial conditions: [x(0), v(0)]

% Define the differential equations as a function
ode = @(t, z) [z(2); -omega^2 * z(1)];

% Solve using ode45
[t, z] = ode45(ode, tspan, initial_conditions);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Simplektička Eulerova metoda


h = 0.01;          % Step size
x = 0:h:100000;         % Time vector
N = length(x);     % Number of steps

% Initialize arrays
y = zeros(1,N);    % Solution array
v = zeros(1,N);    % First derivative array

% Initial conditions
y(1) = 0.8;          % y(0) = 1
v(1) = 0;          % y'(0) = 0

% Forward Euler loop
for i = 1:N-1

    v(i+1) = v(i) - h * y(i);              % Update v implicitly (using current y)
    y(i+1) = y(i) + h * v(i+1);            % Update y

end


% Plot prvo ode45 onda simplektički Euler
subplot(2,1,1)
plot(t, z(:,1))
title('ode45')

subplot(2,1,2)
plot(x,y)
title('Symplectic Euler')
