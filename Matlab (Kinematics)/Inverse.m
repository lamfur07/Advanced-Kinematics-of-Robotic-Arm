clear all
close all
clc
x=180/pi;

    a_1 = 93.36;
    a_2 = 61.82;
    a_3 = 58.36;
    d_6 = 15;
    d_ee = 176.33;

    Px = 0; Py = -120.18; Pz = 93.36;
    
    a = Pz; b = -Px;
    
    theta1= [atan2(a,b) atan2(-a,-b)];
    theta_1 = theta1*x
    
%     c3_1 = ((Py)^2+((cos(theta1(1,1))*Px)+(sin(theta1(1,1))*Pz)-a_1)^2-(a_3)^2-(a_2)^2)/(2*a_3*a_2)
%     c3_2 = ((Py)^2+((cos(theta1(1,2))*Px)+(sin(theta1(1,2))*Pz)-a_1)^2-(a_3)^2-(a_2)^2)/(2*a_3*a_2)

e1 =   ((cos(theta1(1,1))*Px)+(sin(theta1(1,1))*Pz)-a_1)^2;
e2 =   ((cos(theta1(1,2))*Px)+(sin(theta1(1,2))*Pz)-a_1)^2;

f1 =   ((cos(theta1(1,1))*Pz)-(sin(theta1(1,1))*Px))^2;
f2=    ((cos(theta1(1,2))*Pz)-(sin(theta1(1,2))*Px))^2;

g =   (Py^2)-(a_2^2)-(a_3^2);

h1 =  (e1+f1+g)/(2*a_2*a_3);
h2 =  (e2+f2+g)/(2*a_2*a_3);

    theta3= [atan2(sqrt(1-(h1^2)),h1)];
    theta_3 = theta3*x
    
    a1 = a_2 + (a_3*cos(theta1(1,1)));
    a2 = a_2 + (a_3*cos(theta1(1,2)));
    
    b1 = a_3*sin(theta1(1,1));
    b2 = a_3*sin(theta1(1,2));
    
    c1 = (cos(theta1(1,1))*Px)+(sin(theta1(1,1))*Pz)-a_1;
    c2 = (cos(theta1(1,2))*Px)+(sin(theta1(1,2))*Pz)-a_1;
    
    d = -Py;
    
    theta2 = [atan2((a1*d)-(b1*c1),(a1*c1)+(b1*d)) atan2((a2*d)-(b2*c2),(a2*c2)+(b2*d))];
    theta_2 = theta2*x