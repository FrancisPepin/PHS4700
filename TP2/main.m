clear;  %clear la mémoire
clc;    %clear le texte de la console
clf;

hold on
axis([0 3 0 1.5]);
%table
x = [0 2.74];
y = [0.76 0.76];
fill1 = fill(x, y, 'r');

a = [1.37 1.37];
b = [0.76 0.9125];
fill2 = fill(a, b, 'r');

for i = 1:3
    initialisation();
    resultat = [];
    for j = 1:4
        trace = Trace();
        [coup, trace] = Simulation(i, Balles(j), Obstacles, trace);
        plot(trace.position(1,:), trace.position(3,:));
        resultat = [resultat; coup];
    end
    disp("Resultat");
    disp(resultat);
end



