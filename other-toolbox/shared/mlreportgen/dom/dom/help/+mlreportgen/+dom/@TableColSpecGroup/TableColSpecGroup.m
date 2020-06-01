%mlreportgen.dom.TableColSpecGroup Defines style of a group of table columns
%    colSpecObj = TableColSpecGroup creates a column specification that
%    spans an entire table.
%
%    TableColSpec properties:
%        ColSpecs          - Specs of columns in this group
%        CustomAttributes  - Custom element attributes
%        Id                - Id of this group
%        Style             - Style of columns in this group
%        Span              - Number of columns governed by this group
%        Tag               - Tag of this col spec group
%
%    Example
%
%    The following code sets the color of the first column green and
%    the remaining columns red.
%
%    import mlreportgen.dom.*
%    d = Document('mydoc', 'docx');
%    append(d, 'Table');
%    grps(1) = TableColSpecGroup;
%    grps(1).Style = {Color('red')};
%    specs(1) = TableColSpec;
%    specs(1).Style = {Color('green')};
%    grps(1).ColSpecs = specs;
%    table = Table(magic(5));
%    table.ColSpecGroups = grps;
%    append(d, table);
%    close(d);
%    rptview(d.OutputPath);
%
%    See also mlreportgen.dom.TableColSpec, mlreportgen.dom.Table,
%    mlreportgen.dom.FormalTable

%    Copyright 2013-2014 Mathworks, Inc.
%    Built-in class

%{
properties

     %ColSpecs Specs of columns in this group
     %     Array of TableColSpec objects that define the styles of
     %     columns in this group. The first col spec object applies to
     %     the first nSpan columns in the group, where nSpan is the span
     %     of the col spec object, the second to the second nSpan
     %     columns, etc. If a col spec object specified a format that is
     %     also specified by the parent group object, the col spec format
     %     overrides the group format.
     ColSpecs;

     %Span Number of columns spanned by this specification
     %     Number of adjacent table columns to which this col spec applies. 
     %     If this property is not specified, i.e., its value is [], the 
     %     group is assumed to span the entire table.
     Span;

end
%}