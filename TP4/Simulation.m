function [ arrayPoint, arrayCouleur ] = Simulation( posObs, no, ni )
    [observateur, cylindre, bloc] = Initialisation(posObs, no, ni);
    limites = CalculLimites(observateur, cylindre, 100, 100);         
    
    arrayPoint = [];
    arrayCouleur = [];
    for m = 1:length(limites.phi_m)
        for n = 1:length(limites.theta_n)
            t = limites.theta_n(n);
            p = limites.phi_m(m);
            u = [sin(t)*cos(p), sin(t)*sin(p), cos(t)]';
            droite = Droite(u, observateur.pos);
            
            [ rejet, point, couleur ] = CalculRayon( droite, bloc, cylindre, observateur );
            if not(rejet)
                arrayPoint = [arrayPoint point];
                arrayCouleur = [arrayCouleur couleur];
            end
            
        end
    end

end

