classdef Bloc
    %Classe Bloc generique pour construire notre prisme rectangulaire
    
    properties
        Larg,
        Long,
        Haut,
        CM,
        n,      % Indice de refraction du bloc (pareil pour toute les faces)
        Plans   % Vecteur contenant les plans pour chacune des faces (1 a 6)
    end
    
    methods
        function obj = Bloc(larg, long, haut, cm, n)   % Constructeur
            obj.Larg = larg;    % x
            obj.Long = long;    % y
            obj.Haut = haut;    % z
            obj.CM = cm;
            obj.n = n;
            
            
            % On calcule les limites et la position de de chaque sommet
            % par rapport au centre de masse, 
            % le tout pour chaque plan (1 a 6)
            % Les sommets suivent ce patern:
            % 1--2
            % |  |
            % 4--3
            
            % Plan 1
            limites = [cm(1)-larg/2 cm(1)-larg/2; cm(2)-long/2 cm(2)+long/2; cm(3)-haut/2 cm(3)+haut/2];
            sommets = [cm(1)-larg/2 cm(2)-long/2 cm(3)+haut/2; cm(1)-larg/2 cm(2)+long/2 cm(3)+haut/2; cm(1)-larg/2 cm(2)+long/2 cm(3)-haut/2; cm(1)-larg/2 cm(2)-long/2 cm(3)-haut/2]';
            obj.Plans = Plan([-1;0;0], [cm(1)-larg/2;cm(2);cm(3)], limites, sommets);
            
            limites = [cm(1)+larg/2 cm(1)+larg/2; cm(2)-long/2 cm(2)+long/2; cm(3)-haut/2 cm(3)+haut/2];
            sommets = [cm(1)+larg/2 cm(2)-long/2 cm(3)+haut/2; cm(1)+larg/2 cm(2)+long/2 cm(3)+haut/2; cm(1)+larg/2 cm(2)+long/2 cm(3)-haut/2; cm(1)+larg/2 cm(2)-long/2 cm(3)-haut/2]';
            obj.Plans = Plan([1;0;0], [cm(1)+larg/2;cm(2);cm(3)], limites, sommets);
            
            limites = [cm(1)-larg/2 cm(1)+larg/2; cm(2)-long/2 cm(2)-long/2; cm(3)-haut/2 cm(3)+haut/2];
            sommets = [cm(1)-larg/2 cm(2)-long/2 cm(3)+haut/2; cm(1)-larg/2 cm(2)-long/2 cm(3)-haut/2; cm(1)+larg/2 cm(2)-long/2 cm(3)-haut/2; cm(1)+larg/2 cm(2)-long/2 cm(3)+haut/2]';
            obj.Plans = Plan([0;-1;0], [cm(1);cm(2)-long/2;cm(3)], limites, sommets);
            
            limites = [cm(1)-larg/2 cm(1)+larg/2; cm(2)+long/2 cm(2)+long/2; cm(3)-haut/2 cm(3)+haut/2];
            sommets = [cm(1)-larg/2 cm(2)+long/2 cm(3)+haut/2; cm(1)-larg/2 cm(2)+long/2 cm(3)-haut/2; cm(1)+larg/2 cm(2)+long/2 cm(3)-haut/2; cm(1)+larg/2 cm(2)+long/2 cm(3)+haut/2]';
            obj.Plans = Plan([0;1;0], [cm(1);cm(2)+long/2;cm(3)], limites, sommets);
            
            limites = [cm(1)-larg/2 cm(1)+larg/2; cm(2)-long/2 cm(2)+long/2; cm(3)-haut/2 cm(3)-haut/2];
            sommets = [cm(1)-larg/2 cm(2)-long/2 cm(3)-haut/2; cm(1)-larg/2 cm(2)+long/2 cm(3)-haut/2; cm(1)+larg/2 cm(2)+long/2 cm(3)-haut/2; cm(1)+larg/2 cm(2)-long/2 cm(3)-haut/2]';
            obj.Plans = Plan([0;0;-1], [cm(1);cm(2);cm(3)-haut/2], limites, sommets);
            
            limites = [cm(1)-larg/2 cm(1)+larg/2; cm(2)-long/2 cm(2)+long/2; cm(3)+haut/2 cm(3)+haut/2];
            sommets = [cm(1)-larg/2 cm(2)-long/2 cm(3)+haut/2; cm(1)-larg/2 cm(2)+long/2 cm(3)+haut/2; cm(1)+larg/2 cm(2)+long/2 cm(3)+haut/2; cm(1)+larg/2 cm(2)-long/2 cm(3)+haut/2]';
            obj.Plans = Plan([0;0;1], [cm(1);cm(2);cm(3)+haut/2], limites, sommets);
    
        end
    end
end

