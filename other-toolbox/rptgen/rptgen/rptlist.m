function varargout=rptlist(varargin)
%RPTLIST lists the setup (.rpt) files on the MATLAB path
%   LIST=RPTLIST returns a list of the .rpt files on the MATLAB path.
%
%   RPTLIST opens the Report Explorer with a list of available setup
%   files.
%
%   RPTLIST('system_name') opens the setup file specified by a Simulink
%   system's "ReportName" property in the Report Explorer.
%
%   See also: SETEDIT, REPORT, RPTCONVERT, COMPWIZ

%   Copyright 1997-2017 The MathWorks, Inc.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% Convert string arguments to character array arguments
n = numel(varargin);
for i = 1:n
    if isstring(varargin{i})
        varargin{i} = char(varargin{i});
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if nargin<1
    if nargout<1
        viewChild(RptgenML.Root);
    else
        varargout{1}=LocGetFileList;
    end
else
    
    if(isa(varargin{1}, 'Stateflow.Chart'))
        varargin{1} = varargin{1}.Machine.Name;
        
    elseif (~ischar(varargin{1}) && ~ishandle(varargin{1}))
        
        error(message('rptgen:rptgenrptgen:invalidTypeForRptlist', class(varargin{1})));
        
    end
    
    
    if nargin>1
        isImmediateGenerate=strcmpi(varargin{2},'-generatereport');
    else
        isImmediateGenerate=false;
    end
    
    if isImmediateGenerate
        rptName = cbkReport(RptgenML.Root,varargin{1});
        %this handles simulink properly
    else
        rptName = viewChild(RptgenML.Root,varargin{1});
        %this handles simulink properly
    end
    
    if nargout>0
        varargout{1}=rptName;
    end
    
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function  rptFileList=LocGetFileList
%construct the list of .rpt files

StopSearchValue(false);

pSep=pathsep;

if ~contains(lower(path), lower(pwd))
    pathString=[pSep pwd pSep path pSep];
else
    pathString=[pSep path pSep];
end

breakIndex=strfind(pathString,pSep);

rptFileList={};
lastIndex=length(breakIndex)-1;
i=1;
while i<=lastIndex && ~StopSearchValue
    myDir=pathString(breakIndex(i)+1:breakIndex(i+1)-1);
    fileList=dir([myDir filesep '*.rpt']);
    if ~isempty(fileList)
        allFiles={fileList.name};
        rptFileList=[rptFileList;...
            strcat([myDir filesep],allFiles(:))]; %#ok<AGROW>
    end
    i=i+1;
end

%include custom file names
rptFileList=[rptFileList StoreCustomNames];


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function varargout=StoreCustomNames(varargin)
%customList=StoreCustomNames
%     returns the list of stored custom names
%StoreCustomNames(rpt1,rpt2,....)
%     adds input setup file names to the list
%     of stored custom names

persistent RPTGEN_RPTLIST_CUSTOM_SETUP_FILES

if ~iscell(RPTGEN_RPTLIST_CUSTOM_SETUP_FILES)
    RPTGEN_RPTLIST_CUSTOM_SETUP_FILES={};
end

if nargin>0
    RPTGEN_RPTLIST_CUSTOM_SETUP_FILES=...
        [RPTGEN_RPTLIST_CUSTOM_SETUP_FILES
        varargin'];
end

if nargout>0
    varargout{1}=RPTGEN_RPTLIST_CUSTOM_SETUP_FILES;
end


%%%%%%%%%%%%%%%%%%%%%%%%
function stopVal=StopSearchValue(stopVal)

persistent RPTGEN_STOP_RPTLIST_SEARCH

if nargin>0
   RPTGEN_STOP_RPTLIST_SEARCH=stopVal;
end

stopVal=RPTGEN_STOP_RPTLIST_SEARCH;



   

