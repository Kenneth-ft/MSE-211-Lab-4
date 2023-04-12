function theta = theta_analytical(theta0, t)
    g = 9.81;
    l = 0.3365;
    omega = sqrt(g/l);
    theta = theta0 * cos(omega*t);
end

