function [coup, tf, rbf, vbf] = Simulation(option, balle)
%SIMULATION Summary of this function goes here
%   Detailed explanation goes here

    pas = 0.01;
    position = SEDRK4t0([pas, [balle.Vitesse balle.Position]], 

end

