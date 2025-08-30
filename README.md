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
