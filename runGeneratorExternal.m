function [reportFilePath] = runGeneratorExternal(projectPath)

if ~isdeployed
    path=fileparts(mfilename('fullpath'));
    addpath(genpath(fullfile(path,'Major-programs')));
    addpath(genpath(fullfile(path,'Nifti-toolbox')));
    addpath(genpath(fullfile(path,'GUI-Layout-Toolbox')));
    addpath(genpath(fullfile(path,'other-toolbox/export_fig')));
    addpath(genpath(fullfile(path,'freesurfer-toolbox')));
end

    Rp = ReportPreviewer(projectPath);
    bar = [];
    if(exist('UnifiedProgressBar','file') == 2) %if unified progressbar exists use it - for compatability with VERA
        bar=UnifiedProgressBar(Rp.gui,true); %supercede current bars
    end
    try
    uiwait(Rp.gui);
    if ~isempty(bar)
        bar.Detach();
    end
    reportFilePath=Rp.OutPath;
    catch e
        if ~isempty(bar)
            bar.Detach();
        end
        rethrow(e);
    end
end

