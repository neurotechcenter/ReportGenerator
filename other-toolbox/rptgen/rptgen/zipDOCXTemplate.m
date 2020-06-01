function varargout = zipDOCXTemplate(templateFilename, varargin)
%ZIPDOCXTEMPLATE Zip a DOCX template.
%   zipDOCXTemplate('ZIPPED_TEMPLATE_PATH', 'UNZIPPED_TEMPLATE_PATH') 
%   creates a compressed DOCX template file at the location specified by 
%   ZIPPED_TEMPLATE_PATH from the unzipped template specified by 
%   UNZIPPED_TEMPLATE_PATH, including files stored in subdirectories of the 
%   specified directory.  The resulting compressed template preserves the 
%   directory structure of the uncompressed template. The unzipped directory 
%   must contain a valid DOTX template package structure based on OOXML
%   standard.
%   
%   zipTemplate('TEMPLATE_PATH') creates a compressed DOM template file.
%   The TEMPLATE_PATH argument may specify the path of the uncompressed
%   template directory or the path of the resulting template file including
%   its extension. If TEMPLATE_PATH specifies a directory, the resulting
%   template has the path TEMPLATE_PATH.dotx. If TEMPLATE_PATH ends in an
%   extension (e.g., mytemplate.dotx), the resulting compressed template has
%   the specified extension and the uncompressed template is assumed to
%   reside in a directory specified by TEMPLATE_PATH minus the extenion,
%   e.g., mytemplate).
%
%   Examples
%   --------
%   zipDOCXTemplate('myTemplate');
%   zipDOCXTemplate('myTemplate.dotx');
%   zipDOCXTemplate('myTemplate.dotx', 'myTemplate');
%
%   See also unzipDOCXTemplate

%   Copyright 2017 The MathWorks, Inc.

varargout{:} = rptgen.zipDOCXTemplate(templateFilename, varargin{:});