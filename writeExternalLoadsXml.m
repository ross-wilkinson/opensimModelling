% Create generic ID setup structure and write to xml file
clear;clc

% Setup generic path and files
folderPath = 'D:\opensim';

% Create structure for ExternalLoad objects
Tree.ATTRIBUTE.Version = '30000';

Tree.ExternalLoads.ATTRIBUTE.name = 'generic';

% Create reference cells to loop through for each external force
externalForceList = {'forceRight','forceLeft'};
bodyList = {'calcn_r','calcn_l'};
forceReferenceFrameList = {'ground','ground'};
pointReferenceFrameList = {'ground','ground'};
forceIdentifierList = {'forceRight','forceLeft'};
pointIdentifierList = {'pointRight','pointLeft'};

for i = 1:numel(externalForceList)
    % Edit External Force objects
    Tree.ExternalLoads.objects.ExternalForce(i).ATTRIBUTE.name = externalForceList{i};
    % Enable external force{i}
    Tree.ExternalLoads.objects.ExternalForce(i).isDisabled = 'false';
    % Apply force to body
    Tree.ExternalLoads.objects.ExternalForce(i).applied_to_body = bodyList{i};
    % Exprees force vector in body
    Tree.ExternalLoads.objects.ExternalForce(i).force_expressed_in_body = forceReferenceFrameList{i};
    % Express force location in body
    Tree.ExternalLoads.objects.ExternalForce(i).point_expressed_in_body = pointReferenceFrameList{i};
    % Force ID in data source file
    Tree.ExternalLoads.objects.ExternalForce(i).force_identifier = forceIdentifierList{i};
    % Point ID in data source file
    Tree.ExternalLoads.objects.ExternalForce(i).point_identifier = pointIdentifierList{i};
    % Torque ID in data source file
    Tree.ExternalLoads.objects.ExternalForce(i).torque_identifier = '';
    % Data Source
    Tree.ExternalLoads.objects.ExternalForce(i).data_source_name = '';
end

% Force File
Tree.ExternalLoads.datafile = '';

% Motion File
Tree.ExternalLoads.external_loads_model_kinematics_file = '';

% Filter
Tree.ExternalLoads.lowpass_cutoff_frequency_for_load_kinematics = -1;

% Set inputs for xml_write
fileName = [folderPath '\setupExternalLoads.xml'];
rootName = 'OpenSimDocument';
Pref.StructItem = false;

xml_write(fileName,Tree,rootName,Pref);

save([folderPath '\structureExternalLoads.mat'],'Tree')