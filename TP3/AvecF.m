function g = AvecF(q0,t,voiture)
    force = Frottement(q0(1:2), voiture.m);
    a = force/voiture.m;
    v = q0(1:2) + a*t;
    g = horzcat(a, v, 0, q0(3));
end

