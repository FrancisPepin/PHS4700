function [coup, resultat] = Simulation(option, balle, obstacle, trace)
%SIMULATION Summary of this function goes here
%   Detailed explanation goes here
    epsilon = 0.001;
    pas = 0.001;
    q0 = [balle.Vitesse balle.Position];
    t0 = 0;
    t1 = t0;
    
    TableJoueurA = obstacle(:,1)';
    TableJoueurB = obstacle(:,2)';
    TableOpposantA = obstacle(:,3)';
    TableOpposantB = obstacle(:,4)';
    FiletA = obstacle(:,5)';
    FiletB = obstacle(:,6)';
    
    switch option
      case 1
        g = 'option1';
      case 2
        g = 'option2';
      case 3
        g = 'option3';
    end
    
    trace.Ajouter(t0, balle.Position, balle.Vitesse);
    resultat = trace;
    
    coup = -1;
    while coup == -1
      t0 = t1;
      q0 = [balle.Vitesse balle.Position];
      qs = SEDRK4t0(q0,t0,pas,g, balle);
      balle.Vitesse = qs(1:3);
      balle.Position = qs(4:6);
      
      if(Collision(balle.Position, balle.Rayon, TableOpposantA, TableOpposantB))
          coup = 0;
      end
      if(Collision(balle.Position, balle.Rayon, TableJoueurA, TableJoueurB))
          coup = 1;
      end
      if(Collision(balle.Position, balle.Rayon, FiletA, FiletB))
          coup = 2;
      end
      if(balle.Position(3) - balle.Rayon <= 0)
          coup = 3;
      end
      
    t1 = t0 + pas;
    trace.Ajouter(t1, balle.Position, balle.Vitesse);
    end
    
    resultat = trace;
end

function [tf, rbf, vbf]=calculerValeursFinalesZInf(t0,t1,pas,epsilon,q0,balle,zCible)
  % Trouve les valeurs de temps, position et vitesse au moment ou la balle atteint la
  % coordonnee z (en venant d'un z superieur) avec une precision egale a epsilon.
  if abs(balle.Position(3) - balle.Rayon - zCible) <= epsilon
    tf = t1;
    rbf = balle.Position;
    vbf = balle.Vitesse;
  elseif abs(q0(6) - balle.Rayon - zCible) <= epsilon
    tf = t0;
    rbf = q0(4:6);
    vbf = q0(1:3);
  else
    while abs(balle.Position(3) - balle.Rayon - zCible) > epsilon
      pas = pas/10;
      j = 0;
      t = t0;
      balle.Position = q0(4:6);
      balle.Vitesse = q0(1:3);
     while balle.Position(3) - balle.Rayon <= zCible & j < 10
        j = j + 1;
        q0 = [balle.Vitesse, balle.Position, balle.VitesseAngulaire];
        qs = SEDRK4t0(q0,t,pas,g);
        balle.Vitesse = qs(1:3);
        balle.Position = qs(4:6);
        t = t + pas;
      end
      t0 = t - pas;
      t1 = t;
    end
    tf = t1;
    rbf = balle.Position;
    vbf = balle.Vitesse;
  end
end

function [tf, rbf, vbf]=calculerValeursFinalesXSup(t0,t1,pas,epsilon,q0,balle,xCible)
  % Trouve les valeurs de temps, position et vitesse au moment ou la balle atteint la
  % coordonnee x (en venant d'un x inferieur) avec une precision egale a epsilon.
  if abs(balle.Position(1) + balle.Rayon - xCible) <= epsilon
    tf = t1;
    rbf = balle.Position;
    vbf = balle.Vitesse;
  elseif abs(q0(6) + balle.Rayon - xCible) <= epsilon
    tf = t0;
    rbf = q0(4:6);
    vbf = q0(1:3);
  else
    while abs(balle.Position(1) + balle.Rayon - xCible) > epsilon
      pas = pas/10;
      j = 0;
      t = t0;
      balle.Position = q0(4:6);
      balle.Vitesse = q0(1:3);
      while balle.Position(1) + balle.Rayon < xCible & j < 10
        j = j + 1;
        q0 = [balle.Vitesse, balle.Position, balle.VitesseAngulaire];
        qs = SEDRK4t0(q0,t,pas,g);
        balle.Vitesse = qs(1:3);
        balle.Position = qs(4:6);
        t = t + pas;
      end
      t0 = t - pas;
      t1 = t;
    end
    tf = t1;
    rbf = balle.Position;
    vbf = balle.Vitesse;
  end  
end