%setCoreProperties Set the core OPC properties of a document
%  propsObj = setCoreProperties(docPath, propsObj) sets the core OPC 
%  properties of the document or template having the specified path to
%  the values specified by the core props object.
%
%    Example:
%
%    % Create a template and set its core properties.
%    import mlreportgen.dom.*;
%
%    Document.createTemplate('mytemplate', 'docx');
%    cp = Document.getCoreProperties('mytemplate.dotx');
%    cp.Creator = 'Me';
%    cp.LastModifiedBy = 'Me';
%    cp.Description = 'My report template';
%    cp.Version = '1.0';
%    cp.ContentStatus = 'Draft';
%    Document.setCoreProperties('mytemplate.dotx', cp);
%
%  See also mlreportgen.dom.CoreProperties, 
%  mlreportgen.dom.Document.getCoreProperties

%  Copyright 2014-2016 Mathworks, Inc.
%  Built-in method
