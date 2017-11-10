function [Coll tf raf vaf rbf vbf] = Devoir3(rai,vai,rbi,vbi,tb)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
voitureA = Voiture(1540,4.78,1.82,1.8,[rai(1:2) 0],[vai(1)/norm(vai) -vai(2)/norm(vai) 0 vai(2)/norm(vai) vai(1)/norm(vai) 0 0 0 1],[vai(1:2) 0],[0 0 vai(3)]);
voitureB = Voiture(1010,4.23,1.6,1.8,[rbi(1:2) 0],[vbi(1)/norm(vbi) -vbi(2)/norm(vbi) 0 vbi(2)/norm(vbi) vbi(1)/norm(vbi) 0 0 0 1],[vbi(1:2) 0],[0 0 vbi(3)]);

[Coll tf voitureA voitureB trace] = Simulation(voitureA, voitureB, tb, trace)

raf = voitureA.r;
vaf = voitureA.v;
rbf = voitureB.r;
vbf = voitureB.v;

end

