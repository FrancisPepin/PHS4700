% Les parametres sont les suivants :
% posObs = position de l'observateur
% no     = indice de refraction de l'observateur
% nc     = indice de refraction du cylindre (dans le TP on parle de nb)
function [observateur, cylindre, bloc] = Initialisation(posObs, no, nc)
    observateur = Observateur(posObs, no);
    cylindre = Cylindre(2, 18, [4, 4, 11], nc);
    bloc = BlocCouleur(1, 2, 5, [3.5, 4, 14.5], 0);
end