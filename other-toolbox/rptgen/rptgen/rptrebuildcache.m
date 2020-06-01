function rptrebuildcache()
% RPTREBUILDCACHE Rebuild template cache
%   Rebuild the Report Explorer's template cache. Run this command if
%   you add a template to the MATLAB path subsequent to opening the Report
%   Explorer or running a setup (rpt) file for the first time in a MATLAB
%   session.
%
%   About the Template Cache
%
%   The first time you open the Report Explorer in a MATLAB session or run
%   a setup file, the Report Explorer searches the MATLAB path for templates
%   and enters them in a cache. When you run a setup (rpt)
%   file, the Report Explorer looks for the  template
%   specified in the setup file in the cache if the template
%   is not in the current directory. If you subsequently create a template
%   and do not run this command, the Report Explorer or 
%   report command finds the template only if it is in the
%   current directory. If you want to run the report from another 
%   directory, you must run this command after adding the template.
%
%   Note: you must create a template on the MATLAB path for
%   this command to cache it.
%
%   See also SETEDIT, REPORT, RPTCONVERT, RPTREBUILDREGISTRY

%   Copyright 2017 The MathWorks, Inc.

browser = RptgenML.DB2DOMTemplateBrowser;
delete(browser);
rptgen.db2dom.TemplateCache.getTheCache(true);
browser = RptgenML.DB2DOMTemplateBrowser;
getTemplateLibrary(browser);
end

