function [coup, tf, rbf, vbf] = Simulation(option, balle, tableJoueur, tableOpposant, filet)
%SIMULATION Summary of this function goes here
%   Detailed explanation goes here
    epsilon = 0.001;
    pas = 0.01;
    q0 = [balle.Vitesse, balle.Position, balle.VitesseAngulaire];
    t0 = 0;
    t1 = t0;
    
    switch option
      case 1
        g = option1;
      case 2
        g = option2;
      case 3
        g = option3;
    end
    
    coup = -1;
    while coup == -1
      t0 = t1;
      q0 = [balle.Vitesse, balle.Position, balle.VitesseAngulaire];
      qs = SEDRK4t0(q0,t0,pas,g);
      balle.Vitesse = qs(1:3);
      balle.Position = qs(4:6);
      if q0(4) + balle.Rayon < filet(1)... % si la balle n'a pas depasse le filet a l'iteration precedente
        & balle.Postion(1) + balle.Rayon >= filet(1) % si la balle depasse le filet
        
        [tf, rbf, vbf] = calculerValeursFinalesXSup(t0,t1,pas,epsilon,q0,balle,filet(1));
            % calcul de la position precise de la balle au moement de depasser le filet
            
        if rbf(2) - balle.Rayon <= filet(7) & rbf(2) + balle.Rayon >= filet(5) ...
          & rbf(3) - balle.Rayon <= filet(10) & rbf(3) + balle.Rayon >= filet(9) 
              % si la balle se situe a l'interieur des limites du filet
          coup = 2;
        end
        
      elseif q0(6) - balle.Rayon > tableJoueur(9) ... % si la balle n'a pas depasse la table a l'iteration precedente
        & balle.Position(3) - balle.Rayon <= tableJoueur(9) % si la balle touche ou va sous la table
        
        [tf, rbf, vbf] = calculerValeursFinalesZInf(t0,t1,pas,epsilon,q0,balle,tableJoueur(9));
            % calcul de la position precise de la balle au moment de depasser la table
            
        if rbf(1) + balle.Rayon >= tableJoueur(1) & rbf(1) - balle.Rayon <= tableOpposant(2) ...
          & rbf(2) + balle.Rayon >= tableJoueur(5) & rbf(2) - balle.Rayon <= tableJoueur(7) 
              % si la balle se situe a l'interieur des limites de la table
          if rbf(1) + balle.Rayon >= tableOpposant(1) % si la balle touche la table du cote de l'opposant
            coup = 0;
          else  % sinon (si la balle touche la table du cote du joueur)
            coup = 1;
          end
        end
        
      elseif balle.Position(3) - balle.Rayon <= 0 % si la balle touche le sol
          [tf, rbf, vbf] = calculerValeursFinalesZInf(t0,t1,pas,epsilon,q0,balle,0);
              % calcul de la position precise de la balle au moment de toucher le sol
          coup = 3;
      end      
      t1 = t0 + pas;
    end
end


function res=option1(q0,t0)
  forceTot = Forces.Gravite(balle);
  a = forceTot/balle.Masse;
  res = [a, q(1:3)];
end

function res=option2(q0,t0)
  forceTot = Forces.Gravite(balle) + Forces.Visqueux(balle, q(1:3));
  a = forceTot/balle.Masse;
  res = [a, q(1:3)];
end

function res=option3(q0,t0)
  forceTot = Forces.Gravite(balle) + Forces.Visqueux(balle, q(1:3));
  + Forces.Magnus(balle, q(1:3), q(7:9));
  a = forceTot/balle.Masse;
  res = [a, q(1:3)];
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