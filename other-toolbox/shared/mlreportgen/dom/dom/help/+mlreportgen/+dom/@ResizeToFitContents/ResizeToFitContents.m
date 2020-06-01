%mlreportgen.dom.ResizeToFitContents Allow table to resize its columns
%    obj = ResizeToFitContents() allow a table to resize its columns to
%    fit their contents.
%
%    obj = ResizeToFitContents(tf) allows a table to resize its columns to
%    fit their contents, if tf = true.
%
%    ResizeToFitContents properties:
%        Id    - Id of this object
%        Tag   - Tag of this object
%        Value - Whether table can resize the columns
%
%    Example:
%
%    import mlreportgen.dom.*;
%    doctype = 'html';
%    d = Document('test', doctype);
%
%    append(d, Heading(1,'Table 1'));
%    table = Table(ones(4, 4));
%    table.entry(1,2).Children(1).Content = 'MathWorks';
%    table.Style = {ResizeToFitContents(true), Width('1in'), ...
%        Border('solid'), RowSep('solid'), ColSep('solid')};
%    table.TableEntriesStyle = { Width('0.25in') };
%    append(d, table);
%
%    append(d, Heading(1,'Table 2'));
%    table = Table(ones(4, 4));
%    table.entry(1,2).Children(1).Content = 'MathWorks';
%    table.Style = {ResizeToFitContents(false), Width('1in'), ...
%        Border('solid'), RowSep('solid'), ColSep('solid')};
%    table.TableEntriesStyle = { Width('0.25in') };
%    append(d, table);
%
%    close(d);
%    rptview(d.OutputPath, doctype);

%    Copyright 2014 Mathworks, Inc.
%    Built-in class

%{
properties


     %Value Whether table can resize the columns
     %
     %      Valid values:
     %
     %      true  - table can resize its columns to fit their contents
     %              
     %      false - table cannot resize its columns to fit their contents
     %
     Value;
end
%}