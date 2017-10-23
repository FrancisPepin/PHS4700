classdef Trace < handle
    %Output class to keep every vector position and speed for each t
    
    properties
        t
        position
        vitesse
    end
    
    methods
        function objet = Trace()
            objet.t = [];
            objet.position = [];
            objet.vitesse = [];
        end
        function a = Ajouter(objet, t, pos, vit)
            objet.t = [objet.t t];
            objet.position = [objet.position pos'];
            objet.vitesse = [objet.vitesse vit'];
            a = objet;
        end
    end    
end

