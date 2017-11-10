function [F] = Frottement(v,m)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
    g = 9.8;
    if norm(v) > 50
        mu = 0.075;
    else
        mu = 0.15*(1-norm(v)/100);
    end
    
    F = -1*mu*m*g/norm(v)*v;
    
end

