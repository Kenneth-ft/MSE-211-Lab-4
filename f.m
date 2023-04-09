function [y] = f(theta)
    %Define variables
        m = 0.1270;
        l = 0.3365;
        r = 0.1778;
        I_g = 1.2*10^(-3);
        g = 9.81;
    %Evaluate function for every of theta
    y = -((m*g*r)/(I_g + m*(r^2)))*sind(theta);
end