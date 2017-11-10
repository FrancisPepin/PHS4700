function [Coll tf raf vaf rbf vbf resultat] = Simulation(voitureA,voitureB,tb,trace)
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here
deltat = 0.0001;
t0 = 0;
qA0 = [voitureA.v voitureA.r voitureA.vAng voitureA.rAng];
qB0 = [voitureB.v voitureB.r voitureB.vAng voitureB.rAng];

Coll = 1;

while Coll == 1 and norm(voitureA.v(1:2)) > 0.01 and norm(voitureA.v(1:2)) > 0.01
    qA0 = [voitureA.v voitureA.r voitureA.vAng voitureA.rAng];
    qB0 = [voitureB.v voitureB.r voitureB.vAng voitureB.rAng];
    qAs = SEDRK4t0(qA0,t0,deltat,avecF,voiture);
    if t0 < tb
        qBs = SEDRK4t0(qB0,t0,deltat,sansF,voiture);
    else
        qBs = SEDRK4t0(qB0,t0,deltat,avecF,voiture);
    end
    voitureA.v = qAs(1:2);
    voitureA.r = qAs(4:6);
    voitureA.rAng = qAs(8);
    voitureB.v = qBs(1:2);
    voitureB.r = qBs(4:6);
    voitureB.rAng = qBs(8);
    %voitureA.v = qAs(1:3);
    %voitureA.r = qAs(4:6);
    %voitureA.R = qAs(10:18);
    %voitureB.v = qBs(1:3);
    %voitureB.r = qBs(4:6);
    %voitureB.R = qBs(10:18);
    t0 = t0+deltat;
    [Coll raf vaf rbf vbf] = Collison(voitureA, voitureB);
end
end

function g = avecF(q0,t,voiture)
    force = Frottement(q0(1:2), voiture.m);
    a = force/voiture.m;
    v = q0(1:2) + a*t;
    gFin = g_Fin(q0);
    %g = [a v 0 0 0 gFin];
    g = horzcat(a, v, 0, q0(3));
end

function g = sansF(q0,t,voiture)
    gFin = g_Fin(q0);
    %g = [0 0 0 q0(1:3) 0 0 0 gFin];
    g = horzcat(0, 0, q0(1:2), 0, q0(3)); 
end

function gFin = g_Fin(q0)
    gFin = [(q0(8)*q0(16)-q0(9)*q0(13)) (q0(8)*q0(17)-q0(9)*q0(14)) (q0(8)*q0(18)-q0(9)*q0(15)) (q0(9)*q0(10)-q0(7)*q0(16)) (q0(9)*q0(11)-q0(7)*q0(17)) (q0(9)*q0(12)-q0(7)*q0(18)) (q0(7)*q0(13)-q0(8)*q0(10)) (q0(7)*q0(14)-q0(8)*q0(11)) (q0(7)*q0(15)-q0(8)*q0(12))];
end