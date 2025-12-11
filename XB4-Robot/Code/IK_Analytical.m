function Radian = IK_Analytical(KPS44, RAngle)

    d1 = 0.342; a1 = 0.040; a2 = 0.275; a3 = 0.025; d4 = 0.280; d6 = 0.073;

    % Base / Tool 均保持自然坐标，无需旋转补偿
    Tbase = [1 0 0 0; 0 1 0 0; 0 0 1 d1; 0 0 0 1];
    Ttool = [1 0 0 0; 0 1 0 0; 0 0 1 d6; 0 0 0 1];

    R44 = (Tbase \ KPS44) / Ttool;

    x  = R44(1,4);  y = R44(2,4);  z = R44(3,4);
    nx = R44(1,1); ny = R44(2,1); nz = R44(3,1);
    ox = R44(1,2); oy = R44(2,2); oz = R44(3,2);
    ax = R44(1,3); ay = R44(2,3); az = R44(3,3);

    % ===== θ1 =====
    Q1 = zeros(1,2);
    sq_val = x^2 + y^2 - d4^2;  if sq_val < 0, sq_val = 0; end
    L = sqrt(sq_val);
    Q1(1) = atan2(y,x) - atan2(d4, L);
    Q1(2) = atan2(y,x) - atan2(d4,-L);

    % ===== θ3 =====
    Q3 = zeros(1,4);
    k = 1;
    for i = 1:2
        th1 = Q1(i);
        c1 = cos(th1); s1 = sin(th1);

        K_val = x*c1 + y*s1 - a1;
        D = (K_val^2 + (z-d1)^2 - a2^2 - a3^2)/(2*a2*a3);

        if abs(D) <= 1
            Q3(k)   = atan2( sqrt(1-D^2), D );
            Q3(k+1) = atan2(-sqrt(1-D^2), D );
        end
        k = k+2;
    end

    % ===== θ2 =====
    Q2 = zeros(1,4);
    k=1;
    for i=1:2
        th1 = Q1(i); c1 = cos(th1); s1 = sin(th1);
        for j=1:2
            th3 = Q3((i-1)*2+j);
            c3 = cos(th3); s3=sin(th3);

            A = a2 + a3*c3;
            B = a3*s3;
            K_val = x*c1 + y*s1 - a1;

            Q2(k) = atan2(z-d1,K_val) - atan2(B,A);
            k=k+1;
        end
    end

    % ===== θ4 θ5 θ6 =====
    QQ = zeros(8,6);
    row=1;

    for i=1:4
        th1 = Q1(ceil(i/2));
        th2 = Q2(i);
        th3 = Q3(i);

        c1=cos(th1); s1=sin(th1);
        c2=cos(th2); s2=sin(th2);
        c3=cos(th3); s3=sin(th3);

        R03=[
            c1*c2*c3-c1*s2*s3, -c1*c2*s3-c1*s2*c3, c1*s2;
            s1*c2*c3-s1*s2*s3, -s1*c2*s3-s1*s2*c3, s1*s2;
            s2*c3+c2*s3,       -s2*s3+c2*c3,      -c2 ];

        Rtarget=[nx ox ax; ny oy ay; nz oz az];
        R36 = R03' * Rtarget;

        th5 = atan2( sqrt(R36(1,3)^2 + R36(2,3)^2), R36(3,3) );
        th4 = atan2( R36(2,3), R36(1,3) );
        th6 = atan2( R36(3,2), -R36(3,1) );

        QQ(row,:)   = [th1 th2 th3 th4 th5 th6];
        QQ(row+4,:) = [th1 th2 th3 th4 -th5 th6+pi];

        row=row+1;
    end

    % ===== 选连续解 =====
    bestIndex=1; bestVal=inf;
    for i=1:8
        diff = sum(abs(QQ(i,:)' - RAngle));
        if diff < bestVal
            bestVal = diff; bestIndex=i;
        end
    end

    Radian = QQ(bestIndex,:)';

end
