function g = option1(q0,t, obj)
  forceTot = Forces.Gravite(obj);
  a = forceTot/obj.Masse;
  g = [a q0(1) q0(2) q0(3)+a(3)*t];
end

