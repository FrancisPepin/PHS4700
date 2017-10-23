clear;  %clear la mémoire
clc;    %clear le texte de la console
clf;

DrawTable();
resultat = [];
for i = 1:3
    initialisation();
    for j = 1:4
        trace = Trace();
        [coup, trace] = Simulation(i, Balles(j), Obstacles, trace);
        plot3(trace.position(1,:), trace.position(2,:), trace.position(3,:));

        resultat = [resultat; coup trace.t(end) trace.position(end) trace.vitesse(end)];
    end
    
end



