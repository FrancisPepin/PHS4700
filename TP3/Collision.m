function [Coll, raf, vaf, rbf, vbf] = Collision(A, B)

coefRest = 0.8;
  
  
%qA1 = (A.r + [A.h/2 A.L/2 A.l/2])*([A.R(1:3);A.R(4:6);A.R(7:9)]);
%qA2 = (A.r + [A.h/2 A.L/2 -A.l/2])*([A.R(1:3);A.R(4:6);A.R(7:9)]);
%qA3 = (A.r + [A.h/2 -A.L/2 A.l/2])*([A.R(1:3);A.R(4:6);A.R(7:9)]);
%qA4 = (A.r + [A.h/2 -A.L/2 -A.l/2])*([A.R(1:3);A.R(4:6);A.R(7:9)]);
%qA5 = (A.r + [-A.h/2 A.L/2 A.l/2])*([A.R(1:3);A.R(4:6);A.R(7:9)]);
%qA6 = (A.r + [-A.h/2 A.L/2 -A.l/2])*([A.R(1:3);A.R(4:6);A.R(7:9)]);
%qA7 = (A.r + [-A.h/2 -A.L/2 A.l/2])*([A.R(1:3);A.R(4:6);A.R(7:9)]);
%qA8 = (A.r + [-A.h/2 -A.L/2 -A.l/2])*([A.R(1:3);A.R(4:6);A.R(7:9)]);

%qA1 = (B.r + [B.h/2 B.L/2 B.l/2])*([B.R(1:3);B.R(4:6);B.R(7:9)]);
%qA2 = (B.r + [B.h/2 B.L/2 -B.l/2])*([B.R(1:3);B.R(4:6);B.R(7:9)]);
%qA3 = (B.r + [B.h/2 -B.L/2 B.l/2])*([B.R(1:3);B.R(4:6);B.R(7:9)]);
%qA4 = (B.r + [B.h/2 -B.L/2 -B.l/2])*([B.R(1:3);B.R(4:6);B.R(7:9)]);
%qA5 = (B.r + [-B.h/2 B.L/2 B.l/2])*([B.R(1:3);B.R(4:6);B.R(7:9)]);
%qA6 = (B.r + [-B.h/2 B.L/2 -B.l/2])*([B.R(1:3);B.R(4:6);B.R(7:9)]);
%qA7 = (B.r + [-B.h/2 -B.L/2 B.l/2])*([B.R(1:3);B.R(4:6);B.R(7:9)]);
%qA8 = (B.r + [-B.h/2 -B.L/2 -B.l/2])*([B.R(1:3);B.R(4:6);B.R(7:9)]);
Coll = 1;

for i = [1 2 3 4]
    n = cross(A.plans(i)(1), A.plans(i)(2));
    n = n/norm(n);
    for j = [1 2 3 4]
      d = dot(n, A.plans(i)(3) - B.coins(j));
      if d < 0
        Coll = 0;
      end
    end
end

if Coll == 1
  vr = dot(n, (vap - vbp));
  j = -1*(1+coefRest)*vr/(1/A.m + 1/B.m);
  
  vaf = [([A.v 0] + n*j/A.m)(1:2) A.vAng];
  vbf = [([B.v 0] + n*j/B.m)(1:2) B.vAng];
else
  vaf = [A.v A.vAng];
  vbf = [B.v B.vAng];
end
  raf = [A.r A.rAng];
  rbf = [B.r B.rAng];

end

