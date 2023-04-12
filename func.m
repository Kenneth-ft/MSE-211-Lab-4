% function [y] = f(theta)
% %Define variables
%         m = 0.1270;
%         l = 0.3365;
%         r = 0.1778;
%         I_g = 1.2*10^(-3);
%         g = 9.81;
%     
%     %Evaluate function for every of theta
%     y = -((m*g*r)/(I_g + m*(r.^2)))*sind(theta);
% end

function dydt = my_system(t, y)
        m = 0.1270;
        l = 0.3365;
        r = 0.1778;
        I_g = 1.2*10^(-3);
        g = 9.81;
    % y(1) represents the original function y(t)
    % y(2) represents the first derivative v(t) = y'(t)

    dydt = zeros(2, 1);
    dydt(1) = y(2); % y'(t) = v(t)
    dydt(2)  = -((m*g*r)/(I_g + m*(r.^2)))*sind(y); % v'(t) = f(t, y(t), v(t))
end

function y_next = rk4_step(t, y, h, my_system)
    k1 = h * my_system(t, y);
    k2 = h * my_system(t + h/2, y + k1/2);
    k3 = h * my_system(t + h/2, y + k2/2);
    k4 = h * my_system(t + h, y + k3);
    y_next = y + (k1 + 2*k2 + 2*k3 + k4)/6;
end