%getMainPartPath Get the path of the main part of a document
%  path = getMainPartPath(doc) returns the full relative or absolute path
%  of the main part of this document's output package.
%
%  Example
%
%  Suppose that the main part of an HTML document named MyReport is named
%  index.html and resides in the root of the MyReport package.
%
%  >> d = mlreportgen.dom.Document('s:\reports\MyReport', 'html');
%  >> d.PackageType='unzipped';
%  >> getMainPartPath(d)
%  's:\reports\MyReport\index.hml'

%
%  Copyright 2013 Mathworks, Inc.
%  Built-in method
