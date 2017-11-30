classdef Droite < handle
    % classe DROITE (page 23/147 chap 7a)
    properties
        u,      % vecteur unitaire
        r   % un point quelconque sur la droite
    end
    
    methods
        function obj = Droite(u, point)
            obj.u = u;
            obj.r = point;
        end
    end
end

