%getImageDirectory Get a document's image directory
%  directory = getImageDirectory(path, type) gets the image directory
%  of a document (or template) package located at the specified path 
%  and of the specified type ('docx' or 'html').
%
%  Note: this is a static method. It should be invoked on the Document 
%  class.
%
%  Example
% 
%  Suppose that the main image directory of an HTML document named
%  MyDoc.htmx resides in images under the root of the package. Then
%
%    >> mlreportgen.dom.Document.getImageDirectory('MyDoc', 'html')
%    
%    ans =
%    
%    /images

%  Copyright 2014 Mathworks, Inc.
%  Built-in method
