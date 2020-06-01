function rptrebuildregistry()
% RPTREBUILDREGISTRY Rebuild the Report Explorer's style sheet registry.
%   Rebuild the Report Explorer's XSL and DSSSL style sheet registry. Run
%   this command if you add a style sheet to the MATLAB path subsequent to
%   opening the Report Explorer or running a setup (rpt) file for the first
%   time in a MATLAB session.
%
%   About the Style Sheet Registry
%
%   The first time you open the Report Explorer in a MATLAB session or run
%   a setup file, the Report Explorer searches the MATLAB path for XSL and
%   DSSSL style sheets and enters them in a registry. When you run a setup
%   (rpt) file, the Report Explorer looks for the style sheet specified in the
%   setup file in the registry if the style sheet is not in the current directory. If
%   you subsequently create a style sheet and do not run this command, the
%   Report Explorer or report command finds the style sheet only if it is in
%   the current directory. If you want to run the report from another
%   directory, you must run this command after adding the template.
%
%   See also SETEDIT, REPORT, RPTCONVERT, RPTREBUILDCACHE 

%   Copyright 2017 The MathWorks, Inc.

ssRoot = RptgenML.StylesheetRoot;
delete(ssRoot);
ssRoot = RptgenML.StylesheetRoot;
getStylesheetLibrary(ssRoot);

end

