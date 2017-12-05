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
        
        function droite_draw(obj, longueur)
            p1 = obj.r;
            p2 = obj.r + obj.u*longueur;
            a = [p1, p2];
            x = a(1,:);
            y = a(2,:);
            z = a(3,:);
            line(x, y, z);
        end
    end
    
    methods(Static)
        function obj = DroiteAngles(t, p, point)
            u = [sin(t)*cos(p); sin(t)*sin(p); cos(t)];
            obj = Droite(u, point);
        end
    end
end

