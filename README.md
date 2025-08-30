# Rotational Shaft Dynamics Simulator

This project investigates the nonlinear dynamics of a rotational steel shaft under motor-applied torque as a multidomain system. It compares MATLAB (with friction) and Simulink simulations (without friction). A custom GUI synchronizes MATLAB and Simulink/Simscape results in a linked animation for direct visual comparison over time. Validation is achieved by examining peak responses in graphs and through numerical comparison. The study demonstrates how friction influences shaft behavior, providing insight for the design and control of rotational systems.

## Features
- Integrated MATLAB and Simulink simulations for frictional and ideal scenarios  
- Interactive and Unifed GUI interface for easy to use environment
- Adjustable shaft properties and torques
- Real-time visualization of torque, angular displacement, and friction effects
- Angular position (θ) graphs showing shaft rotation over time   
- Synchronized and timed graphs and animations of the shaft face
- Full rotation counter to track the number of complete shaft rotations  
- Simulation control panel to run, clear, and replay results  
- Graphs of angular displacement (θ) suitable for validation against analytical models

## Installation / Setup

To run this project successfully, follow these steps:

1. **Clone or download the repository**  
   ```bash
   git clone https://github.com/kbedros9090/ShaftDynamicsSimulatorProject.git
2. Ensure all project files are in the same folder
- MATLAB code and app and Simulink models
3. Install required software and toolboxes
- MATLAB (recommended version: R2023a or later)
- Simulink
- MATLAB App Designer
- Simscape (for physical modeling components)
4. Add the project folder to MATLAB path  
- Open MATLAB → Home → Set Path → Add Folder → Save  
- Make sure each subfolder is linked to the main project folder so all components can access each other correctly.


## Simulink
- The Simulink model represents the shaft as a physical system with torsional inertia, damping, and applied torque.
- It runs without friction to provide a baseline comparison to the MATLAB simulation (which includes friction).
- All inputs, such as applied torque and shaft properties, are linked to the GUI so the user can modify them dynamically.
- The simulation outputs angular displacement over time, which is synchronized with the MATLAB results in the GUI animation.

## Usage

1. **Launch the simulation GUI**  
   - Run `shaftDynamicsSimulator` in MATLAB to open the App Designer interface.  
   - Default parameters are already set, so the simulation can be run immediately.

2. **Adjust simulation parameters at any time**  
   - All shaft properties, applied torques, and simulation settings are fully editable through the GUI.  
   - Parameters can be changed **before or after running the simulation**, without modifying any code.

3. **Run the simulation**  
   - Click the **Run** button to generate graphs of the results.  

4. **Animate the simulation**  
   - Check the **Animate** checkbox to synchronize the shaft face animation with the graphs.  
   - After checking **Animate**, click **Run** again to generate the animated visualization.

5. **Be patient and follow the workflow carefully**  
   - Avoid running multiple times in rapid succession.  
   - Make sure all variables and parameters are compatible; incorrect or mismatched values can cause errors.  
   - Always confirm the settings before clicking **Run** again for animations.

6. **Visualize and analyze results**  
   - Torque, angular displacement, and friction effects are displayed in the graphs.  
   - Full rotations are marked.

## Parameters / Configuration
- inertia – Shaft rotational inertia
- appliedTorque – Torque applied to the shaft
- friction – Friction torque 
- damping – Damping coefficient
- Simulation settings – duration, step size, GUI options

## Validation / Results
Simulation results were validated by comparing peak shaft responses with theoretical predictions. Graphs and GUI animations illustrate how friction and damping affect system behavior. MATLAB simulations (with friction) and Simulink simulations (without friction) can be directly compared for deeper insight.

## Contributing
Contributions are welcome! You can fix bugs, add features or examples, improve documentation or tests, and suggest enhancements.  
To contribute, fork the repo, create a branch, commit your changes, and open a pull request.

## License
MIT License

## References / Further Reading  
- [MATLAB Documentation](https://www.mathworks.com/help/matlab/index.html)  
- [Simulink Documentation](https://www.mathworks.com/help/simulink/index.html)  
- [Simscape Documentation](https://www.mathworks.com/help/simscape/index.html)  
- [MATLAB App Designer Documentation](https://www.mathworks.com/help/matlab/app-designer.html)  
