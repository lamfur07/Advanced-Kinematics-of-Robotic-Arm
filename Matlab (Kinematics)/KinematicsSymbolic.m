close all
clear all
clc

% FORWARD KINEMATICS

% Parameters

% 1) Link Lengths (mm)
syms a_1 a_2 a_3
a_0 = 0;
a_4 = 0;
a_5 = 0;
a_6 = 0;

% 2) Link Twists (deg)
alpha_0 = 90;
alpha_1 = 90;
alpha_2 = 0;
alpha_3 = 90;
alpha_4 = -90;
alpha_5 = 90;
alpha_6 = 0;

% 3) Link Offsets (mm)
syms     d_ee
d_1 = 0;
d_2 = 0;
d_3 = 0;
d_4 = 0;
d_5 = 0;
d_6 = 0;

% 4) Joint Angles (deg)
syms c1 c2 c3 c4 c5 c6 s1 s2 s3 s4 s5 s6


% MATRICES

zero_one_T   =   [c1               s1*(-1)          0                  a_0
                  s1*cosd(alpha_0) c1*cosd(alpha_0) sind(alpha_0)*(-1) d_1*sind(alpha_0)*(-1)
                  s1*sind(alpha_0) c1*sind(alpha_0) cosd(alpha_0)      d_1*cosd(alpha_0)
                  0                0                0                  1]
         
one_two_T    =   [c2               s2*(-1)          0                  a_1
                  s2*cosd(alpha_1) c2*cosd(alpha_1) sind(alpha_1)*(-1) d_2*sind(alpha_1)*(-1)
                  s2*sind(alpha_1) c2*sind(alpha_1) cosd(alpha_1)      d_2*cosd(alpha_1)
                  0                0                0                  1] 

two_three_T  =   [c3               s3*(-1)          0                  a_2
                  s3*cosd(alpha_2) c3*cosd(alpha_2) sind(alpha_2)*(-1) d_3*sind(alpha_2)*(-1)
                  s3*sind(alpha_2) c3*sind(alpha_2) cosd(alpha_2)      d_3*cosd(alpha_2)
                  0                0                0                  1]

three_four_T =   [c4               s4*(-1)          0                  a_3
                  s4*cosd(alpha_3) c4*cosd(alpha_3) sind(alpha_3)*(-1) d_4*sind(alpha_3)*(-1)
                  s4*sind(alpha_3) c4*sind(alpha_3) cosd(alpha_3)      d_4*cosd(alpha_3)
                  0                0                0                  1]

four_five_T  =   [c5               s5*(-1)          0                  a_4
                  s5*cosd(alpha_4) c5*cosd(alpha_4) sind(alpha_4)*(-1) d_5*sind(alpha_4)*(-1)
                  s5*sind(alpha_4) c5*sind(alpha_4) cosd(alpha_4)      d_5*cosd(alpha_4)
                  0                0                0                  1]
              
five_six_T   =   [c6               s6*(-1)          0                  a_5
                  s6*cosd(alpha_5) c6*cosd(alpha_5) sind(alpha_5)*(-1) d_6*sind(alpha_5)*(-1)
                  s6*sind(alpha_5) c6*sind(alpha_5) cosd(alpha_5)      d_6*cosd(alpha_5)
                  0                0                0                  1]

six_end_T    =   [1               0          0                  a_6
                  0*cosd(alpha_6) 1*cosd(alpha_6) sind(alpha_6)*(-1) d_ee*sind(alpha_6)*(-1)
                  0*sind(alpha_6) 1*sind(alpha_6) cosd(alpha_6)      d_ee*cosd(alpha_6)
                  0                0                0                  1]


three_six_T = three_four_T*four_five_T*five_six_T;
three_six_R = three_six_T(1:3,1:3)
% zero_four_T     = zero_one_T*one_two_T*two_three_T*three_four_T
% a=zero_one_T.'
% b=a*zero_four_T

% % one_four_T      = one_two_T*two_three_T*three_four_T
% % four_six_T      = four_five_T*five_six_T
%  zero_three_T    = zero_one_T*one_two_T*two_three_T
% three_six_T     = three_four_T*four_five_T*five_six_T
% zero_six_T      = zero_three_T*three_six_T
% three_six_R     = three_six_T(1:3,1:3)
  zero_end_T      = zero_one_T*one_two_T*two_three_T*three_four_T*four_five_T*five_six_T*six_end_T