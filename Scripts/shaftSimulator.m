function simResults = shaftSimulator(app, params)
% function shaftSimulator defines and runs teh simulink model.
% extracts angular position results.
% plots teh angular position and velocity in app Designer.
%
% Inputs:
%   app
%       .UIAxesSimulink
%   params (struct)
%       .inertia = moment of inertia (kg*m^2), 
%       .appliedTorque = driven torque (N*m), 
%       .damping = velcoity proportioanl damping (N*m*s/rad),
%       .totalTime = total sim time (s), 
%       .stepsTime = time step (s), 
%       .angularPosition = initial angular position (rad). 
%   
% Outputs:
%   simResults (struct)
%       .data
%       .time
%
% Notes: 
%   Requires 'rotationMotionSimulation' Simulink model.
%   Outport block used to get data. 
%   Parameters are pushed to teh base workspace as SimulinkGlobals.
%   Teh number of rotations relies on intial angular position.
%
% Author: Kevin Bedros
% Date: 08/26/2025

    % Define teh simulink model

    % Create Simulink tunable parameters
    inertia = Simulink.Parameter;
    torque = Simulink.Parameter;
    damping = Simulink.Parameter;
    time = Simulink.Parameter;
    step = Simulink.Parameter;
    initial = Simulink.Parameter;
       
      
    % Assign Values from params    
    inertia.Value = params.inertia;
    torque.Value = params.appliedTorque;
    damping.Value = params.damping;
    time.Value = params.totalTime;
    step.Value = params.stepsTime;
    initial.Value = params.angularPosition;
    
    % Set storage class
    inertia.CoderInfo.StorageClass = 'SimulinkGlobal';
    torque.CoderInfo.StorageClass = 'SimulinkGlobal';
    damping.CoderInfo.StorageClass = 'SimulinkGlobal';
    time.CoderInfo.StorageClass = 'SimulinkGlobal';
    step.CoderInfo.StorageClass = 'SimulinkGlobal';
    initial.CoderInfo.StorageClass = 'SimulinkGlobal';

    
    % Assign to base Workspace
    assignin('base','inertia', inertia);
    assignin('base','torque', torque);
    assignin('base','damping', damping);
    assignin('base','time', time);
    assignin('base','step', step);
    assignin('base','initial', initial);
    
    % Run Simulink Model
    simOut = sim('rotationalMotionSimulation', ...
                 'StopTime', num2str(params.totalTime), ...
                 'ReturnWorkspaceOutputs','on');
    
    % Get teh Outport Dataset 
    thetaDS = simOut.get('yout');  
    
    % Check and assign output Simulink returned
    if isa(thetaDS, 'timeseries')
        % Output is a timeseries object (single signal)
        time = thetaDS.Time;
        data = thetaDS.Data;
    elseif isa(thetaDS, 'Simulink.SimulationData.Dataset')
        % Output is a Dataset object (can contain multiple signals)
        % Extract teh first element of teh Dataset (teh signal)
        ts = thetaDS.getElement(1).Values;
        time = ts.Time;
        data = ts.Data;
    end 
        
    % Plot 
    plot(app.UIAxesSimulink, time, data, 'LineWidth', 2);
    xlabel(app.UIAxesSimulink, 'Time (s)');
    ylabel(app.UIAxesSimulink, 'Angle (rad)');
    title(app.UIAxesSimulink, 'Simulink Simulation w/o Friction');
    grid(app.UIAxesSimulink, 'on');

    % Display number of rotation
    numRotations = unwrap(data);
    numRotations = (numRotations(end) - params.angularPosition) / (2*pi);
    app.simulinkRotation.Value = floor(numRotations);

    % Save results
    simResults.data = data;
    simResults.time = time;

end
