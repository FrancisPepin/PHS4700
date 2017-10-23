function g = option3(q0,t, obj)
  vi = q0(1:3);
  forceG = Forces.Gravite(obj);
  forceV = Forces.Visqueux(obj, q0(1:3));
  forceM = Forces.Magnus(obj, vi, obj.VitesseAngulaire);
  forceTot = forceG + forceM + forceV;
  a = forceTot/obj.Masse;
  v = Forces.Vitesse(vi, a, t);
  g = [a v];
end

