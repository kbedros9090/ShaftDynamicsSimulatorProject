function params = userinput(app)
% function userinput purpose is to acesses numberic fields from teh app designer.
%
% Inputs: 
%   app (numberic fields)
%       .diameterField
%       .massField
%       .torqueField
%       .frictionField
%       .dampingField
%       .totalTimeField
%       .stepsField
%       .angularPositionField
%
% Outputs: 
%   params (struct)
%       .diameter = shaft diameter (m), 
%       .mass = shaft mass (kg), 
%       .inertia = moment of inertia (kg*m^2), 
%       .appliedTorque = driven torque (N*m), 
%       .friction = constant friction torque (N*m), 
%       .damping = velcoity proportioanl damping (N*m/(rad/s)),
%       .totalTime = total sim time (s), 
%       .stepsTime = time step (s), 
%       .angularPosition = initial angular position (rad),
% 
% Notes: Inerita is based off disc model. 
%
% Author: Kevin Bedros
% Date: 08/29/2025

    % User define values
    
    % Access geometry and mass fields
    params.diameter = app.diameterField.Value;      
    params.mass = app.massField.Value; 

    % Access inertia field
    params.inertia = 0.5 * params.mass * (params.diameter/2)^2;   % disc model inertia

    % Access dynamic fields
    params.appliedTorque = app.torqueField.Value;  
    params.friction = app.frictionField.Value;   
    params.damping = app.dampingField.Value;

    % Access simulation fields
    params.totalTime = app.totalTimeField.Value;  
    params.stepsTime = app.stepsField.Value;       
    params.angularPosition = app.angularPositionField.Value;    

end
