% Startup function for ReportGenerator Version 5

close all;
clearvars;

addpath(genpath('./Major-programs'));
addpath(genpath('./Nifti-toolbox'));
addpath(genpath('./GUI-Layout-Toolbox'));
addpath(genpath('./other-toolbox/export_fig'));
addpath(genpath('./freesurfer-toolbox'));

Rp = ReportPreviewer();