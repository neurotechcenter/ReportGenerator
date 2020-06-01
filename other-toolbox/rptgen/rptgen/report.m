function varargout=report(varargin)
%REPORT Generate a report from a setup file
%   REPORT opens the Report Explorer on systems on which the Report
%   Generator resides.
%
%   REPORT(setup1, setup2, ...) generates reports from the specified setup
%   files. The arguments are character arrays or strings that specify the
%   paths of the setup files.
%
%   [REPORT1, REPORT2, ...] = REPORT(setup1, setup2, ...) returns the names
%   of the generated reports. Returned names will be empty if generating
%   the report caused an error.
%
%   REPORT(systemname) generates the report specified by the ReportName
%   property of a Simulink system or its parent.
%
%   The REPORT command accepts flags that specify report generation
%   options. Flags and setup paths can be interspersed. The options 
%   specified by the flags apply to all the generated reports.
%
%   REPORT(...,'-fFORMAT',...) specifies the output format of the report.
%   To display a list of format IDs for template-based reports, enter
%   rptconvert("domformatlist") at the MATLAB command line. To display a
%   list of legacy format IDs, enter rptconvert("-domformatlist"). Note you
%   should use these formats only for converting XML files that use XSL or
%   DSSSL style sheets to specify formatting.
%
%   REPORT(...,'-fFORMAT', '-sTEMPLATE',...) specifies the id of the
%   template (or style sheet in the case of legacy reports) to be used to
%   generate a report. To display a list of templates available to format
%   template-based documents of type FORMAT, enter
%   rptconvert("-templatelist", FORMAT) at the MATLAB command line. You
%   should specify a template compatible with the specified document
%   format, for example, a PDF template for a converted PDF document.
%
%   REPORT(...,'-fFORMAT', '-sSTYLESHEET',...) specifies the id of the
%   style sheet to be used to generate a report. To display a list of style
%   sheets available to format documents of type FORMAT, enter
%   rptconvert("-stylesheetlist", FORMAT) at the MATLAB command line. Use a
%   style sheet only for XML documents that specify a style sheet and only
%   if FORMAT specifies a legacy output type, such as "Adobe Acrobat".
%   
%   REPORT(...,'-oPATH',...) sets the name of the generated report.
%   PATH can specify a path or a file name. If it specifies a file name,
%   the report is generated in the directory specified by the report
%   setup file.
%
%   Other options include:
%
%     Option      Description
%     ------      --------------------------------------------------------
%     -noview     Generates but does not display a report
%     -graphical  Opens the report in the Report Explorer and runs the
%                 report
%     -debug      Generates report debugging info at the MATLAB command
%                 line
%     -quiet      Suppresses command-line output during report generation
%
%   Examples
%
%   Generate a simple report at /tmp/index.html: 
%   report('simple-report','-o/tmp/index.html')
%   
%   Generate a report in the directory specified by simple-report.rpt:
%   report('simple-report','-oindex.html') 
%
%   %Generate a PDF report using the default PDF template:
%   report("magic-square", "-fdom-pdf-direct", "-sdefault-rg-pdf");
%
%
%   See also SETEDIT, RPTLIST, RPTCONVERT

%   Copyright 1997-2017 The MathWorks, Inc.
%
%   Note: can also call REPORT(RPTSP) where RPTSP is a
%   RPTSP (Setup File Pointer) object.

varargout = rptgen.report(varargin{:});
