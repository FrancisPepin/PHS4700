classdef Droite
    % classe DROITE (page 23/147 chap 7a)
    properties
        u % vecteur unitaire (vertical)
        r % un point quelconque sur la droite (vertical)
    end
    
    methods
        function obj = Droite(u, point)
            obj.u = u;
            obj.r = point;
        end
    end
end

