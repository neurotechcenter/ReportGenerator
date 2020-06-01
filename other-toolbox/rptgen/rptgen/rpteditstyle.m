function varargout = rpteditstyle(varargin)
%RPTEDITSTYLE Create and edit document transform stylesheets.
%   RPTEDITSTYLE Opens a blank stylesheet in the Report Explorer
%   RPTEDITSTYLE(ID) Opens a stylesheet with unique string identifier ID
%   RPTEDITSTYLE('filename.rgs') Opens the stylesheet file 'filename.rgs'
%   RPTEDITSTYLE('-NEW_HTML') creates a new HTML stylesheet.
%   RPTEDITSTYLE('-NEW_HTML_CHUNKED') creates a new multi-page HTML
%   stylesheet.
%   RPTEDITSTYLE('-NEW_FO') creates a new FO stylesheet for use with PDF.
%   RPTEDITSTYLE('-NEW_DOCX') creates a new  Word template for use with 
%   stylised Word reports.

%   RPTEDITSTYLE(RPTGENML.CREPORT) Edits the stylesheet used by the 
%      CReport object
%   RPTEDITSTYLE('-stylesheetlist',...) acts as RPTCONVERT

 
%   Copyright 1997-2005 The MathWorks, Inc.

if length(varargin)==1 && ischar(varargin{1}) && strcmp(varargin{1},'-stylesheetlist')
    varargout{1} = rptconvert(varargin{:});
    return;
end

ssEdit = addStylesheetEditor(RptgenML.StylesheetRoot,varargin{:});

if nargout>0
    varargout{1} = ssEdit;
end
