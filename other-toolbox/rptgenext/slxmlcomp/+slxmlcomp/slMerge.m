% slxmlcomp.slMerge(baseFile, mineFile, theirsFile, targetFile)
%
% Opens Simulink Three-Way Merge, where you can merge the changes in
% baseFile, mineFile and theirsFile, into the targetFile.
%
% baseFile, mineFile and theirsFile must be fully qualified file
% names (for example c:\mydir\mymodel.slx).
%
% Use targetFile to specify the name and location for the target file that
% you will merge changes into (for example c:\mydir\myMergeResult.slx).
%
% If you are using source control in MATLAB or Simulink, you can open
% Three-Way Merge using View Conflicts in the context menu instead.
%
% If you want to customize external source control tools to call Three-Way
% Merge see <a href="matlab:helpview(fullfile(docroot, 'toolbox','simulink','helptargets.map'), 'custommerge');">"Using Three-Way Merge With External Source Control Tools"</a>

% Copyright 2015-2017 The MathWorks, Inc.
function slMerge(varargin)
    % import comparisons.internal.util.APIUtils;
    
    narginchk(4, 4);
    
    try
        [baseFile, mineFile, theirsFile, targetFile] = convertStringsToChars(varargin{:});
        slxmlcomp.internal.link.slMerge(baseFile, mineFile, theirsFile, targetFile, false);
    catch exception
        APIUtils.handleExceptionCallStack(exception);
    end
end
