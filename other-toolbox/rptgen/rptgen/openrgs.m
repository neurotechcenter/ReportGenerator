function openrgs(fName)
%OPENRGS Opens a Report Generator Stylesheet
%   OPENRGS <FILENAME.RGS> opens the Report Generator
%   Stylesheet Editor for the file.  If FILENAME.RGS
%   does not exist, an error will occur.
%
%   Helper function for OPEN.
%
%   See also RPTEDITSTYLE

%   Copyright 1997-2005 The MathWorks, Inc.

rpteditstyle(fName)

%Note that this is one of the few places where we hardcode the 
%stylesheet file extension.  In general, it is preferable to use this:
%char(com.mathworks.toolbox.rptgencore.tools.StylesheetMaker.FILE_EXT_SS)