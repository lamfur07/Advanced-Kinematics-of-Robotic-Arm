close all
clear all
clc

%% Parameters Symbolic
% 1) Link Lengths (mm)
    syms a_2
    a_0 = 0;
    a_1 = 0;
    % a_2 = 100;
    a_3 = 0;
    a_4 = 0;
    a_5 = 0;
    a_6 = 0;

    % 2) Link Twists (deg)
    alpha_0 = 0;
    alpha_1 = 90;
    alpha_2 = 0;
    alpha_3 = -90;
    alpha_4 = 90;
    alpha_5 = -90;
    alpha_6 = 0;

    % 3) Link Offsets (mm)
    syms   d_1 d_3 d_4 d_ee
    % d_1 = 100;
    d_2 = 0;
    % d_3 = 109;
    % d_4 = 73.5;
    d_5 = 0;
    d_6 = 0;
    % d_ee = 191.33;

    % 4) Joint Angles (deg)
    syms c1 c2 c3 c4 c5 c6 s1 s2 s3 s4 s5 s6

%% Matrices

    T_01 = [c1               s1*(-1)          0                  a_0
            s1*cosd(alpha_0) c1*cosd(alpha_0) sind(alpha_0)*(-1) d_1*sind(alpha_0)*(-1)
            s1*sind(alpha_0) c1*sind(alpha_0) cosd(alpha_0)           d_1*cosd(alpha_0)
                           0                0                0                  1];
         
    T_12 = [c2               s2*(-1)          0                  a_1
            s2*cosd(alpha_1) c2*cosd(alpha_1) sind(alpha_1)*(-1) d_2*sind(alpha_1)*(-1)
            s2*sind(alpha_1) c2*sind(alpha_1) cosd(alpha_1)      d_2*cosd(alpha_1)
                           0                0                0                  1];

    T_23 = [c3               s3*(-1)          0                  a_2
            s3*cosd(alpha_2) c3*cosd(alpha_2) sind(alpha_2)*(-1) d_3*sind(alpha_2)*(-1)
            s3*sind(alpha_2) c3*sind(alpha_2) cosd(alpha_2)      d_3*cosd(alpha_2)
                           0                0                0                  1];
              
    T_34 =            [c4               s4*(-1)          0                  a_3
                  s4*cosd(alpha_3) c4*cosd(alpha_3) sind(alpha_3)*(-1) d_4*sind(alpha_3)*(-1)
                  s4*sind(alpha_3) c4*sind(alpha_3) cosd(alpha_3)      d_4*cosd(alpha_3)
                  0                0                0                  1];

    T_45 = [c5               s5*(-1)          0                  a_4
            s5*cosd(alpha_4) c5*cosd(alpha_4) sind(alpha_4)*(-1) d_5*sind(alpha_4)*(-1)
            s5*sind(alpha_4) c5*sind(alpha_4) cosd(alpha_4)      d_5*cosd(alpha_4)
                           0                0                0                  1];
              
    T_56 = [c6               s6*(-1)          0                  a_5
            s6*cosd(alpha_5) c6*cosd(alpha_5) sind(alpha_5)*(-1) d_6*sind(alpha_5)*(-1)
            s6*sind(alpha_5) c6*sind(alpha_5) cosd(alpha_5)      d_6*cosd(alpha_5)
                           0                0                0                  1];

    T_6ee = [1               0          0                  a_6
             0*cosd(alpha_6) 1*cosd(alpha_6) sind(alpha_6)*(-1) d_ee*sind(alpha_6)*(-1)
             0*sind(alpha_6) 1*sind(alpha_6) cosd(alpha_6)      d_ee*cosd(alpha_6)
                           0                0                0                  1];
         
    T_02 =  T_01*T_12;
    T_03 =  T_02*T_23;
    T_04 =  T_03*T_34;
    T_05 =  T_04*T_45;
    T_06 =  T_05*T_56;
    T_0ee = T_06*T_6ee;              
              
    R_13 = T_12(1:3,1:3)*T_23(1:3,1:3);
    R_23 = T_23(1:3,1:3);
    R_33 = eye(3);
    R_34 = T_34(1:3,1:3);
    R_35 = T_34(1:3,1:3)*T_45(1:3,1:3);
    R_36 = R_35*T_56(1:3,1:3);
 
%% Jacobian    
    %Joint Directions
    R_31 = R_13.';
    R_32 = R_23.';
    
    Z_31 = R_31(:,3);
    Z_32 = R_32(:,3);
    Z_33 = R_33(:,3);
    Z_34 = R_34(:,3);
    Z_35 = R_35(:,3);
    Z_36 = R_36(:,3);
    
    %Position Vectors
    T_14 = T_12*T_23*T_34;
    oneP_1W = T_14(1:3,4);
    threeP_1W = R_31*oneP_1W;
    
    T_24 = T_23*T_34;
    twoP_2W = T_24(1:3,4);
    threeP_2W = R_32*twoP_2W;
    
    threeP_3W = R_33*T_34(1:3,4);
    
    %Cross Product
    i_A1 = (Z_31(2,1)*threeP_1W(3,1))-(Z_31(3,1)*threeP_1W(2,1));
    j_A1 = -(Z_31(1,1)*threeP_1W(3,1))+(Z_31(3,1)*threeP_1W(1,1));
    k_A1 = (Z_31(1,1)*threeP_1W(2,1))-(Z_31(2,1)*threeP_1W(1,1));
    A1 = [i_A1; j_A1; k_A1];
    
    i_A2 = (Z_32(2,1)*threeP_2W(3,1))-(Z_32(3,1)*threeP_2W(2,1));
    j_A2 = -(Z_32(1,1)*threeP_2W(3,1))+(Z_32(3,1)*threeP_2W(1,1));
    k_A2 = (Z_32(1,1)*threeP_2W(2,1))-(Z_32(2,1)*threeP_2W(1,1));
    A2 = [i_A2; j_A2; k_A2];
    
    i_A3 = (Z_33(2,1)*threeP_3W(3,1))-(Z_33(3,1)*threeP_3W(2,1));
    j_A3 = -(Z_33(1,1)*threeP_3W(3,1))+(Z_33(3,1)*threeP_3W(1,1));
    k_A3 = (Z_33(1,1)*threeP_3W(2,1))-(Z_33(2,1)*threeP_3W(1,1));
    A3 = [i_A3; j_A3; k_A3];
    
    %A(3x3)
    A = [A1 A2 A3];

    %0(3x3)
    zero = zeros(3);
    
    %B(3x3)
    B = [Z_31 Z_32 Z_33];
    
    %C(3x3)
    C = [Z_34 Z_35 Z_36];
    
    %Jacobian (Ref->W)
    J = [A zero
         B    C];
    J_simp = simplify(J);
     
%% Singularity
    A_det = simplify(det(A))
    C_det = simplify(det(C))
    
    J_det = A_det*C_det;
   
%% Velocity Transformation Matrix

    %R 0->ref
    R_03 = T_01(1:3,1:3)*T_12(1:3,1:3)*T_23(1:3,1:3);
    
    %Position Vector P w->ee
    
    R_06 = T_06(1:3,1:3);
    P_6ee = T_6ee(1:3,4);
    
    zero_P_eew = -R_06*P_6ee;
    
    skew = [0                  -zero_P_eew(3,1)     zero_P_eew(2,1)
            zero_P_eew(3,1)                   0    -zero_P_eew(1,1)
           -zero_P_eew(2,1)     zero_P_eew(1,1)                  0];
       
    Tv = [R_03     skew*R_03
          zero         R_03];
    simp_Tv = simplify(Tv);
                  
%% Forward/Inverse Velocity Equations
    
    %Forward Velocity
    syms q1 q2 q3 q4 q5 q6
    q = [q1 q2 q3 q4 q5 q6];
    zero_vel_ee = simplify(Tv*J*q.');
    
    %Inverse Velocity
    syms v1 v2 v3 v4 v5 v6
    vel = [v1 v2 v3 v4 v5 v6];
    inverse_Tv = inv(Tv);
    
    one = inv(A);
    four = inv(C);
    three = -(four*B*one);
                 
    J_inv = [one     zero
             three   four];
         
    joint_rates = inverse_Tv*J_inv*vel.';
    
%% Force Transformation Matrix

    R_30 = R_03.';
    three_P_eew = R_36*P_6ee;
    skew_sym = [               0     -three_P_eew(3,1)     three_P_eew(2,1)
                 three_P_eew(3,1)                    0    -three_P_eew(1,1)
                -three_P_eew(2,1)      three_P_eew(1,1)                  0];
            
    Fv = [R_30             zero
          skew_sym*R_30    R_30];
    simp_Fv = simplify(Fv);
            
%% Inverse Static Force

    syms f1 f2 f3 m1 m2 m3
    f = [f1 f2 f3 m1 m2 m3];
    J_trans = transpose(J);
    torque = simplify(J_trans*Fv*f.')
    