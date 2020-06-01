function success = pdfmanage(action, filename)
%PDFMANAGE Control opening/reopening and closing of PDF files
%   This function manages (e.g., opens, closes, etc.) PDF files in a custom  
%   figure window.
%
%   Usage:
%       pdfmanage(action);
%       pdfmanage(action, filename);
% 
%   action   => indicates the operation to perform upon filename
%               action may be any one of the following strings:
%   filename => indicates which PDF file is being operated upon
%
%       Windows platforms:
%                   'open'          : opens the file in a viewer
%                                   : - returns false (0) for failure;
%                                   : - returns true (1) for success;
%                                   : - returns true (2) if file was already
%                                   :   open
%                   'close'         : closes the viewer if the given
%                                   :  file is open OR no file is given OR 
%                                   :  filename == 'all'
%                                   : - returns false (0) for failure;
%                                   : - returns true (1) for success;
%                                   : - returns true (2) if file was already
%                                   :   open
%                   'islocked'      : - returns true if the file is locked
%                                   :   by another process
%                   'isopen'        : - returns true if the file is open in
%                                   :   the PDF viewer
%               'isvieweravailable' : - returns true (1) if viewer can be
%                                       created
%       Non-windows platforms
%                   'open'          : calls to OS to open file
%                                   : - returns false (0) for failure;
%                                   : - returns true (1) for success;
%                   'close'         : - returns false (0) always
%                   'islocked'      : - returns false always
%                   'isopen'        : - returns false always
%               'isvieweravailable' : - returns false always

%   Copyright 1997-2018 The MathWorks, Inc.

if (nargin > 1)
    success = mlreportgen.utils.internal.pdfmanage(action, filename);
else
    success = mlreportgen.utils.internal.pdfmanage(action);
end