function [coll] = Collision(A, B)
qA1 = (A.r + [A.h/2 A.L/2 A.l/2])*([A.R(1:3);A.R(4:6);A.R(7:9)])
qA2 = (A.r + [A.h/2 A.L/2 -A.l/2])*([A.R(1:3);A.R(4:6);A.R(7:9)])
qA3 = (A.r + [A.h/2 -A.L/2 A.l/2])*([A.R(1:3);A.R(4:6);A.R(7:9)])
qA4 = (A.r + [A.h/2 -A.L/2 -A.l/2])*([A.R(1:3);A.R(4:6);A.R(7:9)])
qA5 = (A.r + [-A.h/2 A.L/2 A.l/2])*([A.R(1:3);A.R(4:6);A.R(7:9)])
qA6 = (A.r + [-A.h/2 A.L/2 -A.l/2])*([A.R(1:3);A.R(4:6);A.R(7:9)])
qA7 = (A.r + [-A.h/2 -A.L/2 A.l/2])*([A.R(1:3);A.R(4:6);A.R(7:9)])
qA8 = (A.r + [-A.h/2 -A.L/2 -A.l/2])*([A.R(1:3);A.R(4:6);A.R(7:9)])

for i = [1 2 3 4]
    
end

end

