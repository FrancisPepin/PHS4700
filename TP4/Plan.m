classdef Plan
    % Class PLAN 
    %   Detailed explanation goes here
    
    properties
        Face
        Points
        Parametres
        Limites
        Sommets
    end
    
    methods
        function obj = Plan(face, points, limites, sommets)
            obj.Face = face;
            obj.Points = points;
            obj.Parametres = [face' (-face(1)*points(1) - face(2)*points(2) - face(3)*points(3))];
            obj.Limites = limites;
            obj.Sommets = sommets;
        end
    end
    
end

