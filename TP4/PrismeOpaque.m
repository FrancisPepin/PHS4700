classdef PrismeOpaque
    %PRISMEOPAQUE Prisme rectangulaire aligné sur les axes et opaque
    %   Detailed explanation goes here
    
    properties
        l_min % limite inférieure en [x; y; z] (vertical)
        l_max % limite supérieure en [x; y; z] (vertical)
        c_min % couleur de la face inférieure en [x; y; z] (vertical)
        c_max % couleur de la face supérieure en [x; y; z] (vertical)
    end
    
    methods
        function obj = PrismeOpaque(l_min, l_max, c_min, c_max)
            obj.l_min = l_min;
            obj.l_max = l_max;
            obj.c_min = c_min;
            obj.c_max = c_max;
        end
        
        function [pts, cols] = intersection_ligne(obj, droite)
            % Liang–Barsky algorithm
            % https://en.wikipedia.org/wiki/Liang%E2%80%93Barsky_algorithm
            
            q_min = droite.r - obj.l_min;
            q_max = obj.l_max - droite.r;
            
            p_min = -droite.u;
            p_max = droite.u;
            
            q = [q_min; q_max];
            p = [p_min; p_max];
            c = [obj.c_min; obj.c_max];
            
            if (any((p == 0) & (q < 0)))
                pts = [];
                cols = [];
                return;
            end
            
            u1 = -Inf;
            u2 = Inf;
            
            for i=1:length(p)
                ui = q(i)/p(i);
                if (p(i) < 0)
                    if (ui > u1)
                        u1 = ui;
                        c1 = c(i);
                    end
                elseif (p(i) > 0)
                    if (ui < u2)
                        u2 = ui;
                        c2 = c(i);
                    end
                end
            end
            
            if (u1 > u2)
                pts = [];
                cols = [];
                return;
            end
            
            pts = [droite.r + u1 * droite.u, droite.r + u2 * droite.u];
            cols = [c1, c2];
        end
    end
    
end

