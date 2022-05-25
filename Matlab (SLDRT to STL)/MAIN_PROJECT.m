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
axis([-200 400 -200 400 -200 400]);  %To be changed to include workspace
view(40,30);                           %To be changed to view from other angle
zoom(0.8)                              %To be changed to zoom in/out 
axis on;


%2. LOAD PART FILES       %Load your manipultor links and external objects
%Load STL files of the chess pieces and the manipulator links

%% 2.2 MANIPULATOR (LOAD THE PARTS IN YOUR MANIPULATOR)
%Load all the individual parts of the manipulator

load CircularBase %This is the post where the prismatic joint slides (aligned with z axis)
setappdata(0,'object_data',object);
object = getappdata(0,'object_data');
obj{1}=object;

load 1stLink %This is the square base of the manipulator
setappdata(0,'object_data',object);
object = getappdata(0,'object_data');
obj{2}=object;

load 2ndLink %This is the square base of the manipulator
setappdata(0,'object_data',object);
object = getappdata(0,'object_data');
obj{3}=object;

load 3rdLink %This is the square base of the manipulator
setappdata(0,'object_data',object);
object = getappdata(0,'object_data');
obj{4}=object;

% load BendTube %This is the square base of the manipulator
% setappdata(0,'object_data',object);
% object = getappdata(0,'object_data');
% obj{5}=object;

load UniversalJoint1 %This is the square base of the manipulator
setappdata(0,'object_data',object);
object = getappdata(0,'object_data');
obj{5}=object;

%load Universal Joint %This is the square base of the manipulator
%setappdata(0,'object_data',object);
%object = getappdata(0,'object_data');
%obj{8}=object;

% load Universal Joint %This is the square base of the manipulator
% setappdata(0,'object_data',object);
% object = getappdata(0,'object_data');
% obj{7}=object;

% obj{5}.V=obj{5}.V+repmat([0 0 -10],[length(obj{5}.V(:,1)) 1]); %Original file had an incorrect offset, here all the vertices of the figure are moved -10

% load GripperAssembly %This is the square base of the manipulator
% setappdata(0,'object_data',object);
% object = getappdata(0,'object_data');
% obj{7}=object;

% Print all the parts of the manipulator. Note all moving parts are
% located at the global reference frame


for i=1:5
    q(i) = patch('faces', obj{i}.F, 'vertices', obj{i}.V);
    set(q(i),'EdgeColor','none');
    drawnow
end

%Set colour to the componenets
set(q(1),'FaceColor', [1,0.242,0.293]);
set(q(2),'FaceColor', [.4,0.6,0.6]);
set(q(3),'FaceColor', [.5,0.6,0.7]);
set(q(4),'FaceColor', [.6,0.7,0.8]);
set(q(5),'FaceColor', [.9,0.9,0.9]);
%set(q(6),'FaceColor', [.4,0.6,0.6]);
%  set(q(7),'FaceColor', [.5,0.6,0.7]);
% set(q(8),'FaceColor', [.6,0.7,0.8]);
%set(q(9),'FaceColor', [.9,0.9,0.9]);

% %Rename of all the vertices. This step is redundant obj{}.V will not longer be used.  
V{1} = obj{1}.V';
V{2} = obj{2}.V';
V{3} = obj{3}.V'; 
V{4} = obj{4}.V';
V{5} = obj{5}.V';
%V{6} = obj{6}.V';
% V{7} = obj{7}.V';
% V{8} = obj{8}.V';
%V{9} = obj{9}.V'; 


%% ANIMATION FUNCTIONS
% Animation (DO NOT CHANGE)
RGB=256;  %Resolution
fm = getframe; [img,map] = rgb2ind(fm.cdata,RGB,'nodither');

%ERASE THE NEXT TWO LINES OR COMMENT THEM
%disp('Note that all the chess pieces are placed in their correct position. Initially all of them were located at the global reference frame. All the links of the manipulator are located at the global reference frame, they will be translated using kinematics')
%pause


%% %3. PATH GENERATION (MODIFY)
% 3.1 Single Pose (Individual Project Part II, comment it in Part III)
% P_ee=[400
%       400
%       150]

% Note your manipulators is a 6-DOF, so it will look like this
%P_ee=[x, y, z, alpha, beta, gamma]; % POPULATE THIS MATRIX


%3.2 Path Generation EXAMPLE (Individual Project Part III - Uncomment it)
% %Spatial Coordinates of the end-effector 
% P_ee=[400 450 450 450 450 450 450
%      400 150 150 150 350 350 350
%      150 150  0	 150 150  0	 150];
%  
% %Spatial Coordinates of the pawn
% P_pawn=[450	450	450	450	450	450	450
%         150	150	150	150	350	350	350
%         0	0	0	150	150	0	0];
    

%% %4. INVERSE KINEMATICS OF THE SCARA MANIPULATOR
  
%4.1 Inverse Kinematics
  %Define the link dimensions (DH parameters)
    L2 = 600; 
    L3 = 600;
    dee=-160; %z axis points upwards, gripper points downwards

    %Inverse Kinematics
    %In this section the inverse kinematics of the manipulator is solved.
    %For this particular example solve for each position of the
    %end-effector the three joint displacements
    
%     theta3=
%     theta2=
%     d1 =
%     joints [d1;  theta2; theta3];
    
    %EXAMPLES FOR PARTS II and III   
    %4.2 Single pose (Part II project) ERASE
%      joints = [ 300.0000 
%                 106.8745   
%                -123.7490]
    
    %4.3 EXAMPLE for EE path generation (Part III project)
    %Store all displacements in a Matrix 
    %joints=[d1;theta2;theta3]; %Matrix stores motion of all three joints
     %ERASE NEXT LINE (this is the solution using the cubic_sheme)
%     joints = [  300.0000  300.0000  150.0000  300.0000  300.0000  150.0000  300.0000
%                 106.8745   85.1512   85.1512   85.1512   99.5109   99.5109   99.5109
%                -123.7490 -133.4325 -133.4325 -133.4325 -123.2718 -123.2718 -123.2718];      
                
%% 5. TRAJECTORY GENERATION

%5.1 Trajectory Generation
% Trajectory Parameters (CHANGE, YOUR DESIGN)
tf=1;  %Duration of each Segment (if segments have different durations enter it in a vector form)
dt=0.5;  %time steps

%5.2 Single Pose (Part II example)
D = [310; 106.8744942979449;-123.748988595889];

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

% Link Parameters of DH table (CHANGE, YOUR DESIGN)
alpha0 = 90*(pi/180);    a0 = 0;         d1 = 0;      theta_1 =75*(pi/180); %(d1 is variable)
alpha1 = 90*(pi/180);    a1 = 93.36;     d2 = 0;      theta_2 =90*(pi*180);    %(theta2 is variable)
alpha2 = 0;              a2 = 68.36;     d3 = 0;      theta_3 =70*(pi/180);    %(theta3 is variable)
alpha3 = 90*(pi/180);    a3 = 58.36;     d4 = 0;      theta_4 =90*(pi/180); %(dee was already defined)
alpha4 = -90*(pi/180);   a4 = 0;         d5 = 37.28;  theta_5 =180*(pi/180); %(d1 is variable)
alpha5 = 90*(pi/180);    a5 = 0;         d6 = 52.41;  theta_6 =35*(pi/180);    %(theta2 is variable)
alpha6 = 0;              a6 = 100.11;    dee = 0;     theta_ee =0*(pi/180);    %(theta3 is variable)



for i=1:length(D(1,:))
     
     %DH parameters (CHANGE BASED ON THE JOINT VARIABLE, HERE IS d1, theta2 and theta3)
            T_01 = tmat(alpha0, a0, d1, theta_1);
            T_12 = tmat(alpha1, a1, d2, theta_2);
            T_23 = tmat(alpha2, a2, d3, theta_3);
            T_34 = tmat(alpha3, a3, d4, theta_4);
            T_45 = tmat(alpha4, a4, d5, theta_5);
            T_56 = tmat(alpha5, a5, d6, theta_6);
            T_6ee = tmat(alpha6, a6, dee, theta_ee);
     
    %Forward Kinematics
            T_02 = T_01*T_12;
            T_03 = T_02*T_23;
            T_04 = T_03*T_34;
            T_05 = T_04*T_45;
            T_06 = T_05*T_56;
            T_0ee = T_06* T_6ee; %Homogeneous Tranforms
    
            %Position and rotation matrices of frame {3} (where link 3 is
            %located) and the end-effector 
            R_01 = T_02(1:3,1:3);  P_01 = T_02(1:3,4);
            R_02 = T_03(1:3,1:3);  P_02 = T_03(1:3,4);
            R_03 = T_04(1:3,1:3);  P_03 = T_04(1:3,4);
            R_04 = T_05(1:3,1:3);  P_04 = T_05(1:3,4);
            R_05 = T_06(1:3,1:3);  P_05 = T_06(1:3,4);
            R_06 = T_0ee(1:3,1:3); P_06 = T_0ee(1:3,4);
            
            R_0ee = T_0ee(1:3,1:3);
            P_0ee = T_0ee(1:3,4);
            
     %Move Links of Manipulator            
            %End-effector moves accordingly with T_03, other links will
            %move based on other T_0i. The following lines find the new
            %orientation and position of the vertices of the end-effector.
            newV{1} = R_01*V{1};
            newV{1} = newV{1} + repmat(P_01,[1 length(newV{1}(1,:))]); 
            newV{2} = R_01*V{2};
            newV{2} = newV{2} + repmat(P_01,[1 length(newV{2}(1,:))]);
            newV{3} = R_02*V{3};
            newV{3} = newV{3} + repmat(P_02,[1 length(newV{3}(1,:))]); 
            newV{4} = R_02*V{4};
            newV{4} = newV{3} + repmat(P_02,[1 length(newV{3}(1,:))]);
            newV{5} = R_03*V{4};
            newV{5} = newV{4} + repmat(P_03,[1 length(newV{3}(1,:))]); 
            newV{6} = R_03*V{5};
            newV{6} = newV{5} + repmat(P_03,[1 length(newV{3}(1,:))]);
            newV{7} = R_04*V{3};
            newV{7} = newV{3} + repmat(P_04,[1 length(newV{3}(1,:))]); 
            newV{8} = R_04*V{3};
            newV{8} = newV{3} + repmat(P_04,[1 length(newV{3}(1,:))]);
%             newV{9} = R_03*V{3};
%             newV{9} = newV{3} + repmat(P_03,[1 length(newV{3}(1,:))]);

            load FinalAssemblyDesignWithReferences %This is the square base of the manipulator
            setappdata(0,'object_data',object);
            object = getappdata(0,'object_data');
            obj{7}=object;
           
            for i=1:1 %use for loop for all the parts of your manipulator
                
                q(i) = patch('faces', obj{7}.F, 'vertices', obj{7}.V);
                set(q(i),'EdgeColor','none');
                drawnow
                %set(q(i),'Vertices',newV{i}(1:3,:)'); %Set the new position in the handle (graphical link)
            end
            set(q(1),'FaceColor', [1,0.242,0.293]);
            
    %UNCOMMENT IN PART III        
        %Move Pawn
%             pawn_m.V=pawn.V+repmat(PP_pawn(:,i)',[length(pawn.V(:,1)) 1]); %Find new position of pawn
%             set(p(13),'Vertices',pawn_m.V(:,1:3)); %Set the new position of the pawn p(13) is the handle for that pawn
%      
     %ANIMATION, saves frames (DO NOT MODIFY)       
     drawnow  %Draw objects to their new poisitons
     im= frame2im(getframe);
     gifim(:,:,:,i) = rgb2ind(im, map);
     mov(i)=getframe(gcf);
end

%ANIMATION, creates animated gif (DO NOT MODIFY)
imwrite(gifim,map,'Chess_Animation.gif','DelayTime',0)%,'LoopCount',inf)


