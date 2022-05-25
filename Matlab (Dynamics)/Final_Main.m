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
axis([-200 300 -200 300 -200 300]);  %To be changed to include workspace
view(127,20);                           %To be changed to view from other angle
zoom(0.8)                              %To be changed to zoom in/out
axis on;


%% 2.2 MANIPULATOR (LOAD THE PARTS IN YOUR MANIPULATOR)
%Load all the individual parts of the manipulator

load Base_Updated %This is the square base of the manipulator
setappdata(0,'object_data',object);
object = getappdata(0,'object_data');
obj{1}=object;

load L1 %This is the square base of the manipulator
setappdata(0,'object_data',object);
object = getappdata(0,'object_data');
obj{2}=object;

load L2 %This is the square base of the manipulator
setappdata(0,'object_data',object);
object = getappdata(0,'object_data');
obj{3}=object;

load L3_updated %This is the square base of the manipulator
setappdata(0,'object_data',object);
object = getappdata(0,'object_data');
obj{4}=object;

load SJ_Part1 %This is the square base of the manipulator
setappdata(0,'object_data',object);
object = getappdata(0,'object_data');
obj{5}=object;

load SJ_Part2_Z6 %This is the square base of the manipulator
setappdata(0,'object_data',object);
object = getappdata(0,'object_data');
obj{6}=object;

load Assembly_Gripper %This is the square base of the manipulator
setappdata(0,'object_data',object);
object = getappdata(0,'object_data');
obj{7}=object;

for i=1:7
    q(i) = patch('faces', obj{i}.F, 'vertices', obj{i}.V);
    set(q(i),'EdgeColor','none');
end

%Set colour to the componenets
set(q(2),'FaceColor', [.4,0.6,0.6]);
set(q(3),'FaceColor', [.6,0.6,0.4]);
set(q(4),'FaceColor', [1,0.242,0.293]);
set(q(5),'FaceColor', [.4,0.6,0.6]);
set(q(6),'FaceColor', [1,0.242,0.293]);
set(q(7),'FaceColor', [1,0.242,0.293]);

%Rename of all the vertices. This step is redundant obj{}.V will not longer be used.
V{1} = obj{1}.V';
V{2} = obj{2}.V';
V{3} = obj{3}.V';
V{4} = obj{4}.V';
V{5} = obj{5}.V';
V{6} = obj{6}.V';
V{7} = obj{7}.V';

%% ANIMATION FUNCTIONS
% Animation (DO NOT CHANGE)
RGB=256;  %Resolution
fm = getframe; [img,map] = rgb2ind(fm.cdata,RGB,'nodither');

%% %3. PATH GENERATION (MODIFY)

x = [158.110745936940,161.212316770022,164.172949824700,166.989250382648,169.658102931850,172.176679405961,174.542446746170,176.753173763482,178.806937281088,180.702127538386,182.437452840091,184.011943435843,185.424954617722,186.676169025090,187.765598148276,188.693583024684,189.460794123050,190.068230413657,190.517217624507,190.809405685545,190.946765365202,190.931584105633,190.766461065153,190.454301378487,189.998309647480,189.401982677020,188.669101472866,187.803722520094,186.810168362756,185.693017507233,184.457093673558,183.107454420749,181.649379173860,180.088356682058,178.430071938597,176.680392594989,174.845354903031,172.931149219680,170.944105110885,168.890676091651,166.777424040563,164.611003327911,162.398144697362,160.145638941808,157.860320414589,155.549050417806,153.218700509756,150.876135773819,148.528198091244,146.181689460322,143.843355404367,141.519868510702,139.217812142580,136.943664365534,134.703782129127,132.504385744452,130.351543696986,128.251157833546,126.208948961186,124.230442894775,122.320956988905,120.485587188499,118.729195631183,117.056398833063,115.471556488050,113.978760909287,112.581827139590,111.284283756082,110.089364392398,109];
y = [-56.0617753886231,-52.4262830491228,-48.7259984337493,-44.9669499486349,-41.1553205017407,-37.2974339744518,-33.3997412679456,-29.4688059589618,-25.5112896007373,-21.5339367059131,-17.5435594491628,-13.5470221281376,-9.55122542206583,-5.56309048798592,-1.58954293512093,2.36250328166657,6.28616200808762,10.1745910348463,14.0210081987090,17.8187073986786,21.5610744858568,25.2416029858100,28.8539096126016,32.3917495341102,35.8490313488128,39.2198317348863,42.4984097332541,45.6792206270832,48.7569293812190,51.7264236061195,54.5828260120291,57.3215063203944,59.9380926008826,62.4284820038035,64.7888508592603,67.0156641159548,69.1056840942475,71.0559785298192,72.8639278860869,74.5272319153984,76.0439154509514,77.4123334133583,78.6311750177949,79.6994671697298,80.6165770393199,81.3822138066805,81.9964295723769,82.4596194296440,82.7725206970118,82.9362113121864,82.9521073902136,82.8219599511174,82.5478508243652,82.1321877396445,81.5776986155554,80.8874250599049,80.0647150973396,79.1132151420656,78.0368612353655,76.8398695695374,75.5267263217386,74.1021768230096,72.5712140894892,70.9390667444860,69.2111863616603,67.3932342610743,65.4910677912901,63.5107261320342,61.4584156531857,59.3404948670035];
z = [169.893253954387,170.635540806981,171.294958027283,171.872295449544,172.368441452922,172.784381394263,173.121195923310,173.380059182565,173.562236894117,173.669084335938,173.702044210243,173.662644406667,173.552495663123,173.373289127343,173.126793822213,172.814854018136,172.439386515770,172.002377842595,171.505881366856,170.952014332567,170.342954819293,169.680938630588,168.968256114999,168.207248923650,167.400306708507,166.549863765466,165.658395626504,164.728415605165,163.762471299739,162.763141058519,161.733030411570,160.674768473493,159.591004321696,158.484403354709,157.357643635105,156.213412221614,155.054401495012,153.883305482393,152.702816184419,151.515619910135,150.324393623945,149.131801309310,147.940490353700,146.753087959341,145.572197584218,144.400395417796,143.240226895846,142.094203258742,140.964798157514,139.854444311898,138.765530224557,137.700396955572,136.661334961233,135.650581001059,134.670315116939,133.722657688128,132.809666565806,131.933334290752,131.095585397623,130.298273809199,129.543180323846,128.832010199334,128.166390836041,127.547869562419,126.977911525509,126.457897689129,125.989122942255,125.572794319948,125.210029339061,124.901854450827];
alp = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
bet = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
gam = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];

P_ee = [x; y; z; alp; bet; gam];

%% %4. INVERSE KINEMATICS OF THE MANIPULATOR

a_2 = 100;
d_1 = 100;
d_3 = 109;
d_4 = 73.5;
d_ee = 182.69;

x = [158.110745936940,161.212316770022,164.172949824700,166.989250382648,169.658102931850,172.176679405961,174.542446746170,176.753173763482,178.806937281088,180.702127538386,182.437452840091,184.011943435843,185.424954617722,186.676169025090,187.765598148276,188.693583024684,189.460794123050,190.068230413657,190.517217624507,190.809405685545,190.946765365202,190.931584105633,190.766461065153,190.454301378487,189.998309647480,189.401982677020,188.669101472866,187.803722520094,186.810168362756,185.693017507233,184.457093673558,183.107454420749,181.649379173860,180.088356682058,178.430071938597,176.680392594989,174.845354903031,172.931149219680,170.944105110885,168.890676091651,166.777424040563,164.611003327911,162.398144697362,160.145638941808,157.860320414589,155.549050417806,153.218700509756,150.876135773819,148.528198091244,146.181689460322,143.843355404367,141.519868510702,139.217812142580,136.943664365534,134.703782129127,132.504385744452,130.351543696986,128.251157833546,126.208948961186,124.230442894775,122.320956988905,120.485587188499,118.729195631183,117.056398833063,115.471556488050,113.978760909287,112.581827139590,111.284283756082,110.089364392398,109];
y = [-56.0617753886231,-52.4262830491228,-48.7259984337493,-44.9669499486349,-41.1553205017407,-37.2974339744518,-33.3997412679456,-29.4688059589618,-25.5112896007373,-21.5339367059131,-17.5435594491628,-13.5470221281376,-9.55122542206583,-5.56309048798592,-1.58954293512093,2.36250328166657,6.28616200808762,10.1745910348463,14.0210081987090,17.8187073986786,21.5610744858568,25.2416029858100,28.8539096126016,32.3917495341102,35.8490313488128,39.2198317348863,42.4984097332541,45.6792206270832,48.7569293812190,51.7264236061195,54.5828260120291,57.3215063203944,59.9380926008826,62.4284820038035,64.7888508592603,67.0156641159548,69.1056840942475,71.0559785298192,72.8639278860869,74.5272319153984,76.0439154509514,77.4123334133583,78.6311750177949,79.6994671697298,80.6165770393199,81.3822138066805,81.9964295723769,82.4596194296440,82.7725206970118,82.9362113121864,82.9521073902136,82.8219599511174,82.5478508243652,82.1321877396445,81.5776986155554,80.8874250599049,80.0647150973396,79.1132151420656,78.0368612353655,76.8398695695374,75.5267263217386,74.1021768230096,72.5712140894892,70.9390667444860,69.2111863616603,67.3932342610743,65.4910677912901,63.5107261320342,61.4584156531857,59.3404948670035];
z = [169.893253954387,170.635540806981,171.294958027283,171.872295449544,172.368441452922,172.784381394263,173.121195923310,173.380059182565,173.562236894117,173.669084335938,173.702044210243,173.662644406667,173.552495663123,173.373289127343,173.126793822213,172.814854018136,172.439386515770,172.002377842595,171.505881366856,170.952014332567,170.342954819293,169.680938630588,168.968256114999,168.207248923650,167.400306708507,166.549863765466,165.658395626504,164.728415605165,163.762471299739,162.763141058519,161.733030411570,160.674768473493,159.591004321696,158.484403354709,157.357643635105,156.213412221614,155.054401495012,153.883305482393,152.702816184419,151.515619910135,150.324393623945,149.131801309310,147.940490353700,146.753087959341,145.572197584218,144.400395417796,143.240226895846,142.094203258742,140.964798157514,139.854444311898,138.765530224557,137.700396955572,136.661334961233,135.650581001059,134.670315116939,133.722657688128,132.809666565806,131.933334290752,131.095585397623,130.298273809199,129.543180323846,128.832010199334,128.166390836041,127.547869562419,126.977911525509,126.457897689129,125.989122942255,125.572794319948,125.210029339061,124.901854450827];

alp = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
bet = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
gam = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];

for i=1:length(x)
    
    Px = x(1,i);
    Py = y(1,i);
    Pz = z(1,i);
    
    a = -Py;
    b = Px;
    c = d_3;
    
    theta1= [(atan2(b,a)+atan2(sqrt((a)^2+(b)^2-(c)^2),c)) (atan2(b,a)-atan2(sqrt((a)^2+(b)^2-(c)^2),c))];
    theta_1(:,i) = (180/pi)*theta1';
    R(1,i) = theta_1(2,i);
    
    c1_1 = cos(theta1(1,1)); s1_1 = sin(theta1(1,1));
    c1_2 = cos(theta1(1,2)); s1_2 = sin(theta1(1,2));
    
    s3_1 = (a_2^2+d_4^2-(Pz-d_1)^2-(c1_1*Px+s1_1*Py)^2)/(2*a_2*d_4);
    c3_1 = sqrt(1-s3_1^2);
    
    s3_2 = (a_2^2+d_4^2-(Pz-d_1)^2-(c1_2*Px+s1_2*Py)^2)/(2*a_2*d_4);
    c3_2 = sqrt(1-s3_2^2);
    
    theta3 = [atan2(s3_1,c3_1) atan2(s3_1,-c3_1) atan2(s3_2,c3_2) atan2(s3_2,-c3_2)];
    theta_3(:,i) = (180/pi)*theta3;
    
    if(i <= 23)
        R(3,i) = theta_3(3,i);
    elseif(i >= 24 && i <= 70)
        R(3,i) = theta_3(4,i);
        if(i > 53)
            R(3,i) = theta_3(4,i)-360;
        end
    end
    
    a1 = a_2-d_4*sin(theta3(1,1));
    b1 = d_4*cos(theta3(1,1));
    c1 = cos(theta1(1,1))*Px + sin(theta1(1,1))*Py;
    d = Pz-d_1;
    
    a2 = a_2-d_4*sin(theta3(1,2));
    b2 = d_4*cos(theta3(1,2));
    c2 = cos(theta1(1,1))*Px + sin(theta1(1,1))*Py;
    
    a3 = a_2-d_4*sin(theta3(1,3));
    b3 = d_4*cos(theta3(1,3));
    c3 = cos(theta1(1,1))*Px + sin(theta1(1,1))*Py;
    
    a4 = a_2-d_4*sin(theta3(1,4));
    b4 = d_4*cos(theta3(1,4));
    c4 = cos(theta1(1,1))*Px + sin(theta1(1,1))*Py;
    
    a5 = a_2-d_4*sin(theta3(1,1));
    b5 = d_4*cos(theta3(1,1));
    c5 = cos(theta1(1,2))*Px + sin(theta1(1,2))*Py;
    
    a6 = a_2-d_4*sin(theta3(1,2));
    b6 = d_4*cos(theta3(1,2));
    c6 = cos(theta1(1,2))*Px + sin(theta1(1,2))*Py;
    
    a7 = a_2-d_4*sin(theta3(1,3));
    b7 = d_4*cos(theta3(1,3));
    c7 = cos(theta1(1,2))*Px + sin(theta1(1,2))*Py;
    
    a8 = a_2-d_4*sin(theta3(1,4));
    b8 = d_4*cos(theta3(1,4));
    c8 = cos(theta1(1,2))*Px + sin(theta1(1,2))*Py;
    
    theta2 = [atan2(a1*d-b1*c1,a1*c1+b1*d) atan2(a2*d-b2*c2,a2*c2+b2*d) atan2(a3*d-b3*c3,a3*c3+b3*d) atan2(a4*d-b4*c4,a4*c4+b4*d) atan2(a5*d-b5*c5,a5*c5+b5*d) atan2(a6*d-b6*c6,a6*c6+b6*d) atan2(a7*d-b7*c7,a7*c7+b7*d) atan2(a8*d-b8*c8,a8*c8+b8*d)];
    theta_2(:,i) = (180/pi)*theta2;
    
    if(i <= 23)
        R(2,i) = theta_2(7,i);
    elseif(i >= 24 && i <= 70)
        R(2,i) = theta_2(8,i);
    end
    
    Alpha = alp(1,i);
    Beta = bet(1,i);
    Gamma = gam(1,i);
    
    
    Rxyz = [cosd(Alpha)*cosd(Beta), (cosd(Alpha)*sind(Beta)*sind(Gamma))-(sind(Alpha)*cosd(Gamma)), (cosd(Alpha)*sind(Beta)*cosd(Gamma))+(sind(Alpha)*sind(Gamma))
        sind(Alpha)*cosd(Beta), (sind(Alpha)*sind(Beta)*sind(Gamma))+(cosd(Alpha)*cosd(Gamma)), (sind(Alpha)*sind(Beta)*cosd(Gamma))-(cosd(Alpha)*sind(Gamma))
        -sind(Beta),                                         sind(Beta)*sind(Gamma),                                       cosd(Beta)*cosd(Gamma)];
    
    R_03 = [cosd(R(1,i))*cosd(R(2,i)+R(3,i)) -cosd(R(1,i))*sind(R(3,i)+R(2,i))  sind(R(1,i))
        sind(R(1,i))*cosd(R(2,i)+R(3,i)) -sind(R(1,i))*sind(R(3,i)+R(2,i)) -cosd(R(1,i))
        sind(R(3,i)+R(2,i))               cosd(R(2,i)+R(3,i))           0];
    
    noa = R_03'*Rxyz;
    
    nx = noa(1,1); ny = noa(2,1); nz = noa(3,1); ny = 1;
    ox = noa(1,2); oy = noa(2,2); oz = noa(3,2); oy = 0;
    ax = noa(1,3); ay = noa(2,3); az = noa(3,3); ay = 1;
    
    theta4 = atan2(az, -ax);
    theta_4(:,i) = (180/pi)*theta4;
    R(4,i) = theta_4(1,i);
    
    theta5 = [atan2(sqrt(1-ay^2),ay) atan2(-sqrt(1-ay^2),ay)];
    theta_5(:,i) = (180/pi)*theta5;
    R(5,i) = theta_5(1,i);
    
    theta6 = atan2(-oy, ny);
    theta_6(:,i) = (180/pi)*theta6;
    R(6,i) = theta_6(1,i);
    
end

%% 5. TRAJECTORY GENERATION
tf=1;  %Duration of each Segment (if segments have different durations enter it in a vector form)
dt=0.5;  %time steps
% Trajectory generation of all the joints
n=length(R(1,:));%number of points in the path

stepsize = 0.01; %delta t
% Duration
duration = zeros(1,length(R(1,:))-1);
for k=1:length(R(1,:))-1
    duration(k) = 0.05;
end

[D, Velocity, Acceleration, time] = via_points_match_VA(R, duration, stepsize, 'prescribed', [0,0]);

%% %% %ANIMATION (DO NOT CHANGE)
mov(1:length(D(1,:))) = struct('cdata', [],'colormap', []);
[a,b]=size(img); gifim=zeros(a,b,1,n-1,'uint8');
%

%% 6. FORWARD KINEMATICS / DISPLACEMENT AND ROTATION OF HANDLE OBJECTS
%INPUTS
% Length of links (CHANGE, YOUR DESIGN)
a_2 = 100;
d_1 = 100;
d_3 = 109;
d_4 = 73.5;
d_ee = 182.69;

% Link Parameters of DH table (CHANGE, YOUR DESIGN)
alpha0 = 0;     a0 = 0;      d1 = d_1;      theta_1 = 0;
alpha1 = 90;    a1 = 0;      d2 = 0;        theta_2 = 0;
alpha2 = 0;     a2 = a_2;    d3 = d_3;      theta_3 = 0;
alpha3 = -90;   a3 = 0;      d4 = d_4;      theta_4 = 0;
alpha4 = 90;    a4 = 0;      d5 = 0;        theta_5 = 0;
alpha5 = -90;   a5 = 0;      d6 = 0;        theta_6 = 0;
alpha6 = 0;     a6 = 0;      dee = d_ee;    theta_ee = 0;

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
    % Variables
    j = 1; k = 21; m = 1;
    
    % Tensor Inertias
    zero_I = [15497890.53            0            0
        0           15497890.53         0
        0                  0        15707168.0];
    
    one_I =  [239794.56             .01        -.04
        0.01           240086.28         0
        -.04                 0       8316.28];
    
    two_I = [73952.06            0            0
        0         356419.97         0
        0              0        324817.70];
    
    three_I = [145613.19            0           0
        0           145629.73         0
        0                  0       802.46];
    
    four_I = [21961.74               0         0
        0           21961.74         0
        0                  0        3728.57];
    
    five_I = [64464.32            0            0
        0           41016.72         0
        0               0        64464.38];
    
    six_I = [64464.32            0            0
        0          64464.38         0
        0              0        41016.72];
    
    ee_I = [262729.99           23.24           -1724.67
        23.24           212869.45         262.47
        -1724.67             262.47        53730.44];
    
    I_G = [ one_I two_I three_I four_I five_I six_I ee_I];
    
    % Mass
    mass = [3134.52 72.63 127.74 26.26 11.50 120.47 40.99];
    
    % Z matrix
    Z = [0 0 1]';
    
    % Hoomogenous Transform Position Matrices
    P_0_1 = T_01(1:3,4); P_1_2 = T_12(1:3,4); P_2_3 = T_23(1:3,4);
    P_3_4 = T_34(1:3,4); P_4_5 = T_45(1:3,4); P_5_6 = T_56(1:3,4); P_6_ee = T_6ee(1:3,4);
    Pos = [P_0_1 P_1_2 P_2_3 P_3_4 P_4_5 P_5_6 P_6_ee];
    
    % Position Vector wrt G
    P_1G1 = [0 0 -48.18]'; P_2G2 = [31.61 0 -0.03]'; P_3G3 = [0 0 -60.57]';
    P_4G4 = [0 0 -34.80]'; P_5G5 = [0 3.35 0]'; P_6G6 = [0 0 3.35]'; P_7G7 = [-1.48 0.16 -65.67]';
    Pos_G = [P_1G1 P_2G2 P_3G3 P_4G4 P_5G5 P_6G6 P_7G7];
    
    % Rotation Matrices
    R_0_1 = T_01(1:3,1:3); R_1_2 = T_12(1:3,1:3); R_2_3 = T_23(1:3,1:3);
    R_3_4 = T_34(1:3,1:3); R_4_5 = T_45(1:3,1:3); R_5_6 = T_56(1:3,1:3); R_6_ee = T_6ee(1:3,1:3);
    true_Rot = [R_0_1 R_1_2 R_2_3 R_3_4 R_4_5 R_5_6 R_6_ee];
    
    % Transposed Rotation Matrices
    R_10 = R_0_1.'; R_21 = R_1_2.'; R_32 = R_2_3.';
    R_43 = R_3_4.'; R_54 = R_4_5.'; R_65 = R_5_6.'; R_ee6 = R_6_ee.';
    Rot = [R_10 R_21 R_32 R_43 R_54 R_65 R_ee6];
    
    omega = [0; 0; 0];
    omega_dot = [0; 0; 0];
    v_dot = [0; 0; 9.81];
    f = [0; 0; 0];
    mom = [0; 0; 0];
    
    % Outward Iteration
    for io = 1:6
        angular_v(:,i) = Rot(1:3,j:3*io)*omega+Velocity(io,i)*Z;
        
        precross1 = Rot(1:3,j:3*io)*omega;
        precross2 = Velocity(io,i)*Z;
        angular_a(:,i) = (Rot(1:3,j:3*io)*omega_dot)+cross(precross1,precross2)+(Acceleration(io,i)*Z);
        
        precross3 = cross(omega_dot,Pos(1:3,io));
        precross4 = cross(omega,Pos(1:3,io));
        linear_a(:,i) = Rot(1:3,j:3*io)*(precross3+cross(omega,precross4)+v_dot);
        
        precross5 = cross(angular_a(:,i),Pos_G(1:3,io));
        precross6 = cross(angular_v(:,i),Pos_G(1:3,io));
        linear_a_COM(:,i) = precross5+cross(angular_v(:,i),precross6)+linear_a(:,i);
        
        inertial_F = mass(1,io)*linear_a_COM(:,i);
        matrix(:,io) = inertial_F;
        
        premultiply1 = I_G(1:3,j:3*io)*angular_v(:,i);
        inertial_N = (I_G(1:3,j:3*io)*angular_a(:,i))+cross(angular_v(:,i),premultiply1);
        matrix1(:,io) = inertial_N;
        
        omega = angular_v(:,i);
        omega_dot = angular_a(:,i);
        v_dot = linear_a(:,i);
        j = j+3;
    end
    
    % Inward Iteration
    for m = 6:-1:1
        flink = matrix(:,m)+true_Rot(1:3,(3*m)+1:k)*f;
        matrix3(:,i) = flink;
        
        precross7 = cross(Pos_G(1:3,m),matrix(:,m));
        premultiply2 = true_Rot(1:3,(3*m)+1:k)*f;
        precross8 = cross(Pos(1:3,m+1),premultiply2);
        nlink = matrix1(:,m)+true_Rot(1:3,(3*m)+1:k)*mom+precross7+precross8;

        taw = transpose(nlink)*Z;
        taw_matrix(m,i) = taw;

        f = flink;
        mom = nlink;
        k = k - 3;
    end

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
    
    newV{6} = R_06*V{6};
    newV{6} = newV{6} + repmat(P_06,[1 length(newV{6}(1,:))]);
    
    newV{7} = R_0ee*V{7};
    newV{7} = newV{7} + repmat(P_0ee,[1 length(newV{7}(1,:))]);
    
                for i=1:7 %use for loop for all the parts of your manipulator
    
    %                 q(i) = patch('faces', obj{i}.F, 'vertices', obj{i}.V);
    %                 set(q(i),'EdgeColor','none');
                     set(q(i),'Vertices',newV{i}(1:3,:)');
                     drawnow
    %               set(q(i),'Vertices',newV{i}(1:3,:)'); %Set the new position in the handle (graphical link)
                end
    
    %             for ii=3 %use for loop for all the parts of your manipulator
    %                 set(q(ii),'Vertices',newV{ii}(1:3,:)'); %Set the new position in the handle (graphical link)
    %             end
    
    
    
    %     ANIMATION, saves frames (DO NOT MODIFY)
          drawnow  %Draw objects to their new poisitons
          im= frame2im(getframe);
          gifim(:,:,:,i) = rgb2ind(im, map);
          mov(i)=getframe(gcf);
end

%% Plots
% %ANIMATION, creates animated gif (DO NOT MODIFY)
imwrite(gifim,map,'Chess_Animation.gif','DelayTime',0)%,'LoopCount',inf)

figure(1)
plot(time(1,:),D(1,:),time(1,:),Velocity(1,:),time(1,:),Acceleration(1,:))
title('Theta 1 Displacement, Velocity, and Acceleration')
legend('Displacement Joint 1 ', 'Velocity Joint 1 ', 'Acceleration Joint 1 )')
xlabel ('Time (s)')
ylabel ('Disp.    Vel.     Acc. ')

figure(2)
plot(time(2,:),D(2,:),time(2,:),Velocity(2,:),time(2,:),Acceleration(2,:))
title('Theta 2 Displacement, Velocity, and Acceleration')
legend('Displacement Joint 2 ', 'Velocity Joint 2 ', 'Acceleration Joint 2 ')
xlabel ('Time (s)')
ylabel ('Disp.     Vel.     Acc. ')

figure (3)
plot(time(3,:),D(3,:),time(3,:),Velocity(3,:),time(3,:),Acceleration(3,:))
title('Theta 3 Displacement, Velocity, and Acceleration')
legend('Displacement Joint 3 ', 'Velocity Joint 3 ', 'Acceleration Joint 3 ')
xlabel ('Time (s)')
ylabel ('Disp.     Vel.     Acc. ')

figure (4)
plot(time(4,:),D(4,:),time(4,:),Velocity(4,:),time(4,:),Acceleration(4,:))
title('Theta 4 Displacement, Velocity, and Acceleration')
legend('Displacement Joint 4 ', 'Velocity Joint 4 ', 'Acceleration Joint 4 ')
xlabel ('Time (s)')
ylabel ('Disp   Vel.     Acc. ')

figure (5)
plot(time(5,:),D(5,:),time(5,:),Velocity(5,:),time(5,:),Acceleration(5,:))
title('Theta 5 Displacement, Velocity, and Acceleration')
legend('Displacement Joint 5 ', 'Velocity Joint 5 ', 'Acceleration Joint 5 ')
xlabel ('Time (s)')
ylabel ('Disp.    Vel.     Acc. ')

figure (6)
plot(time(6,:),D(6,:),time(6,:),Velocity(6,:),time(6,:),Acceleration(6,:))
title('Theta 6 Displacement, Velocity, and Acceleration')
legend('Displacement Joint 6 ', 'Velocity Joint 6 ', 'Acceleration Joint 6 ')
xlabel ('Time (s)')
ylabel ('Disp.    Vel.     Acc. ')

figure (7)
for i=1:length(P_ee(1,:))
    px(i) = P_ee(1,i);
    py(i) = P_ee(2,i);
    pz(i) = P_ee(3,i);
end
comet3(px, py, pz)
title('Path Generation')
xlabel ('Position x')
ylabel ('Position y')
zlabel ('Position z')

figure (8)
for i = 1:70
    plot(time, D(1,:))
    hold on
end
title('End Effector Displacement vs Time')

figure (9)
for i = 1:70
    plot(time, Velocity(1,:))
    hold on
end
title('End Effector Velocity vs Time')

figure (10)
for i = 1:70
    plot(time, Acceleration(1,:))
    hold on
end
title('End Effector Acceleration vs Time')

figure (11)
for i = 1:6
    plot(time, taw_matrix(i,:))
    hold on
end
title('Torque vs Time')

figure (12)
for i = 1:3
    plot(time, matrix3(i,:))
    hold on
end
title('Force vs Time')
%%
figure (13)
plot3(taw_matrix(1:3,:),matrix3,[1:1:414])
title('Force vs Tau')