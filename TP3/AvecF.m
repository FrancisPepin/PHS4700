function g = AvecF(q0,t,voiture)
  %Fonction g utilisee avec RK4 pour le cas avec frottement.
    force = Frottement(q0(1:2), voiture.m);
    a = force/voiture.m;
    v = q0(1:2);
    g = horzcat(a, v, 0, q0(3));
end

