function g = option3(q0,t, obj)
  forceTot = Forces.Gravite(obj);
  a = forceTot/obj.Masse;
  g = [a q0(1:3)];
end

