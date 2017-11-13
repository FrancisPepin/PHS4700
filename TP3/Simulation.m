function [Coll tf voitureA voitureB resultatA resultatB] = Simulation(voitureA,voitureB,tb,traceA,traceB) %raf vaf rbf vbf resultatA, resultatB] = Simulation(voitureA,voitureB,tb,traceA,traceB)
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here
deltat = 0.001;
t0 = 0;
qA0 = [voitureA.v voitureA.r voitureA.vAng voitureA.rAng];
qB0 = [voitureB.v voitureB.r voitureB.vAng voitureB.rAng];

Coll = 1;

traceA.Ajouter(t0, voitureA.r, voitureA.v);
traceB.Ajouter(t0, voitureB.r, voitureB.v);
resultatA = traceA;
resultatB = traceB;

while Coll == 1 && norm(voitureA.v(1:2)) > 0.01 && norm(voitureA.v(1:2)) > 0.01
    qA0 = [voitureA.v voitureA.r voitureA.vAng voitureA.rAng];
    qB0 = [voitureB.v voitureB.r voitureB.vAng voitureB.rAng];
    qAs = SEDRK4t0(qA0,t0,deltat,'AvecF',voitureA);
    if t0 < tb
        qBs = SEDRK4t0(qB0,t0,deltat,'SansF',voitureB);
    else
        qBs = SEDRK4t0(qB0,t0,deltat,'AvecF',voitureB);
    end
    voitureA.v = qAs(1:2);
    voitureA.r = qAs(3:4);
    voitureA.rAng = qAs(6);
    voitureB.v = qBs(1:2);
    voitureB.r = qBs(3:4);
    voitureB.rAng = qBs(6);
    %voitureA.v = qAs(1:3);
    %voitureA.r = qAs(4:6);
    %voitureA.R = qAs(10:18);
    %voitureB.v = qBs(1:3);
    %voitureB.r = qBs(4:6);
    %voitureB.R = qBs(10:18);
    t0 = t0+deltat;
    [Coll voitureA voitureB] = Collision(voitureA, voitureB); %raf vaf rbf vbf] = Collision(voitureA, voitureB);
    tf = t0;
    traceA.Ajouter(t0, voitureA.r, voitureA.v);
    traceB.Ajouter(t0, voitureB.r, voitureB.v);
    resultatA = traceA;
    resultatB = traceB;
end
end