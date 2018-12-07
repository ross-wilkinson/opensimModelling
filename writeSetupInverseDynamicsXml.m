% Create generic ID setup structure and write to xml file
clear;clc

% Setup generic path and files
folderPath = 'D:\opensim';

% Create structure for InverseDynamicsTool objects
Tree.ATTRIBUTE.Version = '30000';

% InverseDynamicsTool
Tree.InverseDynamicsTool.ATTRIBUTE.name = 'generic';

% InverseDynamicsTool -> Directories
Tree.InverseDynamicsTool.results_directory = '';
Tree.InverseDynamicsTool.input_directory = '';

% InverseDynamicsTool -> Model file
Tree.InverseDynamicsTool.model_file = '';

% InverseDynamicsTool -> Time range
Tree.InverseDynamicsTool.time_range = [0.005 10];

% InverseDynamicsTool -> Forces to Exclude
Tree.InverseDynamicsTool.forces_to_exclude = 'actuators muscles';

% InverseDynamicsTool -> External Loads File
Tree.InverseDynamicsTool.external_loads_file = '';

% InverseDynamicsTool -> Motion File
Tree.InverseDynamicsTool.coordinates_file = '';

% InverseDynamicsTool -> Filter Cut-Off Frequency
Tree.InverseDynamicsTool.lowpass_cutoff_frequency_for_coordinates = 12;

% InverseDynamicsTool -> Output File
Tree.InverseDynamicsTool.output_gen_force_file = '';

% InverseDynamicsTool -> Report Body Forces
Tree.InverseDynamicsTool.joints_to_report_body_forces = 'All';

% Set inputs for xml_write
fileName = [folderPath '\setupInverseDynamics.xml'];
rootName = 'OpenSimDocument';
Pref.StructItem = false;

xml_write(fileName,Tree,rootName,Pref);

save([folderPath '\structureInverseDynamics.mat'],'Tree')