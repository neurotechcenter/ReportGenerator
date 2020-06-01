%getOPCMainPart Get the main part of a document or document part
%  part = getOPCMainPart(path) gets the relative path of  the main part
%  (file)  of a document (or template) package located at the specified 
%  path. The path is relative to the root of the package. The main part
%  is the file that contains the document's XML or HTML markup. The
%  specified path must end with the extension .htmx or docx.
%
%  part = getOPCMainPart(path, type) gets the relative path of the main
%  part (file)  of a document (or template) package located at the 
%  specified path and of the specified type ('docx' or 'html'). If the
%  specified path omits an extension, the method appends an extension, 
%  either .htmx or .docx, depending on the specified document type.
%
%  Note: this is a static method. It should be invoked on the Document 
%  class.
%
%  Example
% 
%  Suppose that the main part of an HTML document named MyDoc.htmx is 
%  named index.html and resides in the root of the package. Then
%
%    >> mlreportgen.dom.Document.getOPCMainPart('MyDoc', 'html')
%      'index.html'

%  Copyright 2013 Mathworks, Inc.
%  Built-in method
