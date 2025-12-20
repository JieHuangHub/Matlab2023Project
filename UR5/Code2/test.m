% clear,close all
%% SDH
figure
%% 建立机器人SDH参数,初始姿态为竖直。
SL(1) = Link('d', 105.03, 'a', 0, 'alpha', pi/2,'offset',pi/2,'standard');
SL(2) = Link('d', 0, 'a', -174.42, 'alpha',0,'offset',-pi/2,'standard');
SL(3) = Link('d', 0 ,'a', -174.42, 'alpha', pi,'standard');
SL(4) = Link('d', -75.66 ,  'a', 0, 'alpha',-pi/2,'offset',-pi/2,'standard');
SL(5) = Link('d', -80.09, 'a',0, 'alpha', pi/2,'standard');
SL(6) = Link('d', -44.36, 'a', 0, 'alpha', 0,'standard');
robotS=SerialLink(SL,'name','Gluon_6L3-SDH', 'manufacturer','innfos');  
robotS.display(); 
thetas=[0,0,0,0,0,0];
thetas=thetas/180*pi;
%% 正解，给定关节角，求末端位姿
Ts = robotS.fkine(thetas);
robotS.plot(thetas,'tilesize',150);
%% MDH
figure
%% 建立机器人MDH参数,初始姿态为竖直。
ML(1) = Link('d', 105.03, 'a', 0, 'alpha', 0,'offset',pi/2,'modified');
ML(2) = Link('d', 80.09, 'a', 0, 'alpha', pi/2,'offset',pi/2,'modified');
ML(3) = Link('d', 0 ,'a', 174.42, 'alpha', 0,'modified');
ML(4) = Link('d', 4.44, 'a', 174.42, 'alpha', pi,'offset',pi/2,'modified');
ML(5) = Link('d', -80.09, 'a',0, 'alpha', -pi/2,'modified');
ML(6) = Link('d', -44.36, 'a', 0, 'alpha', pi/2,'offset',0,'modified');
robotM=SerialLink(ML,'name','Gluon_6L3-MDH', 'manufacturer','innfos');  
robotM.display();  
%% 正解，给定关节角，求末端位姿
thetam=[0,0,0,0,0,0];
thetam=thetam/180*pi;
Tm = robotM.fkine(thetam);
robotM.plot(thetam,'tilesize',150);