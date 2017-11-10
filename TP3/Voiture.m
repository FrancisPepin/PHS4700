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
        function voiture = Voiture(m,L,l,h,r,R,v,vAng)
            voiture.m = m;
            voiture.L = L;
            voiture.l = l;
            voiture.h = h;
            voiture.r = r;
            voiture.R = R
            voiture.v = v;
            voiture.vAng = vAng;
        end
    end
    
end

