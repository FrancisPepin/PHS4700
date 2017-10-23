function [coup, tf, rbf, vbf]=Devoir2(option, rbi, vbi, wbi)

initialisation();

% Initialisation Balle selon parametre
Balle = Sphere();
Balle.Masse = 2.74;
Balle.Rayon = 0.0199;
Balle.Position = rbi;
Balle.Vitesse = vbi;
Balle.VitesseAngulaire = wbi;

trace = Trace();

[coup, trace] = Simulation(1, Balle, Obstacles, trace);

tf = trace.t(end);
rbf = trace.position(:, end);
vbf = trace.vitesse(:, end);

disp(tf);
disp(rbf);
disp(vbf);
end