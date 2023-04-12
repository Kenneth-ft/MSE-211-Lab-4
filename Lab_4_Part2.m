% Define variables
l = 0.3365;
h = 0.1; % Time step
t_end = 8; % End time

% Initial angles in degrees (from data)
theta = [13.3315 21.567 36.8095 51.233 64.337];
theta = theta * (pi / 180); % Convert degrees to radians

% Initialize arrays for storing results
time = 0:h:t_end;
theta_values = zeros(5, length(time));
v_values = zeros(5, length(time));

% Loop through initial angles
for i = 1:5
    vi = 0;
    thetai = theta(i);
    y = [thetai, vi]; % Initial condition for the ODE
    for j = 1:length(time)
        ti = time(j);
        
        % Apply RK4 to ODE
        y = rk4_step(ti, y, h, @my_system);
        
        % Store the results
        theta_values(i, j) = y(1);
        v_values(i, j) = y(2) * l;  % Convert angular velocity to linear velocity
    end
    % Report the maximum values of theta and v for each initial angle
report_max_values(theta_values, v_values,i);
end




% Plot theta and v for each initial angle
figure;
% First subplot for Theta vs. Time
subplot(2, 1, 1);
hold on;
for i = 1:5
    plot(time, theta_values(i, :));
end
% Labels and title for the first subplot
ylabel('Theta (rad)');
xlabel('Time (s)');
title('Theta vs. Time');
legend('13.33°', '21.57°', '36.81°', '51.23°', '64.34°');

% Second subplot for Linear Velocity vs. Time
subplot(2, 1, 2);
hold on;
for i = 1:5
    plot(time, v_values(i, :));
end
% Labels and title for the second subplot
ylabel('v (m/s)');
xlabel('Time (s)');
title('Linear Velocity vs. Time');
legend('13.33°', '21.57°', '36.81°', '51.23°', '64.34°');



% The system of ODEs for the pendulum
function dydt = my_system( y)
    m = 0.1270;
    r = 0.1778;
    I_g = 1.2*10^(-3);
    g = 9.81;

    % y(1) represents the original function y(t)
    % y(2) represents the first derivative v(t) = y'(t)
    dydt = zeros(2, 1);
    dydt(1) = y(2); % y'(t) = v(t)
    dydt(2) = -((m*g*r)/(I_g + m*(r.^2)))*sin(y(1)); % v'(t) = f(t, y(t), v(t))
end

% The RK4 method implementation for solving the ODEs
function y_next = rk4_step(t, y, h, my_system)
    k1 = h * my_system(y);
    k2 = h * my_system(y + k1/2);
    k3 = h * my_system(y + k2/2);
    k4 = h * my_system(y + k3);
    y_next = y + (k1 + 2*k2 + 2*k3 + k4)/6;
end

function [theta_max, v_max] = report_max_values(theta_values, v_values, i)
    l = 0.3365;
    % Find the maximum theta value and its index
    [theta_max_r, theta_index] = max(max(theta_values));
    theta_max = theta_max_r * 180 / pi; % Convert radians to degrees

    % Find the maximum v value and its index
    [v_max_r, v_index] = max(max(v_values));
    v_max = v_max_r * 180 / pi * l; % Convert radians/s to m/s

    % Display the results
    fprintf('index: %d\n', i)
    fprintf('Maximum Theta Value: %.2f degrees\n', theta_max);
    fprintf('Maximum Linear Velocity Value: %.2f m/s\n', v_max);
end
