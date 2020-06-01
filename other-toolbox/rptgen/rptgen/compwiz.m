function varargout=compwiz(varargin)
%COMPWIZ Create custom Report Generator components
%  COMPWIZ with no arguments creates a new component editor in the
%     Report Explorer.
%  COMPWIZ(rptgen.cfr_list) initializes the editor with the
%     settings for the referenced component.
%  COMPWIZ('-browse') displays a list of components from which to
%     derive a new component.
%
%   The component creation tool creates a framework for
%   custom Report Generator components.
%
%   See also SETEDIT, REPORT, RPTLIST, RPTCONVERT

%   Copyright 1997-2015 The MathWorks, Inc.

if nargin==0
    rgRoot = RptgenML.Root;
    refreshAction = rgRoot.refreshReportList('-deferred');
    cm = cbkCreateComponent(rgRoot);
    rgRoot.refreshReportList(refreshAction);
    
    if nargout>0
        varargout{1} = cm;
    end
elseif length(varargin) > 1 && ischar(varargin{1}) && isstruct(varargin{2})
    %We have been called by uiwizard.m
    varargout{1}=feval(['Loc' varargin{1}],varargin{2:end});
else
    rgRoot = RptgenML.Root;
    refreshAction = rgRoot.refreshReportList('-deferred');
    cm = cbkCreateComponent(rgRoot,varargin{:});
    rgRoot.refreshReportList(refreshAction);

    if nargout>0
        varargout{1} = cm;
    end

end






