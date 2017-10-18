Balles = [];

% Commun
Balle = Sphere();
Balle.Masse = 2.74;
Balle.Rayon = 0.0199;

% Balle 1
Balle.Position = [0 0.5 1.1];
Balle.Vitesse = [4 0 0.8]';
Balle.VitesseAngulaire = [0 -70 0]';

Balles = [Balles Balle];

% Balle 2
Balle.Position = [0 0.4 1.14];
Balle.Vitesse = [10 1 0.2]';
Balle.VitesseAngulaire = [0 100 -50]';

Balles = [Balles Balle];

% Balle 3
Balle.Position = [2.74 0.5 1.14];
Balle.Vitesse = [-5 0 0.2]';
Balle.VitesseAngulaire = [0 100 0]';

Balles = [Balles Balle];

% Balle 4
Balle.Position = [0 0.3 1];
Balle.Vitesse = [10 -2 0.2]';
Balle.VitesseAngulaire = [0 10 -100]';

Balles = [Balles Balle];


% Obstacles (table et filet)
Table = [0 0 0.76;
        2.74 0 0.76;
        0 1.525 0.76;
        2.74 1.525 0.76];
    