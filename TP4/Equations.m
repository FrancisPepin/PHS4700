classdef Equations
    % Classe Equations pour contenir les equations de reflexions,
    % refractions et de collisions
    % J'aurais pu simplement faire 3 fichier contenant chacun la fonction
    % amis bon, d'ou le Static.
    
    methods(Static)
        % ur est le vecteur unitaire resultant
        % ui est le vecteur unitaire incidant
        % i est la normale unitaire sortante a la surface de reflexion
        % i est donc perpendiculaire à la surface de collision (cylindre ou
        % bloc)
        function ur = Reflexion(ui, i)
            ur = ui - 2 * dot(ui, i) * i;
        end
        
        % ut est le vecteur unitaire refracté (apres refraction)
        % ui est le vecteur unitaire incident (entrant)
        % i est la normale unitaire sortante a la surface de reflexion
        % ni est l'indice de réfraction avant le contact
        % nt est l'indice de réfraction apres le contact
        function [ut, rft] = Refraction(ui, i, ni, nt)
            % on veut arriver a : ut = -i * cos(theta_t) + k * sin(theta_t)
            if (ni == nt)
                ut = ui;
                rft = false;
                return;
            end
            % On s'assure que les vecteur ui et i sont unitaire
            ui = ui / norm(ui);
            i = i / norm(i);
            
            j = cross(ui, i);
            k = cross(i, j);
            
            sin_i = dot(ui, k);
            theta_i = asin(sin_i);
            
            % Les bornes de refraction
            max = abs(asin(nt/ni));
            % Au depart je verifiais si ni < nt mais ca ne sert a rien
            if -max <= theta_i && max >= theta_i
                sin_t = (ni/nt) * sin_i;
                cos_t = sqrt(1 - sin_t^2);
                ut = -i * cos_t + k * sin_t;
                rft = false;
            else
                rft = true;
                ut = [0 0 0]';
            end
        end
    end
end

