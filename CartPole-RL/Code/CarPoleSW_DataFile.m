% Simscape(TM) Multibody(TM) version: 23.2

% This is a model data file derived from a Simscape Multibody Import XML file using the smimport function.
% The data in this file sets the block parameter values in an imported Simscape Multibody model.
% For more information on this file, see the smimport function help page in the Simscape Multibody documentation.
% You can modify numerical values, but avoid any other changes to this file.
% Do not add code to this file. Do not edit the physical units shown in comments.

%%%VariableName:smiData


%============= RigidTransform =============%

%Initialize the RigidTransform structure array by filling in null values.
smiData.RigidTransform(12).translation = [0.0 0.0 0.0];
smiData.RigidTransform(12).angle = 0.0;
smiData.RigidTransform(12).axis = [0.0 0.0 0.0];
smiData.RigidTransform(12).ID = "";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(1).translation = [0 12.499999999999956 -56.999999999999943];  % mm
smiData.RigidTransform(1).angle = 0;  % rad
smiData.RigidTransform(1).axis = [0 0 0];
smiData.RigidTransform(1).ID = "B[Body-1:-:Bole-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(2).translation = [0 1.1368683772161603e-13 -57];  % mm
smiData.RigidTransform(2).angle = 0;  % rad
smiData.RigidTransform(2).axis = [0 0 0];
smiData.RigidTransform(2).ID = "F[Body-1:-:Bole-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(3).translation = [0 0 4.9999999999998934];  % mm
smiData.RigidTransform(3).angle = 3.1415926535897931;  % rad
smiData.RigidTransform(3).axis = [1 0 0];
smiData.RigidTransform(3).ID = "B[Move-1:-:Body-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(4).translation = [50 12.499999999999886 50];  % mm
smiData.RigidTransform(4).angle = 3.1415926535897931;  % rad
smiData.RigidTransform(4).axis = [1 0 0];
smiData.RigidTransform(4).ID = "F[Move-1:-:Body-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(5).translation = [0 0 4.9999999999998934];  % mm
smiData.RigidTransform(5).angle = 3.1415926535897931;  % rad
smiData.RigidTransform(5).axis = [1 0 0];
smiData.RigidTransform(5).ID = "B[Move-2:-:Body-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(6).translation = [-50.000000000000114 12.499999999999886 -40];  % mm
smiData.RigidTransform(6).angle = 3.1415926535897931;  % rad
smiData.RigidTransform(6).axis = [1 0 0];
smiData.RigidTransform(6).ID = "F[Move-2:-:Body-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(7).translation = [0 0 4.9999999999998934];  % mm
smiData.RigidTransform(7).angle = 3.1415926535897931;  % rad
smiData.RigidTransform(7).axis = [1 0 0];
smiData.RigidTransform(7).ID = "B[Move-3:-:Body-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(8).translation = [50 12.499999999999886 -40];  % mm
smiData.RigidTransform(8).angle = 3.1415926535897931;  % rad
smiData.RigidTransform(8).axis = [1 0 0];
smiData.RigidTransform(8).ID = "F[Move-3:-:Body-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(9).translation = [0 0 4.9999999999998934];  % mm
smiData.RigidTransform(9).angle = 3.1415926535897931;  % rad
smiData.RigidTransform(9).axis = [1 0 0];
smiData.RigidTransform(9).ID = "B[Move-4:-:Body-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(10).translation = [-50.000000000000114 12.499999999999886 50];  % mm
smiData.RigidTransform(10).angle = 3.1415926535897931;  % rad
smiData.RigidTransform(10).axis = [1 0 0];
smiData.RigidTransform(10).ID = "F[Move-4:-:Body-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(11).translation = [684.84332442763889 510.75168862734165 1238.634712141702];  % mm
smiData.RigidTransform(11).angle = 0;  % rad
smiData.RigidTransform(11).axis = [0 0 0];
smiData.RigidTransform(11).ID = "RootGround[Plan-1]";

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(12).translation = [734.84332442763889 588.25168862734165 1319.947462777563];  % mm
smiData.RigidTransform(12).angle = 0;  % rad
smiData.RigidTransform(12).axis = [0 0 0];
smiData.RigidTransform(12).ID = "SixDofRigidTransform[Move-1]";


%============= Solid =============%
%Center of Mass (CoM) %Moments of Inertia (MoI) %Product of Inertia (PoI)

%Initialize the Solid structure array by filling in null values.
smiData.Solid(4).mass = 0.0;
smiData.Solid(4).CoM = [0.0 0.0 0.0];
smiData.Solid(4).MoI = [0.0 0.0 0.0];
smiData.Solid(4).PoI = [0.0 0.0 0.0];
smiData.Solid(4).color = [0.0 0.0 0.0];
smiData.Solid(4).opacity = 0.0;
smiData.Solid(4).ID = "";

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(1).mass = 0.073658607683156754;  % kg
smiData.Solid(1).CoM = [0 0 0];  % mm
smiData.Solid(1).MoI = [8.7348659326351612 8.7348659326351612 16.242088403884377];  % kg*mm^2
smiData.Solid(1).PoI = [0 0 0];  % kg*mm^2
smiData.Solid(1).color = [0.6470588235294118 0.61960784313725492 0.58823529411764708];
smiData.Solid(1).opacity = 1;
smiData.Solid(1).ID = "Move*:*默认";

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(2).mass = 9.0000000000000018;  % kg
smiData.Solid(2).CoM = [0 7.4999999999999991 0];  % mm
smiData.Solid(2).MoI = [120168.75000000003 1807500.0000000005 1687668.7500000005];  % kg*mm^2
smiData.Solid(2).PoI = [0 0 0];  % kg*mm^2
smiData.Solid(2).color = [0.29803921568627451 0.29803921568627451 0.29803921568627451];
smiData.Solid(2).opacity = 1;
smiData.Solid(2).ID = "Plan*:*默认";

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(3).mass = 1.9002804461584208;  % kg
smiData.Solid(3).CoM = [0 12.499999999999998 0];  % mm
smiData.Solid(3).MoI = [1240.7118815835624 4799.3084585142633 3760.8624639384129];  % kg*mm^2
smiData.Solid(3).PoI = [0 0 0];  % kg*mm^2
smiData.Solid(3).color = [0.20000000000000001 0.20000000000000001 0.20000000000000001];
smiData.Solid(3).opacity = 1;
smiData.Solid(3).ID = "Body*:*默认";

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(4).mass = 0.80055721419865677;  % kg
smiData.Solid(4).CoM = [-2.9471709230127253e-05 189.45746588515507 0];  % mm
smiData.Solid(4).MoI = [1529.5227158678681 234.47262102972982 1519.3124543996778];  % kg*mm^2
smiData.Solid(4).PoI = [0 0.00038958434970417876 -0.003991752253062991];  % kg*mm^2
smiData.Solid(4).color = [0.6470588235294118 0.51764705882352935 0];
smiData.Solid(4).opacity = 1;
smiData.Solid(4).ID = "Bole*:*默认";


%============= Joint =============%
%X Revolute Primitive (Rx) %Y Revolute Primitive (Ry) %Z Revolute Primitive (Rz)
%X Prismatic Primitive (Px) %Y Prismatic Primitive (Py) %Z Prismatic Primitive (Pz) %Spherical Primitive (S)
%Constant Velocity Primitive (CV) %Lead Screw Primitive (LS)
%Position Target (Pos)

%Initialize the RevoluteJoint structure array by filling in null values.
smiData.RevoluteJoint(5).Rz.Pos = 0.0;
smiData.RevoluteJoint(5).ID = "";

smiData.RevoluteJoint(1).Rz.Pos = 0;  % deg
smiData.RevoluteJoint(1).ID = "[Body-1:-:Bole-1]";

smiData.RevoluteJoint(2).Rz.Pos = 0;  % deg
smiData.RevoluteJoint(2).ID = "[Move-1:-:Body-1]";

smiData.RevoluteJoint(3).Rz.Pos = 0;  % deg
smiData.RevoluteJoint(3).ID = "[Move-2:-:Body-1]";

smiData.RevoluteJoint(4).Rz.Pos = 0;  % deg
smiData.RevoluteJoint(4).ID = "[Move-3:-:Body-1]";

smiData.RevoluteJoint(5).Rz.Pos = 0;  % deg
smiData.RevoluteJoint(5).ID = "[Move-4:-:Body-1]";

