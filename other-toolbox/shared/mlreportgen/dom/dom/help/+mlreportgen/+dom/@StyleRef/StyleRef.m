%mlreportgen.dom.StyleRef Create a reference based on a style. Mainly used
%for creating running header and footers for DOCX and PDF reports
%    styleRef = StyleRef() creates a reference based on the outline level
%    1, by inserting the first text (for headers) or last text (for footers) 
%    with the outline level 1 in the document body of the current page.
%
%    styleRef = StyleRef(n) creates a reference based on the outline level
%    n, by inserting the first text (for headers) or last text (for footers) 
%    with the outline level n in the document body of the current page.
%
%    styleRef = StyleRef('styleName') creates a reference based on the
%    style name, by inserting the first text (for headers) or last text 
%    (for footers) formatted with the specified style in the document
%    body of the current page.
%
%    StyleRef methods:
%        clone          - Clone this style reference object
%
%    StyleRef properties:
%        CustomAttributes  - Custom element attributes
%        Id                - Id of this style reference object
%        RefStyleName      - Name of reference style name
%        RefOutlineLevel   - Reference Outline level number
%        Style             - Formats that define this style reference object's style
%        StyleName         - Name of this style reference object's stylesheet-defined style
%        Children          - Children of this style reference object
%        Parent            - Parent of this style reference object
%        Tag               - Tag of this style reference object

%    Copyright 2015 MathWorks, Inc.
%    Built-in class

%{
properties

     %RefStyleName Name of reference style name.
     %
     RefStyleName;

     %RefOutlineLevel Reference Outline level number.
     %
     RefOutlineLevel;
 
end
%}