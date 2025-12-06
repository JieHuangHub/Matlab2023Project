% Simscape(TM) Multibody(TM) version: 23.2

% This is a model data file derived from a Simscape Multibody Import XML file using the smimport function.
% The data in this file sets the block parameter values in an imported Simscape Multibody model.
% For more information on this file, see the smimport function help page in the Simscape Multibody documentation.
% You can modify numerical values, but avoid any other changes to this file.
% Do not add code to this file. Do not edit the physical units shown in comments.

%%%VariableName:smiData


%============= RigidTransform =============%

%Initialize the RigidTransform structure array by filling in null values.
smiData.RigidTransform(5).translation = [0.0 0.0 0.0];
smiData.RigidTransform(5).angle = 0.0;
smiData.RigidTransform(5).axis = [0.0 0.0 0.0];
smiData.RigidTransform(5).ID = "";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(1).translation = [0 100 5.000000000000032];  % mm
smiData.RigidTransform(1).angle = 3.1415926535897931;  % rad
smiData.RigidTransform(1).axis = [1 0 0];
smiData.RigidTransform(1).ID = "B[Link_0-1:-:Arm_0-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(2).translation = [-85.000000000000014 4.2632564145606011e-14 -17.500000000000146];  % mm
smiData.RigidTransform(2).angle = 1.541621727718525e-15;  % rad
smiData.RigidTransform(2).axis = [-0.55268125793544687 -0.83339272082667726 3.5503589805081823e-16];
smiData.RigidTransform(2).ID = "F[Link_0-1:-:Arm_0-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(3).translation = [84.999999999999972 0 -2.5000000000000022];  % mm
smiData.RigidTransform(3).angle = 0;  % rad
smiData.RigidTransform(3).axis = [0 0 0];
smiData.RigidTransform(3).ID = "B[Arm_0-1:-:Arm_1-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(4).translation = [-84.999999999999687 -1.4921397450962104e-13 -17.500000000000711];  % mm
smiData.RigidTransform(4).angle = 3.8668009667223297e-15;  % rad
smiData.RigidTransform(4).axis = [0.36882768065428734 0.92949779019811507 6.6281708133097383e-16];
smiData.RigidTransform(4).ID = "F[Arm_0-1:-:Arm_1-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(5).translation = [-67.993310100622779 0 162.48309070107436];  % mm
smiData.RigidTransform(5).angle = 2.6937204929781093;  % rad
smiData.RigidTransform(5).axis = [-0 -1 -0];
smiData.RigidTransform(5).ID = "RootGround[Link_0-1]";


%============= Solid =============%
%Center of Mass (CoM) %Moments of Inertia (MoI) %Product of Inertia (PoI)

%Initialize the Solid structure array by filling in null values.
smiData.Solid(3).mass = 0.0;
smiData.Solid(3).CoM = [0.0 0.0 0.0];
smiData.Solid(3).MoI = [0.0 0.0 0.0];
smiData.Solid(3).PoI = [0.0 0.0 0.0];
smiData.Solid(3).color = [0.0 0.0 0.0];
smiData.Solid(3).opacity = 0.0;
smiData.Solid(3).ID = "";

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(1).mass = 0.70845925562475853;  % kg
smiData.Solid(1).CoM = [-16.942753363894617 -3.1938398752386741 0.39220664291212359];  % mm
smiData.Solid(1).MoI = [85.746563433368692 2404.3381499571392 2443.9131983906204];  % kg*mm^2
smiData.Solid(1).PoI = [-0.88745323184524516 18.910680754491818 24.076137537577416];  % kg*mm^2
smiData.Solid(1).color = [0.20000000000000001 0.20000000000000001 0.20000000000000001];
smiData.Solid(1).opacity = 1;
smiData.Solid(1).ID = "Arm_1*:*默认";

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(2).mass = 0.83711133805956128;  % kg
smiData.Solid(2).CoM = [-11.223227670876691 -3.4279737092661731 0.31480807603883909];  % mm
smiData.Solid(2).MoI = [118.27851510742155 2682.9175330260214 2763.4952304598673];  % kg*mm^2
smiData.Solid(2).PoI = [-0.90337435547446132 21.879066901327832 26.820431247265361];  % kg*mm^2
smiData.Solid(2).color = [0.20000000000000001 0.20000000000000001 0.20000000000000001];
smiData.Solid(2).opacity = 1;
smiData.Solid(2).ID = "Arm_0*:*默认";

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(3).mass = 2.8928000097297963;  % kg
smiData.Solid(3).CoM = [-0.82358756940462119 15.673836650852039 0.025577585043774251];  % mm
smiData.Solid(3).MoI = [4625.2918261733694 7250.4921282300347 4712.1959862671238];  % kg*mm^2
smiData.Solid(3).PoI = [-6.2386712896131726 -0.060926906089436877 95.499088807626009];  % kg*mm^2
smiData.Solid(3).color = [0.20000000000000001 0.20000000000000001 0.20000000000000001];
smiData.Solid(3).opacity = 1;
smiData.Solid(3).ID = "Link_0*:*默认";


%============= Joint =============%
%X Revolute Primitive (Rx) %Y Revolute Primitive (Ry) %Z Revolute Primitive (Rz)
%X Prismatic Primitive (Px) %Y Prismatic Primitive (Py) %Z Prismatic Primitive (Pz) %Spherical Primitive (S)
%Constant Velocity Primitive (CV) %Lead Screw Primitive (LS)
%Position Target (Pos)

%Initialize the RevoluteJoint structure array by filling in null values.
smiData.RevoluteJoint(2).Rz.Pos = 0.0;
smiData.RevoluteJoint(2).ID = "";

smiData.RevoluteJoint(1).Rz.Pos = -66.229610180703403;  % deg
smiData.RevoluteJoint(1).ID = "[Link_0-1:-:Arm_0-1]";

smiData.RevoluteJoint(2).Rz.Pos = 89.791855291636097;  % deg
smiData.RevoluteJoint(2).ID = "[Arm_0-1:-:Arm_1-1]";

