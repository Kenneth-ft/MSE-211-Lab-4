%Define variables
m = 0.1270;
l = 0.3365;
r = 0.1778;
I_g = (1.2)*10^(-3);
g = 9.81;
h = 0.1;

%Initial angles in degrees
theta = [13.3315 21.567 36.8095 51.233 64.337];

%Initial conditions
vi = 0;

for i = 0:4
    thetai = theta(1);
    for ti = 0:0.1:8
    %For theta1
    %Determine dx1, dv1
    dtheta1 = h*vi;
    dv1 = h*f(thetai);

    %Determine dx2, dv2
    dtheta2 = h*(vi + 0.5*dv1);
    theta_i2 = thetai + 0.5*dtheta1;
    dv2 = h*f(theta_i2);

    % %Determine dx3, and dv3
    dtheta3 = h*(vi + 0.5*dv2);
    theta_i3 = thetai + 0.5*dtheta2;
    dv3 = h*f(theta_i3);

    % %Determine dx4, and dv4
    dtheta4 = h*(vi + dv3);
    theta_i4 = thetai + dtheta3;
    dv4 = h*f(theta_i4);
    
    % %Determine xi+1 and vi+1
    thetai_1 = thetai + (1/6)*(dtheta1 + 2*dtheta2 + 2*dtheta3 + dtheta4);
    vi_1 = vi + (1/6)*(dv1 + 2*dv2 + 2*dv3 + dv4);
    
    %Reassgining variables
    thetai = thetai_1;
    vi = vi_1;
    end
    %Display values of final theta and v
    vi
    thetai
end
