function unzippedFiles = unzipTemplate(templateFilename, varargin)
%UNZIPTEMPLATE Unzip a zipped DOM template.
%   unzipTemplate('ZIPPED_TEMPLATE_PATH', 'UNZIPPED_TEMPLATE_PATH) unzips
%   the DOM template specified by ZIPPED_TEMPLATE_PATH into the directory
%   specified by UNZIPPED_TEMPLATE_PATH. If ZIPPED_TEMPLATE_PATH does
%   not specify a file extension, it is assumed to be .htmtx, the default
%   extension for zipped DOM Templates.
%
%   unzipTemplate('ZIPPED_TEMPLATE_PATH') unzips the DOM template specified
%   by ZIPPED_TEMPLATE_PATH. If the path does not specify a file extension,
%   the extension is assumed to be .htmtx. The template is unzipped into
%   a directory in the same directory as the zipped template. The name
%   of the unzipped template directory is the same as the root name of
%   the zipped template (i.e., the zipped template name minus its 
%   extension).
%
%   Examples
%   --------
%
%   unzipTemplate('myTemplate');
%   unzipTemplate('myTemplate.htmtx');
%   unzipTemplate('myTemplate.htmtx', 'myTemplate');
%
%   See also zipTemplate

%   Copyright 2014-2016 The MathWorks, Inc.

unzippedFiles{:} = rptgen.unzipTemplate(templateFilename, varargin{:});