classdef CalculLimites
    %CALCULLIMITES Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        phi_plus
        phi_moins
        theta_plus
        theta_moins
        phi_m
        theta_n
    end
    
    methods
        function obj = CalculLimites(observateur, cylindre, N, M)
            numerateur_theta = norm(cylindre.centre(1:2) - observateur.pos(1:2));
            denominateur_theta = cylindre.centre(3)-observateur.pos(3);
            
            theta_moins1 = atan2((numerateur_theta - cylindre.rayon), (denominateur_theta - cylindre.hauteur/2));
            theta_plus1 = atan2((numerateur_theta - cylindre.rayon), (denominateur_theta + cylindre.hauteur/2));
            
            theta_moins2 = atan2((numerateur_theta + cylindre.rayon), (denominateur_theta - cylindre.hauteur/2));
            theta_plus2 = atan2((numerateur_theta + cylindre.rayon), (denominateur_theta + cylindre.hauteur/2));
            
            obj.theta_moins = max(theta_moins1, theta_moins2);
            obj.theta_plus = min(theta_plus1, theta_plus2);
            
            %% phi
            
            OC = cylindre.centre(1:2) - observateur.pos(1:2);
            uOC = OC / norm(OC);
            uTangent = [uOC(2); -uOC(1)];
            
            R = cylindre.rayon;
            p = OC - R * uOC;
            p1 = p + R * uTangent;
            p2 = p - R * uTangent;
            
            phi1 = atan2(p1(2), p1(1));
            phi2 = atan2(p2(2), p2(1));
            
            obj.phi_moins = min(phi1, phi2);
            obj.phi_plus= max(phi1, phi2);
            
%             numerateur_phi = cylindre.centre(2) - observateur.pos(2);
%             denominateur_phi = cylindre.centre(1) - observateur.pos(1);
%             
%             obj.phi_moins = atan2(numerateur_phi - cos(pi/4)*cylindre.rayon  , (denominateur_phi + cos(pi/4)*cylindre.rayon));
%             obj.phi_plus = atan2(numerateur_phi + cos(pi/4)*cylindre.rayon  , (denominateur_phi - cos(pi/4)*cylindre.rayon));
            
            
            obj.theta_n = CalculTheta(obj, N);
            obj.phi_m = CalculPhi(obj, M);
        end
        
        function theta_n = CalculTheta(limites, N)
            out = zeros(1, N);
            for i = 1:N
                theta = limites.theta_moins + ((limites.theta_plus - limites.theta_moins)/(N - 1)) * (i - 1);
                out(i) = theta;
            end
            theta_n = out;
        end
        
        function phi_m = CalculPhi(limites, M)
            out = zeros(1, M);
            for i = 1:M
                phi = limites.phi_moins + ((limites.phi_plus - limites.phi_moins)/(M - 1)) * (i - 1);
                out(i) = phi;
            end
            phi_m = out;
        end
        
        function liste = GenererRayons(limites, observateur)
            liste = [];
            
            for m = 1:length(limites.phi_m)
                for n = 1:length(limites.theta_n)
                    t = limites.theta_n(n);
                    p = limites.phi_m(m);
                    u = [sin(t)*cos(p), sin(t)*sin(p), cos(t)]';
                    liste = [ liste Droite(u, observateur.pos)];
                end
            end
        end
    end
    
end

