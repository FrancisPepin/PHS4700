classdef Affichage < handle
    %Output class to keep every vector position and speed for each t
    
    properties
        t
        x
        y
        z
        vx
        vy
        vz
    end
    
    methods
        function objet = Affichage()
            objet.t = [];
            objet.x = [];
            objet.y = [];
            objet.z = [];
            objet.vx = [];
            objet.vy = [];
            objet.vz = [];
        end
        function a = Ajouter(objet, t, x, y, z, vx, vy, vz)
            objet.t = [objet.t t];
            objet.x = [objet.x x];
            objet.y = [objet.y y];
            objet.z = [objet.z z];
            objet.vx = [objet.vx vx];
            objet.vy = [objet.vy vy];
            objet.vz = [objet.vz vz];
            a = objet;
        end
    end    
end

