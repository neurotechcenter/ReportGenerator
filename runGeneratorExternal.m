function [reportFilePath] = runGeneratorExternal(projectPath)

    path=fileparts(mfilename('fullpath'));
    addpath(genpath(fullfile(path,'Major-programs')));
    addpath(genpath(fullfile(path,'Nifti-toolbox')));
    addpath(genpath(fullfile(path,'GUI Layout Toolbox')));
    addpath(genpath(fullfile(path,'other-toolbox/export_fig')));
    addpath(genpath(fullfile(path,'freesurfer-toolbox')));

    Rp = ReportPreviewer(projectPath);
    uiwait(Rp.gui);
    reportFilePath=Rp.OutPath;
end

