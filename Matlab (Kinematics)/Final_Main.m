%Chess Game
%This file only shows the oppening move of a chess game. Only the
%end-effector will move (the other links are fixed)
%
%This file was created as a templete for MSE 429 Advanced Kinematics of
%Robotics Systems at SFU
%
%Created by Flavio Firmani, Fall 2020


%1. INITIALIZATION (NO CHANGES ARE NECESSARY except for section 1.3)
%clear variables and close figures
clc; clear all; close all;

%1.1. Define size of figure and create figure handle (DO NOT MODIFY)
set(0,'Units','pixels');
dim = get(0,'ScreenSize'); 
fig_handle = figure('doublebuffer','on','Position',[0,35,dim(3),dim(4)-100],...
    'Name','3D Object','NumberTitle','off');
set(gcf,'color', [1 1 1]) %Background Colour

%1.2 Define the light in the figure (CHANGE POSITION VECTOR IF FIGURE IS TOO BRIGHT/DARK)
set(fig_handle,'Renderer','zbuffer','doublebuffer','off')
light('color',[.5,.5,.5],'position',[0,1,3],'Style','infinite')
lighting gouraud
daspect([1 1 1]);

%1.3 Axes (TO MODIFY Make sure your axes fit within the region) 
axis([-200 400 -200 300 -400 300]);  %To be changed to include workspace
view(127,20);                           %To be changed to view from other angle
zoom(0.8)                              %To be changed to zoom in/out 
axis on;


%% 2.2 MANIPULATOR (LOAD THE PARTS IN YOUR MANIPULATOR)
%Load all the individual parts of the manipulator

load Base %This is the square base of the manipulator
setappdata(0,'object_data',object);
object = getappdata(0,'object_data');
obj{1}=object;

load Link_1 %This is the square base of the manipulator
setappdata(0,'object_data',object);
object = getappdata(0,'object_data');
obj{2}=object;
% obj{2}.V=obj{2}.V+repmat([0 0 -10],[length(obj{2}.V(:,1)) 1]); %Original file had an incorrect offset, here all the vertices of the figure are moved -10

load Link_2 %This is the square base of the manipulator
setappdata(0,'object_data',object);
object = getappdata(0,'object_data');
obj{3}=object;
% % obj{3}.V=obj{3}.V+repmat([0 0 -10],[length(obj{3}.V(:,1)) 1]); %Original file had an incorrect offset, here all the vertices of the figure are moved -10
% % 
load Link_3 %This is the square base of the manipulator
setappdata(0,'object_data',object);
object = getappdata(0,'object_data');
obj{4}=object;
% obj{4}.V=obj{4}.V+repmat([0 0 -10],[length(obj{4}.V(:,1)) 1]); %Original file had an incorrect offset, here all the vertices of the figure are moved -10
% 
load Link_4 %This is the square base of the manipulator
setappdata(0,'object_data',object);
object = getappdata(0,'object_data');
obj{5}=object;
% % obj{5}.V=obj{5}.V+repmat([0 0 -10],[length(obj{5}.V(:,1)) 1]); %Original file had an incorrect offset, here all the vertices of the figure are moved -10
% 
load Assembly_UniversalJoint %This is the square base of the manipulator
setappdata(0,'object_data',object);
object = getappdata(0,'object_data');
obj{6}=object;
% % obj{6}.V=obj{6}.V+repmat([0 0 -10],[length(obj{6}.V(:,1)) 1]); %Original file had an incorrect offset, here all the vertices of the figure are moved -10
% % 
load Link_6 %This is the square base of the manipulator
setappdata(0,'object_data',object);
object = getappdata(0,'object_data');
obj{7}=object;
% % obj{7}.V=obj{7}.V+repmat([0 0 -10],[length(obj{7}.V(:,1)) 1]); %Original file had an incorrect offset, here all the vertices of the figure are moved -10
% % 
load Assembly_Gripper %This is the square base of the manipulator
setappdata(0,'object_data',object);
object = getappdata(0,'object_data');
obj{8}=object;
% obj{8}.V=obj{8}.V+repmat([0 0 -10],[length(obj{8}.V(:,1)) 1]); %Original file had an incorrect offset, here all the vertices of the figure are moved -10

% Print all the parts of the manipulator. Note all moving parts are
% located at the global reference frame
for i=1:8
    q(i) = patch('faces', obj{i}.F, 'vertices', obj{i}.V);
    set(q(i),'EdgeColor','none');
end

%Set colour to the componenets
set(q(1),'FaceColor', [1,0.242,0.293]);
set(q(2),'FaceColor', [.4,0.6,0.6]);
 set(q(3),'FaceColor', [.6,0.6,0.4]);
 set(q(4),'FaceColor', [1,0.242,0.293]);
 set(q(5),'FaceColor', [.4,0.6,0.6]);
 set(q(6),'FaceColor', [.6,0.6,0.4]);
 set(q(7),'FaceColor', [1,0.242,0.293]);
 set(q(8),'FaceColor', [.4,0.6,0.6]);

%Rename of all the vertices. This step is redundant obj{}.V will not longer be used.  
V{1} = obj{1}.V'; 
V{2} = obj{2}.V'; 
 V{3} = obj{3}.V'; 
 V{4} = obj{4}.V'; 
 V{5} = obj{5}.V'; 
 V{6} = obj{6}.V'; 
 V{7} = obj{7}.V'; 
 V{8} = obj{8}.V'; 

%% ANIMATION FUNCTIONS
% Animation (DO NOT CHANGE)
RGB=256;  %Resolution
fm = getframe; [img,map] = rgb2ind(fm.cdata,RGB,'nodither');

% %ERASE THE NEXT TWO LINES OR COMMENT THEM
% disp('Note that all the chess pieces are placed in their correct position. Initially all of them were located at the global reference frame. All the links of the manipulator are located at the global reference frame, they will be translated using kinematics')
% pause


%% %3. PATH GENERATION (MODIFY)
%3.1 Single Pose (Individual Project Part II, comment it in Part III)
% P_ee=[400
%       400
%       150]

  %Note your manipulators is a 6-DOF, so it will look like this
x_ee  = [263.5     235.5    229.5    215.7   210.2   213.9   215.8   217.2   219.0   220.8   222.7   224.6   226.7   228.4   230.6  232.8   234.6   236.4   238.3   241.2   243.5   245.6   247.2   249.4   252.2   254.9];
y_ee  = [150.2     137.0    133.2    126.6   122.5   120.6   118.1   116.5   114.2   112.1   110.6   109.0   107.6   105.7   104.2  102.1   100.7   99.5    97.2    94.2    92.1    90.6    88.6    86.1    84.9    82.1];
z_ee  = [209.6     243.4    277.8    296.8   299.1   302.5   305.4   308.1   309.7   311.1   313.4   315.4   312.9   310.1   308.5  306.4   304.3   302.8   300.1   297.5   294.1   292.4   289.9   285.1   282.5   280.0];
alpha = [0          0           0       0         0       0       0       0       0       0       0       0       0      0       0   0       0        0      0       0       0        0      0       0       0       0 ];
beta  = [0          0           0       0         0       0       0       0       0       0       0       0       0      0       0   0       0        0      0       0       0        0      0       0       0       0];
gamma = [0          0           0       0         0       0       0       0       0       0       0       0       0      0       0   0       0        0      0       0       0        0      0       0       0       0];


%% %4. INVERSE KINEMATICS OF THE MANIPULATOR
  
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
     
                
%% 5. TRAJECTORY GENERATION

%5.1 Trajectory Generation
% Trajectory Parameters (CHANGE, YOUR DESIGN)
tf=1;  %Duration of each Segment (if segments have different durations enter it in a vector form)
dt=0.5;  %time steps

%UNCOMMENT FOR PART III
% Trajectory generation of all the joints
%  n=length(joints(1,:));%number of points in the path
% for j=1:3; %three joints (SIX JOINTS FOR YOU)
%         dv=[]; %Initialize displacement vector (same with vel and acc)
%         for i=1:(n-1)
%             %WRITE YOUR TRAJECTORY GENERATION SCHEME THAT WILL PRODUCE A
%             %HISTORY OF DISPLACEMENT, VELOCITY, ACCELERATION AND TIME FOR EACH JOINT. 
%             %Enter configuration of joint_i or joints(j,i) and joint_i+1,
%             %tf(duration of the segment) and dt (time step)
%             d=0;% %Enter scheme
%             dv=[dv d]; %Store in vector the displacements of joint j  (same with vel and acc)
%         end
%         D(j,:)=dv;  %Store vectors in a matrix
% end
for i=i:50
    D(1,i) = 90;
    D(2,i) = -30+3*i;
    D(3,i) = 0;
    D(4,i) = -90;
    D(5,i) = 0;
    D(6,i) = 50+3*i;
end
%EXAMPLES FOR PARTS II 
%5.2 Single Pose (Part II example)
% D = [0; 100; 200; 300; 400; 500; 600];

%5.3 Trajectory Generation (Part III example- uncomment)
%D = [310,310,310,310,235,160,160,235,310,310,310,310,310,235,160,160,235,310;106.874494297944,96.0128556998806,85.1512171018169,85.1512171018169,85.1512171018169,85.1512171018169,85.1512171018169,85.1512171018169,85.1512171018169,85.1512171018169,92.3310457446244,99.5108743874319,99.5108743874319,99.5108743874319,99.5108743874319,99.5108743874319,99.5108743874319,99.5108743874319;-123.748988595889,-128.590762576839,-133.432536557790,-133.432536557790,-133.432536557790,-133.432536557790,-133.432536557790,-133.432536557790,-133.432536557790,-133.432536557790,-128.352159015229,-123.271781472667,-123.271781472667,-123.271781472667,-123.271781472667,-123.271781472667,-123.271781472667,-123.271781472667];

%EXAMPLES FOR III Trajectory of the pawn (Cartesian Scheme)
% n=length(P_pawn(1,:)); %number of points in the path
% for j=1:3; %x,y,z (motion along each axis is determine independently)
%         pp_pawn=[]; %Initialize displacement vector
%         for i=1:(n-1)
%           %WRITE YOUR TRAJECTORY GENERATION SCHEME THAT WILL PRODUCE A
%           %HISTORY OF DISP, VEL, ACC. AND TIME FOR EACH COORDINATE
%           %(x,y,z) OF THE PIECE THAT IS MOVING. 
%           %Enter configuration of P_pawn_i and P_pawn_i+1,
%           %tf(duration of the segment) and dt (time step)
%           d_pawn=0;% %Enter scheme
%            pp_pawn=[pp_pawn d_pawn]; %Store in vector the displacements along one axis
%         end
%         PP_pawn(j,:)=pp_pawn; %Store in vector the displacements along all three axes (x,y,z)
% end
%NUMERICAL EXAMPLE (ERASE)
%PP_pawn = [450,450,450,450,450,450,450,450,450,450,450,450,450,450,450,450,450,450;150,150,150,150,150,150,150,150,150,150,250,350,350,350,350,350,350,350;0,0,0,0,0,0,0,75,150,150,150,150,150,75,0,0,0,0];


% %% %ANIMATION (DO NOT CHANGE)
%     mov(1:length(D(1,:))) = struct('cdata', [],'colormap', []);
%     [a,b]=size(img); gifim=zeros(a,b,1,n-1,'uint8');  

    
%% 6. FORWARD KINEMATICS / DISPLACEMENT AND ROTATION OF HANDLE OBJECTS
%INPUTS
% Length of links (CHANGE, YOUR DESIGN)
a_1 = 93.36;
a_2 = 61.82;
a_3 = 58.36;
%  d_4 = 108;
%  d_6 = 15;
d_ee = 176.33;

% Link Parameters of DH table (CHANGE, YOUR DESIGN)
alpha0 = 90;    a0 = 0;      d1 = 0;        theta_1 = 90;   %(d1 is variable)
alpha1 = 90;    a1 = a_1;    d2 = 0;        theta_2 = 90;  %(theta2 is variable)
alpha2 = 0;     a2 = a_2;    d3 = 0;        theta_3 = 0;  %(theta3 is variable)
alpha3 = 90;    a3 = a_3;    d4 = 108;        theta_4 = -90;   %(theta4 is variable)
alpha4 = -90;   a4 = 0;      d5 = 0;      theta_5 = 0; %(theta5 is variable)
alpha5 = 90;    a5 = 0;      d6 = 0;        theta_6 = 90; %(theta6 is variable)
alpha6 = 0;     a6 = 0;      dee = d_ee;    theta_ee = 0;

D = [theta_1; theta_2; theta_3; theta_4; theta_5; theta_6];
  

for i=1:length(D(1,:))
     
     %DH parameters (CHANGE BASED ON THE JOINT VARIABLE, HERE IS d1, theta2 and theta3)
            T_01 = tmat(alpha0, a0, d1, D(1,i));
            T_12 = tmat(alpha1, a1, d2, D(2,i));
            T_23 = tmat(alpha2, a2, d3, D(3,i));
            T_34 = tmat(alpha3, a3, d4, D(4,i));
            T_45 = tmat(alpha4, a4, d5, D(5,i));
            T_56 = tmat(alpha5, a5, d6, D(6,i));
            T_6ee = tmat(alpha6, a6, dee, theta_ee);
     
    %Forward Kinematics
            T_02 =  T_01*T_12;
            T_03 =  T_02*T_23;
            T_04 =  T_03*T_34;
            T_05 =  T_04*T_45;
            T_06 =  T_05*T_56;
            T_0ee = T_06*T_6ee; %Homogeneous Tranforms
    
            %Position and rotation matrices of frame {3} (where link 3 is
            %located) and the end-effector 
            R_01 = T_01(1:3,1:3);  P_01 = T_01(1:3,4);
            R_02 = T_02(1:3,1:3);  P_02 = T_02(1:3,4);
            R_03 = T_03(1:3,1:3);  P_03 = T_03(1:3,4);
            R_04 = T_04(1:3,1:3);  P_04 = T_04(1:3,4);
            R_05 = T_05(1:3,1:3);  P_05 = T_05(1:3,4);
            R_06 = T_06(1:3,1:3);  P_06 = T_06(1:3,4);
            
            R_0ee = T_0ee(1:3,1:3);
            P_0ee = T_0ee(1:3,4);
            
     %Move Links of Manipulator            
            %End-effector moves accordingly with T_03, other links will
            %move based on other T_0i. The following lines find the new
            %orientation and position of the vertices of the end-effector.
            newV{1} = V{1};

            newV{2} = R_01*V{2};
            newV{2} = newV{2} + repmat(P_01,[1 length(newV{2}(1,:))]);
            
            newV{3} = R_02*V{3};
            newV{3} = newV{3} + repmat(P_02,[1 length(newV{3}(1,:))]); 
 
            newV{4} = R_03*V{4};
            newV{4} = newV{4} + repmat(P_03,[1 length(newV{4}(1,:))]);
 
            newV{5} = R_04*V{5};
            newV{5} = newV{5} + repmat(P_04,[1 length(newV{5}(1,:))]); 

            newV{6} = R_05*V{6};
            newV{6} = newV{6} + repmat(P_05,[1 length(newV{6}(1,:))]);

            newV{7} = R_06*V{7};
            newV{7} = newV{7} + repmat(P_06,[1 length(newV{7}(1,:))]); 

             newV{8} = R_0ee*V{8};
             newV{8} = newV{8} + repmat(P_0ee,[1 length(newV{8}(1,:))]);
            
            for i=1:8 %use for loop for all the parts of your manipulator
                
%               q(i) = patch('faces', obj{i}.F, 'vertices', obj{i}.V);
%               set(q(i),'EdgeColor','none');
%               drawnow
                set(q(i),'Vertices',newV{i}(1:3,:)'); %Set the new position in the handle (graphical link)
            end
            
%             for ii=3 %use for loop for all the parts of your manipulator
%                 set(q(ii),'Vertices',newV{ii}(1:3,:)'); %Set the new position in the handle (graphical link)
%             end
            
    %UNCOMMENT IN PART III        
        %Move Pawn
%             pawn_m.V=pawn.V+repmat(PP_pawn(:,i)',[length(pawn.V(:,1)) 1]); %Find new position of pawn
%             set(p(13),'Vertices',pawn_m.V(:,1:3)); %Set the new position of the pawn p(13) is the handle for that pawn
%      
%      ANIMATION, saves frames (DO NOT MODIFY)       
%      drawnow  %Draw objects to their new poisitons
     im= frame2im(getframe);
     gifim(:,:,:,i) = rgb2ind(im, map);
     mov(i)=getframe(gcf);
end

%ANIMATION, creates animated gif (DO NOT MODIFY)
% imwrite(gifim,map,'Chess_Animation.gif','DelayTime',0)%,'LoopCount',inf)


