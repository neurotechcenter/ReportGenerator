%mlreportgen.dom.TableColSpec Defines style of a table column
%    colSpecObj = TableColSpec() creates a column specification having a 
%    span of 1.
%
%    Note: use a col spec object to override formats specified by a
%    TableColSpecGroup object.
%
%    TableColSpec properties:
%        CustomAttributes  - Custom attributes of this column spec
%        Id                - Id of this column spec
%        Style             - Style of column specified by this col spec
%        Span              - Number of columns governed by this col spec
%        Tag               - Tag of this col spec
%
%    See also mlreportgen.dom.TableColSpecGroup

%    Copyright 2013-2014 Mathworks, Inc.
%    Built-in class

%{
properties
     %Span Number of columns spanned by this specification
     %     Number of adjacent table columns to which this col spec applies. 
     %     If this property is not specified, i.e., its value is [], the 
     %     value is assumed to be 1.
     Span;

end
%}