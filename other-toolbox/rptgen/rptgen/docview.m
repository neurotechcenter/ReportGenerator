function varargout = docview(fileName,varargin)
%DOCVIEW displays a document in a Word-compatible viewer.
%    DOCVIEW(FILENAME) launches FILENAME in Microsoft Word if it is
%    available on the current system or in a Word-compatible editor, such
%    as OpenOffice, if it is available.
%
%    [STATUS,MESSAGE]=DOCVIEW(FILENAME) returns a STATUS of 1 if the viewer
%    was launched successfully, otherwise 0 and a description of the error
%    in MESSAGE.
%
%    DOCVIEW(FILENAME,COMMAND1,COMMAND2) executes the specified commands
%    on Windows systems containing Microsoft Word. The following commands
%    are supported:
%
%      'updatefields'     - updates fields in the document
%      'updatedocxfields' - updates fields in a docx document
%      'convertdocxtopdf' - converts a DOCX file to pdf (Windows only)
%      'showdocxaspdf'    - converts a DOCX file to pdf and displays it
%      'unlinkdocxsubdoc' - remove all subdocument links and copy the 
%                           subdocument content into the master document
%      'printdoc'         - prints the document
%      'closedoc'         - closes the document
%      'closeapp'         - closes Word after all other commands are run
%
%    Note: This function accepts either character arrays or strings as
%    commands, For example, 'updatefields' and "updatefields" are
%    acceptable.
%
%
%    See also RPTVIEWFILE

%   Copyright 1997-2018 The MathWorks, Inc.

nargoutchk(0,2);
switch nargout
    case 0
        mlreportgen.utils.internal.docview(fileName, varargin{:});
    case 1
        varargout{1} = mlreportgen.utils.internal.docview(fileName, varargin{:});
    case 2
        [varargout{1}, varargout{2}] = mlreportgen.utils.internal.docview(fileName, varargin{:});
end
