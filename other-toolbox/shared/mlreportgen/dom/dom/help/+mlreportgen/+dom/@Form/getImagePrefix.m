%getImagePrefix Get the a document's generated image name prefix
%  directory = getImagePrefix(path, type) gets the image name prefix
%  of a document (or template) package located at the specified path 
%  and of the specified type ('docx' or 'html'). The prefix is used 
%  to generate the internal names of images appended to the document.
%
%  Note: this is a static method. It should be invoked on the Document 
%  class.
%
%  Example
% 
%  Suppose that the image name prefix of an HTML document named
%  MyDoc.htmx resides is image. Then
%
%    >> mlreportgen.dom.Document.getImagePrefix('MyDoc', 'html')
%    
%    ans =
%    
%    image

%  Copyright 2014 Mathworks, Inc.
%  Built-in method
