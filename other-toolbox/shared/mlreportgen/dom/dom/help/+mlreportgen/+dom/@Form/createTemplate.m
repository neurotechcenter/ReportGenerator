%createTemplate Create a template
%  createTemplate(path) creates a copy of the DOM's default template at 
%  the specified path. The extension of the path must be either
%  ('dotx' or 'pdftx' or 'htmx').
%
%  createTemplate(path, type) creates a copy of the DOM's default template
%  of the specified type at the specified path. Type must be either
%  ('docx' or 'pdf' or 'html' or 'html-file'). If the path does not have 
%  an extension, this method appends an extension of the appropriate type, 
%  i.e., 'htmx' for an HTML template, 'dotx' for a Word template, 'pdftx' 
%  for a PDF template, or 'html' for a single-file HTML template.
%
%  Note: This is a static method to be invoked on the Document class, 
%  not a Document instance.
%
%  Example
%
%  The following line creates a Word template.
%
%  Document.createTemplate('MyTemplate.dotx');

%  Copyright 2013-2015 Mathworks, Inc.
%  Built-in method

