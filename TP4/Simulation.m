function [ arrayPoint, arrayCouleur ] = Simulation( posObs, no, ni )
    [observateur, cylindre, bloc] = Initialisation(posObs, no, ni);
    limites = CalculLimites(observateur, cylindre, 100, 100);         
    
    cylindre_draw(cylindre);
    
    arrayPoint = [];
    arrayCouleur = [];
    for m = 1:length(limites.phi_m)
        for n = 1:length(limites.theta_n)
            t = limites.theta_n(n);
            p = limites.phi_m(m);
            droite = Droite.DroiteAngles(t, p, observateur.pos);
            
            [ rejet, point, couleur ] = CalculRayon( droite, bloc, cylindre, observateur );
            if not(rejet)
                arrayPoint = [arrayPoint point];
                arrayCouleur = [arrayCouleur couleur];
            end
            
        end
    end
    
    for m = [1, length(limites.phi_m)]
        for n = [1, length(limites.theta_n)]
            t = limites.theta_n(n);
            p = limites.phi_m(m);
            d = Droite.DroiteAngles(t, p, observateur.pos);
            
            droite_draw(d, 15);
        end
    end

end

