function varargout = pptview(fileName, varargin)
%PPTVIEW opens a PowerPoint file in a PowerPoint viewer.
%    PPTVIEW(FILENAME) opens the specified file in a PowerPoint file
%    viewer.
%
%    [STATUS,MESSAGE]=PPTVIEW(FILENAME) returns a STATUS of 1 if the file
%    viewer opened; otherwise, a STATUS of 0 and an error message in 
%    MESSAGE.
%
%    PPTVIEW(FILENAME,COMMAND1,COMMAND2, ...) executes the following
%    commands on Windows systems containing PowerPoint:
%
%      'converttopdf' - convert a PowerPoint file to pdf 
%      'showaspdf'    - convert a PowerPoint file to pdf and displays it
%      'closedoc'     - close FILENAME in PowerPoint
%      'closeapp'     - close PowerPoint after all other commands are run
%
%    See also RPTVIEWFILE

%   Copyright 2015-2018 The MathWorks, Inc.

nargoutchk(0, 2);
switch nargout
    case 0
        mlreportgen.utils.internal.pptview(fileName, varargin{:});
    case 1
        varargout{1} = mlreportgen.utils.internal.pptview(fileName, varargin{:});
    case 2
        [varargout{1}, varargout{2}] = mlreportgen.utils.internal.pptview(fileName, varargin{:});
end
