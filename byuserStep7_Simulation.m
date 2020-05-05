function byuserStep7_Simulation()
close all;

%Create user interface object for SRD
SRD = SRDuserinterface;

ExternalForcesEngine = SRD.GetExternalForcesEngine();

%Load SimulationEngine and set up the simulation parameters
SimulationEngine = SRD.GetSimulationEngine();

a = 10;
w = 10;
    function f = GetExternalForces()
        SensorData = SimulationEngine.SensorHandler.ReadCurrentData;
        t = SensorData.t;
        
        f = [a*sin(w*t); 
             a*sin(w*t + pi/2)];
    end

%Can use 'Euler', 'Taylor', 'Runge', 'Implicit Euler', 'DAE Taylor', 'DAE Runge';
SimulationEngine.CustomSolverType = 'User-provided';
    function OutputStructure = User_provided_solver()
        
        f = GetExternalForces();
        
        ExternalForcesEngine.UpdateModel(f, SimulationEngine.ModelHandler);
        
        OutputStructure = SimulationEngine.Solver_TaylorUpdate();
    end

SimulationEngine.User_provided_solver = @User_provided_solver;


SimulationEngine.IC.q = SimulationEngine.IC.q + rand(3, 1)*0.5;
% SimulationEngine.IC.v = SimulationEngine.IC.v + rand(3, 1)*0.5;
SimulationEngine.IC.v = zeros(3, 1);


%Load InverseKinematicsEngine
% InverseKinematicsEngine = SRD.GetInverseKinematicsEngine();

SimulationEngine.Time = 5;

ControlInput = SimulationEngine.GetPlugInput("Constant_ControlInput", 'value_q', [1.2; -1; 1.2]);
% ControlInput = SimulationEngine.GetPlugInput("Constant_IC_ControlInput");


%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%
ControllerWrapper = SRDControllerWrapper();

Kp = eye(SimulationEngine.dof) * 1000;
Kd = eye(SimulationEngine.dof) * 200;

    function PDcontroller(~, ~)
        
        SensorData = SimulationEngine.SensorHandler.ReadCurrentData;
        
        e = SensorData.desired_q - SensorData.q;
        de = SensorData.desired_v - SensorData.v;
        
        ControllerWrapper.u = Kp*e + Kd*de;
    end

ControllerWrapper.Controller = @PDcontroller;

%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%


%     function Tester(~, ~)      
%         SensorData = SimulationEngine.SensorHandler.ReadCurrentData;
%         rC = g_rC(SensorData.q);       
%     end


%Simulate
tic
Res = SimulationEngine.Simulation(ControlInput, ControllerWrapper);
%Can use .Simulation() and .SimulationStateSpace()
toc

Count = size(Res.SimulationOutput.Position, 1);
Res.rC = zeros(Count, 2);
for i = 1:Count
    rC = g_rC(Res.SimulationOutput.Position(i, :)');
    Res.rC(i, 1) = rC(1);
    Res.rC(i, 2) = rC(3);
end

figure;
plot(Res.SimulationOutput.Time, Res.rC);


%Plot the output
figure_handle = SimulationEngine.PlotSimulationResults(Res.SimulationOutput, 'P, dP; V, U');

%If need - animate the resulting motion
ToAnimate = true;
if ToAnimate
    Animation = SRDAnimation();
    Animation.Animation_Accelerator = 100;
    Animation.Animate(Res.SimulationOutput.Position);
end
end