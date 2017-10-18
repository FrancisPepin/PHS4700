function [coup, tf, rbf, vbf]=Devoir2(option, rbi, vbi, wbi)

initialisation();
Forces.Gravite(Balle);



%{
% Table
ht = 0.76;      % hauteur (z)
Lt = 2.74;      % Longueur (x)
lt = 1.525;     % largeur (y)

% Filet
hf = 0.1525;    % hauteur (z) (doit rajouter la hauter de la table)
Lt = 0;
lt = 1.83;      % largeur (y) du filet (deborde de chaque coté de la table)
df = .1525;     % debordement du filet de chaque coté de la table

% Balle
mb = 2.74;      % masse de la balle
Rb = 0.0199;    % Rayon de la balle
CMb = 0;        % Centre de Masse de la balle (au centre)
vb = [0 0 0];   % vitesse initiale de la balle (ne peut pas > 35 m/s)
wb = [0 0 0];   % vitesse angulaire de la balle (ne peut pas > 940 rads/s)

%%% Forces appliquee
%% Force gravitationnelle
g = [0 0 9.81];
Fg = mb*(g.');  % Force gravitationnelle, (g.') transpose la matrice g

%% Force de frottement visqueux
Ab = pi*(Rb)^2; % Aire efficace de la balle
rho = 1.2;      % Masse volumique de l'air (1.2 kg/m^3)
Cv = 0.5;       % Coefficient de frottement visqueux
Fv = -rho*Cv*Ab*norm(vb)*vb/2;
%% Force de Magnus
Cm = 0.29;      % coefficent de Magnus
Fm = 4*pi*Cm*rho*Rb^3*cross*(wb,vb);
%}

