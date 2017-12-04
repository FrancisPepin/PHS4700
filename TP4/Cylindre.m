classdef Cylindre
    %CYLINDRE Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        rayon,
        hauteur,
        centre,
        n   % Indice de refraction
    end
    
    methods
        function obj = Cylindre(rayon, hauteur, centre, n)
            obj.rayon = rayon;
            obj.hauteur = hauteur;
            obj.centre = centre;
            obj.n = n;
        end
        
        function [points, normales] = intersection_cylindre_ligne(obj, droite)
            points_bases = [];
            point_top = intersection_plan_ligne( ...
                            Plan([0;0;-1], obj.centre(3)+obj.hauteur/2), ...
                            droite ...
                            );
            point_bot = intersection_plan_ligne( ...
                            Plan([0;0;-1], obj.centre(3)-obj.hauteur/2), ...
                            droite ...
                            );
            points_bases_norm = [];
            if (point_top ~= 0) & Cylindre.point_dans_cercle(obj.centre(1:2), obj.rayon, point_top(1:2))
                points_bases = [points_bases point_top];
                points_bases_norm = [points_bases_norm [0; 0; 1]];  
            end
            if (point_bot ~= 0) & Cylindre.point_dans_cercle(obj.centre(1:2), obj.rayon, point_bot(1:2))
                points_bases = [points_bases point_bot];
                points_bases_norm = [points_bases_norm [0; 0; -1]]; 
            end
            
            
            points_cotes = Cylindre.intersection_cercle_ligne(obj.centre, obj.rayon, droite);
            points_cotes_normales = [];
            for p = points_cotes
                if abs(obj.centre(3) - points_cotes(3,:)) < obj.hauteur/2
                    temp = zeros(3,1);
                    temp(1:2) = p(1:2)-obj.centre(1:2);
                    points_cotes_normales = [points_cotes_normales temp];
                end
            end
            
            points = [points_bases points_cotes];
            normales = [points_bases_norm points_cotes_normales];
        end
    end
    
    methods(Static)
        function points = intersection_cercle_ligne(centre, rayon, droite)
            if (droite.u == 0)
                points = [];
                return;
            end
            
            % https://math.stackexchange.com/a/929240
            c = centre;
            r = rayon;
            u = droite.u;
            p = droite.r;
            
            det = (2*dot((p-c), u))^2 - 4*norm(u)^2*(norm(p-c)^2 - r^2);
            
            if det <= -1e-10
                points = [];
            elseif abs(det) < 1e-10
                t = -2*dot((p-c), u) / (2*norm(u)^2);
                points = [p + t * u];
            else
                t1 = (-2*dot((p-c), u) + sqrt(det))/ (2*norm(u)^2);
                t2 = (-2*dot((p-c), u) - sqrt(det))/ (2*norm(u)^2);
                points = [p + t1 * u, p + t2 * u];
            end
        end
        
        function bool = point_dans_cercle(centre, rayon, point)
            bool = norm(centre - point) < rayon;
        end
    end
end

