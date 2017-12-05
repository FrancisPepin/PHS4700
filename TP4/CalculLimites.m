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
            denominateur_theta = cylindre.hauteur/2-observateur.pos(3);
            
            theta_moins1 = atan((numerateur_theta - cylindre.rayon)/(cylindre.centre(3)+ denominateur_theta));
            theta_plus1 = atan((numerateur_theta - cylindre.rayon)/(cylindre.centre(3)- denominateur_theta));
            
            theta_moins2 = atan((numerateur_theta + cylindre.rayon)/(cylindre.centre(3)+ denominateur_theta));
            theta_plus2 = atan((numerateur_theta + cylindre.rayon)/(cylindre.centre(3)- denominateur_theta));
            
            obj.theta_moins = min(theta_moins1, theta_moins2);
            obj.theta_plus = max(theta_plus1, theta_plus2);
            
            
            numerateur_phi = cylindre.centre(2) - cos(pi/4)*cylindre.rayon - observateur.pos(2);
            denominateur_phi = cos(pi/4)*cylindre.rayon - observateur.pos(1);
            
            obj.phi_moins = atan(numerateur_phi / (cylindre.centre(1) + denominateur_phi));
            obj.phi_plus = atan(numerateur_phi / (cylindre.centre(1) - denominateur_phi));
            
            
            obj.theta_n = CalculTheta(obj, N);
            obj.phi_m = CalculPhi(obj, M);
        end
        
        function theta_n = CalculTheta(limites, N)
            array = 1:N;
            out = zeros(1, N);
            for i = array
                theta = limites.theta_moins + ((limites.theta_plus - limites.theta_moins)/(N - 1)) * (i - 1);
                out(i) = theta;
            end
            theta_n = out;
        end
        
        function phi_m = CalculPhi(limites, M)
            array = 1:M;
            out = zeros(1, M);
            for i = array
                phi = limites.phi_moins+ ((limites.phi_plus - limites.phi_moins)/(M - 1)) * (i - 1);
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

