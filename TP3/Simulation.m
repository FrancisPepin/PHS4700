function [Coll tf voitureA voitureB resultatA resultatB] = Simulation(voitureA,voitureB,tb,traceA,traceB) 
% Execute la simulation pour voitureA et voitureB jusqu'a ce qu'il y ait collision
% ou que les deux voitures s'arretent (v < 0.01) et enregistre leurs positions a
% chaque temps pour les afficher sur un graphique par la suite.

deltat = 0.001;
t0 = 0;
qA0 = [voitureA.v voitureA.r voitureA.vAng voitureA.rAng];
qB0 = [voitureB.v voitureB.r voitureB.vAng voitureB.rAng];

Coll = 1;

traceA.Ajouter(t0, voitureA.r, voitureA.v);
traceB.Ajouter(t0, voitureB.r, voitureB.v);
resultatA = traceA;
resultatB = traceB;

while Coll == 1 && (norm(voitureA.v(1:2)) > 0.01 || norm(voitureB.v(1:2)) > 0.01)%0.01
    % on initialise qA et qB avec les valeurs actuelles de voitureA et voitureB.
    qA0 = [voitureA.v voitureA.r voitureA.vAng voitureA.rAng];
    qB0 = [voitureB.v voitureB.r voitureB.vAng voitureB.rAng];
    
    % on calcule les nouvelles valeurs de voitureA et voitureB avec RK4
    qAs = SEDRK4t0(qA0,t0,deltat,'AvecF',voitureA);
    if t0 < tb % voitureB n'a pas encore freine.
        qBs = SEDRK4t0(qB0,t0,deltat,'SansF',voitureB);
    else
        qBs = SEDRK4t0(qB0,t0,deltat,'AvecF',voitureB);
    end
    
    % on met les voitures a jour en fonction de ce que RK4 a calcule.
    voitureA.v = qAs(1:2);
    voitureA.r = qAs(3:4);
    voitureA.rAng = qAs(6);
    voitureB.v = qBs(1:2);
    voitureB.r = qBs(3:4);
    voitureB.rAng = qBs(6);

    t0 = t0+deltat;
    % on verifie s'il y a une collision.
    [Coll voitureA voitureB] = Collision(voitureA, voitureB); 
    tf = t0;
    traceA.Ajouter(t0, voitureA.r, voitureA.v);
    traceB.Ajouter(t0, voitureB.r, voitureB.v);
    resultatA = traceA;
    resultatB = traceB;
end
end