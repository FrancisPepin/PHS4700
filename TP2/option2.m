function g = option2(q0,t, obj)
  vi = q0(1:3);
  forceTot = Forces.Gravite(obj) + Forces.Visqueux(obj, q0(1:3));
  a = forceTot/obj.Masse;
  v = Forces.Vitesse(vi, a, t);
  g = [a v];
end

