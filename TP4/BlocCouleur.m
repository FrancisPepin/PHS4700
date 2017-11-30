classdef BlocCouleur < Bloc
    % Classe BLOCCOULEUR est une classe heritant de la classe Bloc
    % Elle permet d'initialiser chaque face avec la couleur tel que
    % specifier dans le TP
    
    properties
        Faces
    end
    
    methods
        function obj = BlocCouleur(largeur, longueur, hauteur, cm, n)
            obj = obj@Bloc(largeur, longueur, hauteur, cm, n);
            obj.n = n;
            obj.Faces = [Couleur.Rouge, Couleur.Cyan, Couleur.Vert, ...
                         Couleur.Jaune, Couleur.Bleu, Couleur.Magenta];
        end
        
        % Un getter pour aller chercher la couleur associe a la face
        % touchee
        function c = getCouleur(obj, i)
            c = obj.Faces(i);
        end
    end
end

