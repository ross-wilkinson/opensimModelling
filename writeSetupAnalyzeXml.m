% Write generic muscle analysis setup file for Analyze Tool in OpenSim 3.3
clear;clc

% Setup generic path and files
folderPath = 'D:\opensim';

% Create structure for InverseDynamicsTool objects
Tree.ATTRIBUTE.Version = '30000';

% AnalyzeTool
Tree.AnalyzeTool.ATTRIBUTE.name = 'generic';

% Model File
Tree.AnalyzeTool.model_file = '';

% Replace force set
Tree.AnalyzeTool.replace_force_set = 'false';

% Force Set File
Tree.AnalyzeTool.force_set_files = '';

% Results Directory
Tree.AnalyzeTool.results_directory = '';

% Output Precision
Tree.AnalyzeTool.output_precision = 8;

% Initial Time
Tree.AnalyzeTool.initial_time = 0.005;

% Final Time
Tree.AnalyzeTool.final_time = 9.995;

% Solve for equilibrium
Tree.AnalyzeTool.solve_for_equilibrium_for_auxiliary_states = 'false';

% Max. number of integrator steps
Tree.AnalyzeTool.maximum_number_of_integrator_steps = 20000;

% Max. integrator step size
Tree.AnalyzeTool.maximum_integrator_step_size = 1;

% Min. integrator step size
Tree.AnalyzeTool.minimum_integrator_step_size = 1e-008;

% Integrator error tolerance
Tree.AnalyzeTool.integrator_error_tolerance = 1e-005;

% AnalayzeTool.AnalysisSet
Tree.AnalyzeTool.AnalysisSet.ATTRIBUTE.name = 'Analyses';

% objects.PointKinematics
Tree.AnalyzeTool.AnalysisSet.objects.PointKinematics.ATTRIBUTE.name = 'PointKinematics';

% Switch
Tree.AnalyzeTool.AnalysisSet.objects.PointKinematics.on = 'false';

% Start Time
Tree.AnalyzeTool.AnalysisSet.objects.PointKinematics.start_time = 0.005;

% End time
Tree.AnalyzeTool.AnalysisSet.objects.PointKinematics.end_time = 9.995;

% Step interval
Tree.AnalyzeTool.AnalysisSet.objects.PointKinematics.step_interval = 1;

% In degrees
Tree.AnalyzeTool.AnalysisSet.objects.PointKinematics.in_degrees = 'true';

% Bodies
Tree.AnalyzeTool.AnalysisSet.objects.PointKinematics.body_name = '';

% Relative to ground
Tree.AnalyzeTool.AnalysisSet.objects.PointKinematics.relative_to_body_name = 'ground';

% Point name
Tree.AnalyzeTool.AnalysisSet.objects.PointKinematics.point_name = '';

% Point location on body
Tree.AnalyzeTool.AnalysisSet.objects.PointKinematics.point = [0 0 0];

% objects.MuscleAnalysis
Tree.AnalyzeTool.AnalysisSet.objects.MuscleAnalysis.ATTRIBUTE.name = 'MuscleAnalysis';

% Switch
Tree.AnalyzeTool.AnalysisSet.objects.MuscleAnalysis.on = 'false';

% Start Time
Tree.AnalyzeTool.AnalysisSet.objects.MuscleAnalysis.start_time = 0.005;

% End time
Tree.AnalyzeTool.AnalysisSet.objects.MuscleAnalysis.end_time = 9.995;

% Step interval
Tree.AnalyzeTool.AnalysisSet.objects.MuscleAnalysis.step_interval = 1;

% In degrees
Tree.AnalyzeTool.AnalysisSet.objects.MuscleAnalysis.in_degrees = 'true';

% Muscle List
Tree.AnalyzeTool.AnalysisSet.objects.MuscleAnalysis.muscle_list = 'all';

% Moment Arm List
Tree.AnalyzeTool.AnalysisSet.objects.MuscleAnalysis.moment_arm_coordinate_list = 'all';

% Compute moments
Tree.AnalyzeTool.AnalysisSet.objects.MuscleAnalysis.compute_moments = 'true';

% AnalysisSet.BodyKinematics
Tree.AnalyzeTool.AnalysisSet.objects.BodyKinematics.ATTRIBUTE.name = 'BodyKinematics';

% Switch
Tree.AnalyzeTool.AnalysisSet.objects.BodyKinematics.on = 'false';

% Start Time
Tree.AnalyzeTool.AnalysisSet.objects.BodyKinematics.start_time = 0.005;

% End time
Tree.AnalyzeTool.AnalysisSet.objects.BodyKinematics.end_time = 9.995;

% Step interval
Tree.AnalyzeTool.AnalysisSet.objects.BodyKinematics.step_interval = 1;

% In degrees
Tree.AnalyzeTool.AnalysisSet.objects.BodyKinematics.in_degrees = 'true';

% Bodies
Tree.AnalyzeTool.AnalysisSet.objects.BodyKinematics.bodies = 'all';

% Express in body local frame
Tree.AnalyzeTool.AnalysisSet.objects.BodyKinematics.express_results_in_body_local_frame = 'false';

% Controller Set
Tree.AnalyzeTool.ControllerSet.ATTRIBUTE.name = 'Controllers';

% External Loads File (.xml)
Tree.AnalyzeTool.external_loads_file = '';

% States File
Tree.AnalyzeTool.states_file = '';

% Coordinate File (.mot)
Tree.AnalyzeTool.coordinates_file = '';

% Speeds File
Tree.AnalyzeTool.speeds_file = '';

% Filter
Tree.AnalyzeTool.lowpass_cutoff_frequency_for_coodinates = 12;

% Set inputs for xml_write
fileName = [folderPath '\setupAnalyze.xml'];
rootName = 'OpenSimDocument';
Pref.StructItem = false;

% Write to xmlfile
xml_write(fileName,Tree,rootName,Pref);

% Save structure
save([folderPath '\structureAnalyze.mat'],'Tree')