function results = rotationalFunction(app, params, simResults)
% function rotationalFunction solves dynamics of teh shaft. 
% plots teh angular position and velocity in app Designer.
%
% Inputs: 
%   app
%       .UIAxesMatlab (MATLAB simulation plot), 
%   params (struct)
%       .diameter = shaft diameter (m), 
%       .mass = shaft mass (kg), 
%       .inertia = moment of inertia (kg*m^2), 
%       .appliedTorque = driven torque (N*m), 
%       .friction = constant friction torque (N*m), 
%       .damping = velcoity proportioanl damping (N*m*s/rad),
%       .totalTime = total sim time (s), 
%       .stepsTime = time step (s), 
%       .angularPosition = initial angular position (rad),
%
% Outputs: 
%   results (struct)
%       .theta = angular position trajectory (rad).
%
% Notes: 
%   Angular position is wrapped [0, 2π). 
%   ODE45 is used for numerical integration. 
%   Results are plotted in teh app (UIAxes2).
%   Teh number of rotations relies on intial angular position.
%
% Author: Kevin Bedros
% Date: 08/26/2025

    % Solve dynamics
    
    % Create time vector with increments
    simTime = 0:params.stepsTime:params.totalTime;

    % Initial conditions for teh ODE [theta; omega]
    y0 = [params.angularPosition; 0];    

    % Run ODE solver
    [T, Y] = ode45(@(t,y) rotationalODE(t, y, params), simTime, y0);

    % Extract angular position
    theta = Y(:,1);

    % Wrap angles to teh range [0, 2π)
    theta = mod(theta, 2*pi);   

    % Display number of rotation
    numRotations = unwrap(theta);
    numRotations = (numRotations(end)-params.angularPosition)/ (2*pi);
    app.matlabRotation.Value = floor(numRotations);

    % Graph and store results 
    
    % Plot angular position
    plot(app.UIAxesMatlab, T, theta, 'LineWidth', 2);
    xlabel(app.UIAxesMatlab, 'Time (s)');
    ylabel(app.UIAxesMatlab, 'Angle (rad)');
    title(app.UIAxesMatlab, 'MATLAB Simulation w/ Friction');
    grid(app.UIAxesMatlab, 'on');

    % Store results in struct
    results.theta = theta; % angular positions over time

end



