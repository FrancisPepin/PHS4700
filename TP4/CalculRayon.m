function [ rejet, point, couleur ] = CalculRayon( droite0, bloc, cylindre, observateur )
    distance = 0;
    point = 0; % default if rejected
    couleur = 0; % default if rejected
    rejet = false; % default
    droite = droite0;
    n_reflect = 0;
    is_in_cylinder = false;

    while n_reflect < 100
        % calcul des collision pour savoir quelle interface on frappe
        [pts_bloc, cols] = intersection_ligne(bloc, droite);
        [bloc_t, col] = closest_couleur(pts_bloc, droite, cols);
        [pts_cyl, normales] = intersection_cylindre_ligne(cylindre, droite);
        [cyl_t, normale] = closest_normale(pts_cyl, droite, normales);
        
        if (not(isinf(bloc_t)) && bloc_t < cyl_t)
            % on a collision avec le bloc
            distance = distance + norm(droite.u) * bloc_t;
            point = droite0.r + droite0.u * distance;
            couleur = col;
            return; % collision avec le bloc : cas 4
        elseif (not(isinf(cyl_t)) && bloc_t >= cyl_t)
            % on a collision avec le cylindre
            pt = droite.r + droite.u * cyl_t;
            distance = distance + norm(droite.u) * cyl_t;
            if is_in_cylinder
                ni = cylindre.n;
                nt = observateur.n;
            else
                nt = cylindre.n;
                ni = observateur.n;
            end
            [ut, rft] = Equations.Refraction(droite.u, normale, ni, nt);
            if rft
               ur = Equations.Reflexion(droite.u, normale);
               droite.r = pt;
               droite.u = ur;
               n_reflect = n_reflect + 1;
            else
               droite.r = pt;
               droite.u = ut;
               is_in_cylinder = not(is_in_cylinder);
            end
        else
            % aucune collision : cas 1 ou 3
            rejet = true;
            return;
        end
    end

    rejet = true; % cas 5
end

function [t, normale] = closest_normale(pts, droite, normales)
    if isempty(pts)
        t = Inf;
        normale = 0; % undef
        return;
    end
    
    ts = mean((pts - droite.r) ./ droite.u);
    t = min(ts(ts>1e-10));
    
    if isempty(t)
        t = Inf;
        normale = 0; % undef
        return;
    end
    
    temp = (t == ts);
    normales_res = normales([temp; temp; temp]);
    normale = normales_res(:,1);
end

function [t, couleur] = closest_couleur(pts, droite, couleurs)
    if isempty(pts)
        t = Inf;
        couleur = 0; % undef
        return;
    end
    
    ts = mean((pts - droite.r) ./ droite.u);
    t = min(ts(ts>1e-10));
    
    if isempty(t)
        t = Inf;
        couleur = 0; % undef
        return;
    end
    
    temp = (t == ts);
    normales_res = couleurs(temp);
    couleur = normales_res(:,1);
end