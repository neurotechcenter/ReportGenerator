%mlreportgen.dom.RepeatAsHeaderRow Repeat header row
%    obj = RepeatAsHeaderRow() repeats header row on each new page when
%    a table flows across multiple pages
%
%    obj = RepeatAsHeaderRow(tf) repeats header row if tf = true.
%
%    Note: this format applies only to Word documents.
%    
%    RepeatAsHeaderRow properties:
%        Id    - Id of this object
%        Tag   - Tag of this object
%        Value - Whether to repeat header row
%
%    Example:
%
%    import mlreportgen.dom.*;
%    doctype = 'docx';
%    d = Document('test', doctype);
%    
%    append(d, 'Table 1');
%    table = Table(ones(15, 2));
%    table.Style = {Border('solid'), RowSep('solid')};
%    append(d, table);
%    
%    append(d, 'Table 2');
%    table = Table(ones(15, 2));
%    table.entry(1,1).Children(1).Content = 'Header A';
%    table.entry(1,2).Children(1).Content = 'Header B';
%    table.row(1).Style = { RepeatAsHeaderRow(true) };
%    table.Style = {Border('solid'), RowSep('solid')};
%    append(d, table);
%    table.row(6).Style = {AllowBreakAcrossPages(false)};
%    table.entry(6,1).Children(1).Content = ...
%       'Start this row on new page if it does not fit on current page';
%    for i=2:10
%        table.entry(6,1).append(Paragraph(Text(i)));
%    end
%    
%    close(d);
%    rptview(d.OutputPath, doctype);
%
%    See also mlreportgen.dom.AllowBreakAcrossPages

%    Copyright 2014 Mathworks, Inc.
%    Built-in class

%{
properties


     %Value Whether to repeat header row
     %
     %      Valid values:
     %
     %      true  - Repeat header row when table flows across multiple 
     %              pages
     %              
     %      false - Do not repeat header row
     %
     Value;
end
%}