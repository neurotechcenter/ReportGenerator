function openrpt(name)
%OPENRPT Opens a Report Generator Setup File
%   OPENRPT <FILENAME.RPT> opens the Report Generator
%   Setup File Editor for the file.  If FILENAME.RPT
%   does not exist, a blank setup file with that name
%   will be created.
%
%   Helper function for OPEN.
%
%   See also OPEN, SETEDIT

%   Karl Critz 4 Sep 98
%   Copyright 1997-2004 The MathWorks, Inc.

setedit(name)