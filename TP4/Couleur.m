classdef Couleur
    % Classe COULEUR pour stocker les 6 couleurs necessaire au TP
    % https://www.mathworks.com/help/matlab/matlab_oop/enumerations.html
    
    properties
        R,
        V,
        B,
        face
    end
    methods
        function obj = Couleur(r, v, b, face)
            obj.R = r;
            obj.V = v;
            obj.B = b;
            obj.face = face;
        end
        
        function col = getCouleur(obj)
            col = [obj.R obj.V obj.B];
        end
    end
    enumeration
        Rouge(1, 0, 0, 1),
        Cyan(0, 1, 1, 2),
        Vert(0, 1, 0, 3),
        Jaune(1, 1, 0, 4),
        Bleu(0, 0, 1, 5),
        Magenta(1, 0, 1, 6)
    end
end

