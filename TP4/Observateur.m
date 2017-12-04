classdef Observateur
    % Classe OBSERVATEUR pour stocker les informations de l'observateur
    
    properties
        pos,
        n
    end
    
    methods
        function o = Observateur(posObs, n)
            o.pos = posObs;
            o.n = n;
        end
    end
    
end

