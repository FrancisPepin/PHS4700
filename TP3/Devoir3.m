function [Coll tf raf vaf rbf vbf] = Devoir3(rai,vai,rbi,vbi,tb)
% Simule le deplacement de deux voitures sur la glace.
% Une des voitures a une vitesse initiale et freine au temps t=0, alors que l'autre
% avance d'abord a une vitesse constante, et ne freine qu'au temps t=tb.
% Retourne Coll = 0 si les deux voitures entrent en collision, Coll = 1 sinon.
% tf est le temps final.
% raf, vaf, rbf et vbf sont les positions et vitesses finales de chaque voiture (le 3e 
% element de chaque vecteur est la position angulaire et la vitesse angulaire autour de l'axe z).


voitureA = Voiture(1540,4.78,1.82,1.8, rai(1:2), atan(vai(2)/vai(1)), vai(1:2), vai(3))%[rai(1:2) 0],[vai(1)/norm(vai) -vai(2)/norm(vai) 0 vai(2)/norm(vai) vai(1)/norm(vai) 0 0 0 1],[vai(1:2) 0],[0 0 vai(3)]);
voitureB = Voiture(1010,4.23,1.6,1.8, rbi(1:2), atan(vbi(2)/vbi(1)), vbi(1:2), vbi(3))%[rbi(1:2) 0],[vbi(1)/norm(vbi) -vbi(2)/norm(vbi) 0 vbi(2)/norm(vbi) vbi(1)/norm(vbi) 0 0 0 1],[vbi(1:2) 0],[0 0 vbi(3)]);
voitureA.dessiner('r');
voitureB.dessiner('b');

traceA = Trace();
traceB = Trace();
[Coll, tf, voitureA, voitureB, traceA, traceB] = Simulation(voitureA, voitureB, tb, traceA, traceB);
raf = [voitureA.r voitureA.rAng];
rbf = [voitureB.r voitureB.rAng];
vaf = [voitureA.v voitureA.vAng];
vbf = [voitureB.v voitureB.vAng];

x = traceB.position(1,:);
y = traceB.position(2,:);

voitureA.dessiner('r');
voitureB.dessiner('b');

plot(traceA.position(1,:), traceA.position(2,:), traceB.position(1,:), traceB.position(2,:));

end

