function g = SansF(q0,t,voiture)
    %Fonction g utilisee avec RK4 pour le cas avec frottement.
    g = horzcat(0, 0, q0(1:2), 0, q0(3)); 
end

