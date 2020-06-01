%mlreportgen.dom.AllowBreakAcrossPages Allow row to straddle page break
%    obj = AllowBreakAcrossPages() allows a row to flow onto the next
%    page if it cannot fit entirely on the current page.
%
%    obj = AllowBreakAcrossPages(tf) forces a row to start on the next
%    page, if it cannot fit on the current page and tf = false.
%
%    Note: this format applies only to Microsoft Word documents.
%    
%    AllowBeakAcrossPages properties:
%        Id    - Id of this object
%        Tag   - Tag of this object
%        Value - Whether row can straddle a page break
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
%    See also mlreportgen.dom.RepeatAsHeaderRow

%    Copyright 2014 Mathworks, Inc.
%    Built-in class

%{
properties


     %Value Whether row can straddle a page break
     %
     %      Valid values:
     %
     %      true  - row can flow onto next page if it cannot fit entirely
     %              on current page
     %              
     %      false - row must start on a new page if it cannot fit entirely
     %              on current page
     %
     Value;
end
%}