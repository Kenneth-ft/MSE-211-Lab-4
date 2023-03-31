%Define variables
m = 0.1270;
l = 0.3365;
r = 0.1778;
I_g = 1.2*e-3;
g = 9.81;
h = 0.1;

%Initial angles
theta1 = 13.3315;
theta2 = 21.567;
theta3 = 36.8095;
theta4 = 51.233;
theta5 = 64.337;

%Initial velocity
vo = 0;

%Define function
d2x/dt2 = -((m*g*r)/(I_g + m*r^2))*sin(theta);
dx/dt = v;