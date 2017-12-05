function [xi, yi, zi, face] = Devoir4(nout, nin, poso)
    
    hold on
    [arrayPoint, arrayCouleur] = Simulation(poso, nout, nin);
    
    if not(isempty(arrayPoint))
        xi = arrayPoint(1,:);
        yi = arrayPoint(2,:);
        zi = arrayPoint(3,:);
        face = arrayfun(@(C) C.face, arrayCouleur);
        couleur = cell2mat(arrayfun(@(C) getCouleur(C), arrayCouleur, 'un',0)');
    else
        xi = [];
        yi = [];
        zi = [];
        face = [];
        couleur = [];
    end
    
    scatter3(poso(1), poso(2), poso(3), 'MarkerEdgeColor','k', 'MarkerFaceColor', [0 0 0]);
    scatter3(xi, yi, zi, 16, couleur, 'filled');
    
    hold off
end
