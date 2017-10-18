classdef Sphere < Objet & handle
    % Objet de type sphere
    
    properties
        Rayon
    end
    
    methods
        function objet = Sphere()
            objet = objet@Objet(sphere);
            objet.Rayon = 0;
        end
        
        function masse = CalculMasse(objet)
            masse = CalculMasse@Objet(objet);
        end
        
        function volume = Volume(objet)
            objet.Volume = 4 * pi * objet.Rayon^3 / 3;
            volume = objet.volume;
        end
        
    end
    
end

