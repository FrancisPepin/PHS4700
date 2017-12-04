classdef Plan
    %PLAN Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        Coeff % equation du plan : Coeff * X + K = 0
        K
    end
    
    methods
        function obj = Plan(Coeff, K)
            obj.Coeff = Coeff;
            obj.K = K;
        end
        
        function point = intersection_plan_ligne(obj, droite)
            denom = sum(obj.Coeff .* droite.u);
            if denom == 0
                point = 0;
            else
                t = - (sum(obj.Coeff .* droite.r) + obj.K) / denom;
                point = droite.r + t * droite.u;
            end
        end
    end
    
end

