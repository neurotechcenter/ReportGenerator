%mlreportgen.dom.PageRawFormat XML markup for an array of Word formats
%    markup = PageRawFormat() creates an empty array of raw formats.
%
%    PageRawFormat properties:
%        Id     - Id of this raw format object
%        Markup - Word XML markup strings
%        Tag    - Tag of this raw format object
%
%    See also mlreportgen.dom.PageLayout.RawFormats

%    Copyright 2015 Mathworks, Inc.
%    Built-in class

%{
properties
     %Markup Word XML markup strings
     %     The value of this property must be a cell array of strings,
     %     each of which consists of the Word XML markup for a Word
     %     format.
     %
     %     See also mlreportgen.dom.PageLayout.RawFormats
     Markup; 
end
%}