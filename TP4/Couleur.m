classdef Couleur
    % Classe COULEUR pour stocker les 6 couleurs necessaire au TP
    % https://www.mathworks.com/help/matlab/matlab_oop/enumerations.html
    
    properties
        R,
        V,
        B
    end
    methods
        function obj = Couleur(r, v, b)
            obj.R = r;
            obj.V = v;
            obj.B = b;
        end
    end
    enumeration
        Rouge([255, 0, 0]),
        Cyan([0, 255, 255]),
        Vert([0, 255, 0]),
        Jaune([255, 255, 0]),
        Bleu([0, 0, 255]),
        Magenta([255, 0, 255])
    end
end

