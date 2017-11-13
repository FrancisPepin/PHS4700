function [Coll, A, B] = Collision(A, B)
%Retourne Coll=0 si il y a collision ou Coll=1 sinon. Si il y a collision, calcule
%les nouvelles valeurs de vitesses de A et B.

coefRest = 0.8;
err = 0.01;
  
Coll = 0;

%On cherche un plan de division entre A et B.
plans = A.getPlans();
coins = B.getCoins();
i = 1;
minD = inf;
while (i <= 4 && Coll == 0) 
    n = cross(plans(i,1:3), plans(i,4:6));
    n = n/norm(n);
    k = 1;
    coinsDehors = 1;
    while (k <= 4)
      d = dot(n, plans(i,7:9) - coins(k,:));
      if d <= 0
        coinsDehors = 0;
        if d < minD
            minD = d;
            p = coins(k,:);
        end
      end
      k = k + 1;
    end
    if coinsDehors == 1
        Coll = 1;
        %On a trouve un plan de division.
    end
    i = i + 1;
end

%Si on n'a pas trouve de plan de division, on en cherche un entre B et A.
plans = B.getPlans();
coins = A.getCoins();
i = 1;
minD = inf;
while (i <= 4 && Coll == 0) 
    n = cross(plans(i,1:3), plans(i,4:6));
    n = n/norm(n);
    k = 1;
    coinsDehors = 1;
    while (k <= 4)
      d = dot(n, plans(i,7:9) - coins(k,:));
      if d <= 0
        coinsDehors = 0;
        if d < minD
            minD = d;
            p = coins(k,:);
        end
      end
      k = k + 1;
    end
    if coinsDehors == 1
        Coll = 1;
    end
    i = i + 1;
end


if Coll == 0 %Si pas de plan de division trouve, donc si collision
  rap = [A.r 0] - p;
  rbp = [B.r 0] - p;
    
  vap = [A.v 0] + cross([0 0 A.vAng], rap);
  vbp = [B.v 0] + cross([0 0 B.vAng], rbp);
  vr = dot(n, (vap - vbp));
  Ga = dot(n, transpose(A.getIInv()*transpose(cross(cross(rap,n),rap))));
  Gb = dot(n, transpose(B.getIInv()*transpose(cross(cross(rbp,n),rbp))));
  j = -1*(1+coefRest)*vr/(1/A.m + 1/B.m + Ga + Gb);
  
  vAngATemp = [0 0 A.vAng] + transpose(A.getIInv()*transpose((cross(rap,n*j))));
  vAngBTemp = [0 0 B.vAng] + transpose(B.getIInv()*transpose((cross(rbp,n*j))));
  
  A.vAng = vAngATemp(3);
  B.vAng = vAngBTemp(3);
  
  vafTemp = ([A.v 0] + n*j/A.m);
  vbfTemp = ([B.v 0] + n*j/B.m);
  A.v = vafTemp(1:2);
  B.v = vbfTemp(1:2);
end
end

