function [F] = Frottement(v,m)
% Retourne la force de frottement causee par un solide de vitesse v et de masse m.
% Les valeurs des coefficients de frottement sont definis par les instructions du devoir.
    g = 9.8; % acceleration gravitationnelle a la surface de la Terre.
    if norm(v) > 50
        mu = 0.075;
    else
        mu = 0.15*(1-norm(v)/100);
    end
    
    F = -1*mu*m*g/norm(v)*v;
    
end

