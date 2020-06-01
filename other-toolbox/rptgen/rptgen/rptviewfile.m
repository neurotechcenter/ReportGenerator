function varargout = rptviewfile(varargin)
%RPTVIEWFILE opens file in your preferred viewer
%   RPTVIEWFILE(FILENAME1.EXT, FILENAME2.EXT, ...) opens the specified
%   files in your preferred viewer for the file types specified by EXT.
%   Use the Report Generator's Preferences panel to specify the viewer
%   that you prefer for a file type. 
%
%   OK=RPTVIEWFILE('FILENAME1.EXT','FILENAME2.EXT', ...) returns a
%   logical vector where true indicates that the viewer for a file
%   opened successfully. If an error occurs, an error message appears in
%   the MATLAB command window and execution continues to the next file.
%
%   [OK,MSG]=RPTVIEWFILE('FILENAME1.EXT','FILENAME2.EXT', ...) returns a
%   cell array containing error messages. The error messages do not 
%   appear at the MATLAB command window.
%
%   Example
%
%   Suppose that Adobe Acrobat is installed on your system and acrobat.exe
%   is in your system path. To set your preferred viewer for PDF reports to
%   Acrobat:
%
%   1. Enter 
%      
%      >> preferences('MATLAB Report Generator')
%
%       to open the MATLAB Report Generator preferences panel.
%
%   2. Select a PDF output type, e.g., Direct PDF (from template), from the
%      Format ID list in the Output Format Options. The "Command to view"
%      edit field by default displays
%      
%      pdfmanage('open', '%<FileName>');
%
%   3. Replace the current content of the "Command to view edit" field
%      with 
%
%      system('acrobat %<FileName>');
%
%   4. Click OK.
%
%   See also PREFERENCES.

%   Copyright 1997-2017 The MathWorks, Inc.

%if nargout==2, errors/warnings/messages are saved to a string and not
%written to screen.
dispErrors = (nargout<2);

ok = false(1,nargin);
for i = 1:nargin

        try
            rptgen.viewFile(char(varargin{i}));
            ok(i) = true;
            statusString = '';
        catch ME
            statusString = ME.message;
            ok(i) = false;
        end

    
    %if we are not outputting status messages and the viewer was
    %not launched successfully, throw an error.  Otherwise, put the error
    %message into the errMsg cell array
    if dispErrors
        if ~ok(i)
            error(message('rptgen:rptgenrptgen:viewFileErrorMsg', statusString));
        end
    else
        errMsg{i} = statusString; %#ok
    end

end

if nargout>0
    varargout{1} = ok;
    if ~dispErrors %dispErrors happens when varargou==2
        varargout{2} = errMsg;
    end
end

