function theta=niyundongxue(T)
    %变换矩阵T已知
    %SDH:标准DH参数表求逆解（解析解）
    %部分DH参数表如下，需要求解theta信息
    
    a=[0,-0.42500,-0.39225,0,0,0];
    d=[0.089159,0,0,0.10915,0.09465,0.08230];
    
    alpha=[pi/2,0,0,pi/2,-pi/2,0];% alpha没有用到,故此逆解程序只适合alpha=[pi/2,0,0,pi/2,-pi/2,0]的情况！
    
    nx=T(1,1);ny=T(2,1);nz=T(3,1);
    ox=T(1,2);oy=T(2,2);oz=T(3,2);
    ax=T(1,3);ay=T(2,3);az=T(3,3);
    px=T(1,4);py=T(2,4);pz=T(3,4);
    
    %求解关节角1
    m=d(6)*ay-py;  n=ax*d(6)-px; 
    theta1(1,1)=atan2(m,n)-atan2(d(4),sqrt(m^2+n^2-(d(4))^2));
    theta1(1,2)=atan2(m,n)-atan2(d(4),-sqrt(m^2+n^2-(d(4))^2));
  
    %求解关节角5
    theta5(1,1:2)=acos(ax*sin(theta1)-ay*cos(theta1));
    theta5(2,1:2)=-acos(ax*sin(theta1)-ay*cos(theta1));      
    
    %求解关节角6
    mm=nx*sin(theta1)-ny*cos(theta1); nn=ox*sin(theta1)-oy*cos(theta1);
    %theta6=atan2(mm,nn)-atan2(sin(theta5),0);
    theta6(1,1:2)=atan2(mm,nn)-atan2(sin(theta5(1,1:2)),0);
    theta6(2,1:2)=atan2(mm,nn)-atan2(sin(theta5(2,1:2)),0);
    
    %求解关节角3
    mmm(1,1:2)=d(5)*(sin(theta6(1,1:2)).*(nx*cos(theta1)+ny*sin(theta1))+cos(theta6(1,1:2)).*(ox*cos(theta1)+oy*sin(theta1))) ...
        -d(6)*(ax*cos(theta1)+ay*sin(theta1))+px*cos(theta1)+py*sin(theta1);
    nnn(1,1:2)=pz-d(1)-az*d(6)+d(5)*(oz*cos(theta6(1,1:2))+nz*sin(theta6(1,1:2)));
    mmm(2,1:2)=d(5)*(sin(theta6(2,1:2)).*(nx*cos(theta1)+ny*sin(theta1))+cos(theta6(2,1:2)).*(ox*cos(theta1)+oy*sin(theta1))) ...
        -d(6)*(ax*cos(theta1)+ay*sin(theta1))+px*cos(theta1)+py*sin(theta1);
    nnn(2,1:2)=pz-d(1)-az*d(6)+d(5)*(oz*cos(theta6(2,1:2))+nz*sin(theta6(2,1:2)));
    theta3(1:2,:)=acos((mmm.^2+nnn.^2-(a(2))^2-(a(3))^2)/(2*a(2)*a(3)));
    theta3(3:4,:)=-acos((mmm.^2+nnn.^2-(a(2))^2-(a(3))^2)/(2*a(2)*a(3)));
    
    %求解关节角2
    mmm_s2(1:2,:)=mmm;
    mmm_s2(3:4,:)=mmm;
    nnn_s2(1:2,:)=nnn;
    nnn_s2(3:4,:)=nnn;
    s2=((a(3)*cos(theta3)+a(2)).*nnn_s2-a(3)*sin(theta3).*mmm_s2)./ ...
        ((a(2))^2+(a(3))^2+2*a(2)*a(3)*cos(theta3));
    c2=(mmm_s2+a(3)*sin(theta3).*s2)./(a(3)*cos(theta3)+a(2));
    theta2=atan2(s2,c2);   
    
    %整理关节角1 5 6 3 2
    theta(1:4,1)=theta1(1,1);theta(5:8,1)=theta1(1,2);
    theta(:,2)=[theta2(1,1),theta2(3,1),theta2(2,1),theta2(4,1),theta2(1,2),theta2(3,2),theta2(2,2),theta2(4,2)]';
    theta(:,3)=[theta3(1,1),theta3(3,1),theta3(2,1),theta3(4,1),theta3(1,2),theta3(3,2),theta3(2,2),theta3(4,2)]';
    theta(1:2,5)=theta5(1,1);theta(3:4,5)=theta5(2,1);
    theta(5:6,5)=theta5(1,2);theta(7:8,5)=theta5(2,2);
    theta(1:2,6)=theta6(1,1);theta(3:4,6)=theta6(2,1);
    theta(5:6,6)=theta6(1,2);theta(7:8,6)=theta6(2,2); 
    
    %求解关节角4
    theta(:,4)=atan2(-sin(theta(:,6)).*(nx*cos(theta(:,1))+ny*sin(theta(:,1)))-cos(theta(:,6)).* ...
        (ox*cos(theta(:,1))+oy*sin(theta(:,1))),oz*cos(theta(:,6))+nz*sin(theta(:,6)))-theta(:,2)-theta(:,3);  
    
end