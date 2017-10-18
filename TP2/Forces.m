classdef Forces
    % Force appliquee sur les objets
    
    properties
        rho = 1.2;      % Masse volumique de l'air (1.2 kg/m^3)
        Cv = 0.5;       % Coefficient de frottement visqueux
        Cm = 0.29;  % Coefficient de Magnus
    end
    
    methods(Static)
        function force = Gravite(objet)
            force = objet.Masse * [0 0 -9.81]';
        end
        
        function force = Visqueux(objet, v)
            A = pi*(objet.Rayon)^2; % Aire efficace de la balle
            force = -Forces.rho * Forces.Cv * A * norm(v) * v / 2;
        end
        
        function force = Magnus(objet, v, w)
            force = 4 * pi * Forces.Cm * Forces.rho * objet.Rayon^3 * cross(w, v);
        end
    end
    
end
