function setedit(varargin)
%SETEDIT  Report Explorer GUI 
%   SETEDIT starts the Report Explorer GUI.
%
%   SETEDIT <filename> starts the Report Explorer with the
%   specified file.  If <filename> does not exist, it will start
%   with a blank file of that name.
%
%   See also RPTLIST, REPORT, RPTCONVERT
 
%   Copyright 1997-2017 The MathWorks, Inc.

if nargin > 0
    varargin{1} = char(varargin{1});
end

RptgenML.explore(varargin{:});
