function unzippedFiles = unzipDOCXTemplate(templateFilename, varargin)
%UNZIPDOCXTEMPLATE Unzip a zipped DOCX template.
%   unzipTemplate('ZIPPED_TEMPLATE_PATH') unzips the DOCX template specified
%   by ZIPPED_TEMPLATE_PATH. If the path does not specify a file extension,
%   the extension is assumed to be .dotx. The template is unzipped into
%   a directory in the same directory as the zipped template. The name
%   of the unzipped template directory is the same as the root name of
%   the zipped template (i.e., the zipped template name minus its 
%   extension).
%
%   unzipDOCXTemplate('ZIPPED_TEMPLATE_PATH', 'UNZIPPED_TEMPLATE_PATH) unzips
%   the DOCX template specified by ZIPPED_TEMPLATE_PATH into the directory
%   specified by UNZIPPED_TEMPLATE_PATH. If ZIPPED_TEMPLATE_PATH does
%   not specify a file extension, it is assumed to be .dotx, the default
%   extension for zipped DOCX Templates.
%
%   Examples
%   --------
%
%   unzipTemplate('myTemplate');
%   unzipTemplate('myTemplate.dotx');
%   unzipTemplate('myTemplate.dotx', 'myTemplate');
%
%   See also zipDOCXTemplate

%   Copyright 2017 The MathWorks, Inc.

unzippedFiles{:} = rptgen.unzipDOCXTemplate(templateFilename, varargin{:});