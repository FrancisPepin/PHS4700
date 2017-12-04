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
    end
    enumeration
        Rouge(255, 0, 0, 1),
        Cyan(0, 255, 255, 2),
        Vert(0, 255, 0, 3),
        Jaune(255, 255, 0, 4),
        Bleu(0, 0, 255, 5),
        Magenta(255, 0, 255, 6)
    end
end

