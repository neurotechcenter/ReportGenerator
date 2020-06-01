%mlreportgen.dom.PageRef Create a reference to the target page.
%    pageRef = PageRef('targetReferenceName') creates a reference to the 
%    target page, by inserting the page number for the page, that contains 
%    the specified target reference name.
%
%    PageRef methods:
%        clone          - Clone this page reference object
%
%    PageRef properties:
%        CustomAttributes  - Custom element attributes
%        Id                - Id of this page reference object
%        Target            - Name of this target reference
%        Style             - Formats that define this page reference object's style
%        StyleName         - Name of this page reference object's stylesheet-defined style
%        Children          - Children of this page reference object
%        Parent            - Parent of this page reference object
%        Tag               - Tag of this page reference object

%    Copyright 2015 MathWorks, Inc.
%    Built-in class

%{
properties

     %Target Target Name of this target reference.
     %
     Target;
 
end
%}