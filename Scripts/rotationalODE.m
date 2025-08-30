function dydt = rotationalODE(~, Y, params)
% function rotationalODE defines teh dynamics of a simple disc. 
%
% Inputs:
%   Y [theta, omega] (state vector)
%       theta = angular position (rad), 
%       omega = angular velocity (rad/s).
%   params (struct)
%       .inertia = moment of inertia (kg*m^2), 
%       .appliedTorque = driven torque (N*m), 
%       .friction = constant friction torque (N*m).
%       .damping = velcoity proportioanl damping (N*m*s/rad),
%   
% Outputs:
%   dydt [dtheta/dt, domega/dt] (state vector)
%       dtheta/dt = angular velocity (rad/s) 
%       domega/dt = angular acceleration (rad/s^2)
%
% Notes: 
%   Implements stick–slip behavior.
%   When omega ≠ 0, friction opposes motion.  
%   When omega ≈ 0, static friction resists until applied torque exceeds Friction.  
%  
%
% Author: Kevin Bedros
% Date: 08/26/2025

    % Define dynamics for shaft

    % Extract state variables
    theta = Y(1);
    omega = Y(2);

    % Extract parameters
    inertia = params.inertia;
    appliedTorque = params.appliedTorque;
    friction = params.friction;
    damping = params.damping;

    % Calculations

    % Torque friction
    eps = 1e-6; % small threshold for zero velocity
    if abs(omega) > eps
        % dynamic (kinetic) friction opposes motion
        torqueFriction = -friction * sign(omega);
    else
        % static region: friction opposes applied torque up to the Coulomb limit
        if abs(appliedTorque) <= friction
            torqueFriction = -appliedTorque;  % perfectly cancels applied torque -> stick
        else
            % applied exceeds static limit => motion begins, friction at limit
            torqueFriction = -friction * sign(appliedTorque);
        end
    end

    % Viscous damping torque
    torqueDamping = -damping * omega; 

    % Net Torque
    torqueNet = appliedTorque + torqueFriction + torqueDamping;

    % Angular acceleration
    alpha = torqueNet / inertia; 

    % Return derivatives
    dydt = zeros(2,1);
    dydt(1) = omega;  % dtheta/dt
    dydt(2) = alpha;  % domega/dt

end
