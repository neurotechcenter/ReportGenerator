%mlreportgen.dom.BorderCollapse Collapse HTML table borders
%    obj = BorderCollapse() creates an unspecified format, i.e., nothing
%    in inserted in the generated table markup.
%
%    obj = BorderCollapse('onoff') collapses table cell borders if 
%    'onoff' = 'on' or leaves table and adjacent cell borders separate if 
%    'onoff' = 'off'.
%
%    Note: this property applies only to HTML documents. 
%
%    BorderCollapse properties:
%        Id    - Id of this object
%        Tag   - Tag of this object
%        Value - Whether to collapse table borders
%
%    Example:
%
%    import mlreportgen.dom.*;
%    doctype = 'html';
%    d = Document('test', doctype);
%    magicArray = magic(5);
%    p = Paragraph('Collapsed Borders');
%    append(d, p);
%    table = Table(magicArray);
%    table.Style = {Border('solid'), BorderCollapse('on')};
%    for r = 1:5
%        for c = 1:5
%            table.entry(r,c).Style = {Border('solid')}; 
%        end
%    end
%    append(d, table);
%    
%    p = Paragraph('Separate Borders');
%    append(d, p);
%    table = Table(magicArray);
%    table.Style = {Border('solid'), BorderCollapse('off')};
%    for r = 1:5
%        for c = 1:5
%            table.entry(r,c).Style = {Border('solid')}; 
%        end
%    end
%    append(d, table);
%    
%    p = Paragraph('Browser Default');
%    append(d, p);
%    table = Table(magicArray);
%    table.Style = {Border('solid'), BorderCollapse};
%    for r = 1:5
%        for c = 1:5
%            table.entry(r,c).Style = {Border('solid')}; 
%        end
%    end
%    append(d, table);
%    
%    close(d);
%    rptview(d.OutputPath, doctype);

%    Copyright 2014 Mathworks, Inc.
%    Built-in class

%{
properties

     %Value Whether to collapse table borders
     %
     %      Valid values:
     %
     %      ''    - Unspecified (i.e., browser decides)
     %      'on'  - Collapse borders
     %      'off' - Leave borders separate
     Value;
end
%}