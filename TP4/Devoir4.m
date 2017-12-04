function [xi, yi, zi, face] = Devoir4(nout, nin, poso)
    [observateur, cylindre, bloc] = Initialisation(poso, nout, nin);
    limites = CalculLimites(observateur, cylindre, 100, 100);
    %listeRayons = GenererRayons(limites, observateur);            
    
    arrayPoint = [];
    arrayCouleur = [];
    for m = 1:length(limites.phi_m)
        for n = 1:length(limites.theta_n)
            t = limites.theta_n(n);
            p = limites.phi_m(m);
            u = [sin(t)*cos(p), sin(t)*sin(p), cos(t)]';
            droite = Droite(u, observateur.pos);
            %it = it + 1;
            
            [ rejet, point, couleur ] = CalculRayon( droite, bloc, cylindre, observateur );
            if not(rejet)
                arrayPoint = [arrayPoint point];
                arrayCouleur = [arrayCouleur couleur];
            end
            
        end
    end
    
    
    if not(isempty(arrayPoint))
        xi = arrayPoint(1,:);
        yi = arrayPoint(2,:);
        zi = arrayPoint(3,:);
        face = arrayfun(@(C) C.face, arrayCouleur);
    else
        xi = [];
        yi = [];
        zi = [];
        face = [];
    end
end
