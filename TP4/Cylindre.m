classdef Cylindre
    %CYLINDRE Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        Rayon,
        Hauteur,
        CM,
        n   % Indice de refraction
    end
    
    methods
        function obj = Cylindre(rayon, hauteur, cm, n)
            obj.Rayon = rayon;
            obj.Hauteur = hauteur;
            obj.CM = cm;
            obj.n = n;
        end
    end
end

