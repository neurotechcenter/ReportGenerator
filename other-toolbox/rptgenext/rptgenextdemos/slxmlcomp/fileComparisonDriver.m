function fileComparisonDriver(base, mine)
%fileComparisonDriver
%
% 
% Use this function to call the MATLAB Comparison Tool from external tools 
% such as the diff function of Subversion.  If you have Simulink Report 
% Generator from R2008b+ or later installed, then the XML Comparison feature 
% is called if you use this function with model files.
%
% Typical use:
% "c:\matlab\R2009a\bin\matlab.exe" -r fileComparisonDriver("'%base'","'%mine'") -nosplash
%
% This example is compatible with Release 2008b+ onwards and was tested 
% with Subversion 1.7.7 on Windows 7 Enterprise.

% Copyright 2008-2013 The MathWorks, Inc.

% Confirm number of inputs:
narginchk(2, 2)

removalWarning = message('SimulinkXMLComparison:engine:FileComparisonDriverRemoval');
warning('SimulinkXMLComparison:FileComparisonDriverRemoval', removalWarning.getString());

% Uncomment the following line if using a release before R2009b.
% slxmlcomp.register;

% Create a new temporary folder:
newFolder = tempname;
mkdir(newFolder)

% Create a temporary copy of the base file that uses a valid MATLAB file 
% name:
newBase = createTempLocations(base, newFolder);
newMine = createTempLocations(mine, newFolder);

% Use "visdiff" function to open MATLAB Comparison Tool:
visdiff(newBase, newMine)
end

%--------------------------------------------------------------------------
function new = createTempLocations(old, newFolder)
% Names may have unsupported characters due to Subversion conventions. 
% Change them to underscores.
[~, oldName, ext] = fileparts(old);
newName = replaceUnsupportedCharacters(oldName);

% If no characters needed replacing then there is no need to create a 
% temporary copy
if strcmp(oldName, newName)
    new = old;
    return
end

% Create new target location for this file:
new = fullfile(newFolder, [newName ext]);

% Copy files to the temporary location:
ok = copyfile(old, new, 'f');
assert(ok, 'Failed to copy files to temporary location');
end

%--------------------------------------------------------------------------
function new = replaceUnsupportedCharacters(old)
firstLetterIndex = regexp(old, '[a-z_A-Z]', 'start', 'once');
new = old(firstLetterIndex:end);
new = strrep(new, '.', '_');
new = strrep(new, '-', '_');
end
