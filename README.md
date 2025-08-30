# Rotational Shaft Dynamics Simulator

This project investigates the nonlinear dynamics of a rotational steel shaft under motor-applied torque. It compares MATLAB (with friction) and Simulink simulations (without friction). A custom GUI synchronizes MATLAB and Simulink results in a linked animation for direct visual comparison over time. Validation is achieved by examining peak responses in graphs and through numerical comparison. The study demonstrates how friction influences shaft behavior, providing insight for the design and control of rotational systems.

## Features
- Integrated MATLAB and Simulink simulations for frictional and ideal scenarios  
- Interactive GUI to adjust shaft properties, applied torques, and simulation settings  
- Real-time visualization of torque, angular displacement, and friction effects  
- Synchronized graphs and animations of the shaft face, showing full rotations and peak responses  
- Simulation control panel to run, clear, and replay results  
- Data outputs suitable for validation against theoretical predictions  

## Installation / Setup

To run this project successfully, follow these steps:

1. **Clone or download the repository**  
   ```bash
   git clone https://github.com/kbedros9090/ShaftDynamicsSimulatorProject.git
2. Ensure all project files are in the same folder
- MATLAB scripts, Simulink models, and supporting data should be in the same directory  
3. Install required software and toolboxes
- MATLAB (recommended version: R2023a or later)
- Simulink
- MATLAB App Designer
- Simscape (for physical modeling components)
4. Add the project folder to MATLAB path  
-  Open MATLAB → Home → Set Path → Add Folder → Save

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
   - Full rotations are marked in the shaft face animation.  
   - Data can be exported for further analysis or validation.

**Note:** Make sure all MATLAB scripts and Simulink models are in the same folder or added to the MATLAB path, so the GUI can access all components correctly.


## Parameters / Configuration
- inertia – Shaft rotational inertia
- appliedTorque – Torque applied to the shaft
- friction – Friction torque coefficient
- damping – Damping coefficient
- Simulation settings – duration, step size, GUI options

## Validation / Results
Simulation results were validated by comparing peak shaft responses with theoretical predictions. Graphs and GUI animations illustrate how friction and damping affect system behavior. MATLAB simulations (with friction) and Simulink simulations (without friction) can be directly compared for deeper insight.

## Contributing
Contributions are welcome. Please fork the repository and submit a pull request with suggested improvements or additional features.

## License
MIT License

## References / Further Reading

Textbooks on rotational dynamics and torsional systems
MATLAB and Simulink documentation
Simscape physical modeling examples
