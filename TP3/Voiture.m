classdef Voiture
    %UNTITLED6 Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        m
        L
        l
        h
        r
        rAng
        v
        vAng
    end
    
    methods
        function voiture = Voiture(m,L,l,h,r,rAng,v,vAng)
            voiture.m = m;
            voiture.L = L;
            voiture.l = l;
            voiture.h = h;
            voiture.r = r;
            voiture.rAng = rAng
            voiture.v = v;
            voiture.vAng = vAng;
            %definir plans et coins
        end
        
        function plans = getPlans()
          %retourne une matrice dont chaque ligne est un vecteur correspondant a [p1 p2 q1] (qui sont eux-memes des vecteurs)
        end
        
        function coins = getCoins()
          %retourne une matrice dont les lignes sont les vecteurs correspondant aux 4 coins du solide situes a z=0.
        end
    end
    
end

