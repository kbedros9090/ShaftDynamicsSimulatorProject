function animateShaftFace(app, params, results, simResults)
% animate teh end view of a rotating shaft with a pointer. 
% simultaneously animate teh corresponding MATLAB and Simulink plots. 
% 
% INPUTS: 
%   app (Plotting) 
%       .UIAxesAnimation (shaft face animation), 
%       .UIAxesMatlab (MATLAB simulation plot), 
%       .UIAxesSimulink (Simulink simulation plot). 
%   results (struct) 
%       .theta = angular position Matlab (rad) 
%   params (struct) 
%       .totalTime = total sim time (s), 
%       .stepsTime = time step (s). 
%   simResults (struct)
%       .data = angular position Simulink
%       .time
% 
% Notes: 
%   Shaft pointers are red for MATLAB and green for Simulink results.  
%   Animation is 30 fps for smoothness. 
% 
% Author: Kevin Bedros 
% Date: 08/26/2025

    % Define variables for animation 
    
    % Create time vector with increments
    tspan  = 0:params.stepsTime:params.totalTime;  % time vector for animation                 
    
    % Wrap MATLAB angles to [0, 2π)
    theta  = mod(results.theta, 2*pi); 
    
    % Initial setup
    
    % Create Animation Axes
    axis(app.UIAxesAnimation, [-1.2 1.2 -1.2 1.2]);
    axis(app.UIAxesAnimation, 'equal');
    hold(app.UIAxesAnimation, 'on');
    
    % Hide axes lines and ticks for cleaner animation
    app.UIAxesAnimation.XColor = 'none';
    app.UIAxesAnimation.YColor = 'none';
    app.UIAxesAnimation.XTick  = [];
    app.UIAxesAnimation.YTick  = [];
    app.UIAxesAnimation.Box    = 'off';
    title(app.UIAxesAnimation, 'Animation of shaft face');
    
    % Draw shaft disk
    rectangle(app.UIAxesAnimation, ...
              'Position', [-1 -1 2 2], ...
              'Curvature', [1 1], ...
              'FaceColor', [0.8 0.8 0.8]);
    
    % Initial pointerMatlabfor MATLAB shaft animation 
    pointerMatlab = plot(app.UIAxesAnimation, [0 cos(theta(1))], ...
                         [0 sin(theta(1))], 'r', 'LineWidth', 2);
    
    % Initial pointerMatlabfor Simulink shaft animation 
    pointerSimulink = plot(app.UIAxesAnimation, [0 cos(simResults.data(1))], ...
                           [0 sin(simResults.data(1))], 'g', 'LineWidth', 2);
    
    % Plot initial dot for MATLAB graph
    hold(app.UIAxesMatlab, 'on'); % holds old data
    dotMatlab  = plot(app.UIAxesMatlab, tspan(1), theta(1), 'ro', 'MarkerFaceColor','r');
    
    % Plot initial dot for Simulink graph
    hold(app.UIAxesSimulink, 'on'); % holds old data
    dotSimulink = plot(app.UIAxesSimulink, tspan(1), simResults.data(1), 'go', 'MarkerFaceColor','g');
    
    % Setup Timer for animation

    idx = 1;  % frame index
    N   = length(tspan) / 24 / params.totalTime;  % scaling factor for frames
    
    t = timer('ExecutionMode','fixedRate', ...
              'Period', 1/30, ...                  % ~30 FPS
              'TasksToExecute', 24*params.totalTime, ...
              'TimerFcn', @(~,~) updateFrame());   % nested frame update function

    % Callback function for timer
    function updateFrame()

        % Stop timer when last frame is reached
        if idx > 24*params.totalTime
            stop(t);   
            return;
        end
    
        % Determine which frame to display
        mult = round(idx * N);
    
        % Update pointer for MATLAB shaft animation
        set(pointerMatlab, ...
            'XData', [0 cos(results.theta(mult))], ...
            'YData', [0 sin(results.theta(mult))]);
    
        % Update pointer for Simulink shaft animation
        set(pointerSimulink, ...
            'XData', [0 cos(simResults.data(mult))], ...
            'YData', [0 sin(simResults.data(mult))]);
    
        % Update dot on MATLAB graph
        set(dotMatlab, ...
            'XData', tspan(mult), ...
            'YData', results.theta(mult));
    
        % Update dot on Simulink graph
        set(dotSimulink, ...
            'XData', simResults.time(mult), ...
            'YData', simResults.data(mult));
    
        idx = idx + 1;

        % update teh figures
        drawnow; 
    end

    % Start tiemr
    start(t);
end






