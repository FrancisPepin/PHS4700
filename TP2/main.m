clear;  %clear la m�moire
clc;    %clear le texte de la console
clf;

initialisation();

Simulation(1, Balles(1), Obstacles);

Forces.gravite(Balles(1));

