function about
%ABOUT  Display a dialog containing version information

%   Copyright 1997-2018 The MathWorks, Inc.

% Note that the copyright year is automatically updated by about.m_template

dlgTitle = getString(message('rptgen:RptgenML:aboutReportGeneratorLabel'));

figH = findobj(allchild(0), 'flat', 'Name', dlgTitle);
if isempty(figH)
    vInfo = ver('rptgen');
    year = datestr(datenum(vInfo.Date), 10);
    
    msg = message(...
        'rptgen:RptgenML:copyright', ...
        vInfo.Name, ...
        vInfo.Version, ...
        vInfo.Release, ...
        vInfo.Date, ...
        year);
    
    msgbox(msg.getString(), dlgTitle, 'help');
else
    figure(figH);
end
