Balles = Sphere.empty(0,4);

% Commun
Balle = Sphere();
Balle.Masse = 2.74;
Balle.Rayon = 0.0199;

% Balle 1
Balles(1).Masse = 2.74;
Balles(1).Rayon = 0.0199;
Balles(1).Position = [0 0.5 1.1];
Balles(1).Vitesse = [4 0 0.8];
Balles(1).VitesseAngulaire = [0 -70 0];


% Balle 2
Balles(2).Masse = 2.74;
Balles(2).Rayon = 0.0199;
Balles(2).Position = [0 0.4 1.14];
Balles(2).Vitesse = [10 1 0.2];
Balles(2).VitesseAngulaire = [0 100 -50];


% Balle 3
Balles(3).Masse = 2.74;
Balles(3).Rayon = 0.0199;
Balles(3).Position = [2.74 0.5 1.14];
Balles(3).Vitesse = [-5 0 0.2];
Balles(3).VitesseAngulaire = [0 100 0];

% Balle 4
Balles(4).Masse = 2.74;
Balles(4).Rayon = 0.0199;
Balles(4).Position = [0 0.3 1];
Balles(4).Vitesse = [10 -2 0.2];
Balles(4).VitesseAngulaire = [0 10 -100];


% Obstacles (table et filet)
TableJoueur = [0 0 0.76; 1.37 1.525 0.76]';
TableOpposant = [1.37 0 0.76; 2.74 1.525 0.76]';
Filet = [1.37 -0.1525 0.76; 1.37 1.6775 0.76]';
        
Obstacles = [TableJoueur, TableOpposant, Filet];