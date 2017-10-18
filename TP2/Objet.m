classdef (Abstract) Objet < handle
    % Classe abstraite Objet pour les objets de base (table et balle)
    
    properties
        Acceleration
        AccelerationAngulaire
        CentreDeMasse
        Masse
        MasseVolumique
        Position
        Type
        Vitesse
        VitesseAngulaire
        Volume
    end
    
    methods
        function objet = Objet(type)
            objet.CentreDeMasse = 0;
            objet.Masse = 0;
            objet.MasseVolumique = 0;
            objet.Position = [0 0 0]';
            objet.Type = type;
            objet.VitesseAngulaire = [0 0 0]';
            objet.Volume = 0;
        end
        
        function masse = CalculMasse(objet)
            objet.Masse = objet.MasseVolumique * objet.Volume;
            masse = objet.Masse;
        end
    end
    
end

