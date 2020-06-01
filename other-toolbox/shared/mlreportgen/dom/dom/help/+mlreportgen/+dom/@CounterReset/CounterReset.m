%mlreportgen.dom.CounterReset Reset an auto number counter
%    reset = CounterInc() creates an empty couter reset object.
%
%    reset = CounterInc('stream') creates a counter resetter for the
%    specified auto number stream. Assigning this format to the style of
%    a DOM object causes the associated stream counter to be reset to its
%    initial value when the object is appended to a document.   
%
%    CounterReset properties:
%        Id         - Id of this object
%        StreamName - Name of stream with counter to be incremented
%        Tag        - Tag of this object
%
%    Example:
%
%    import mlreportgen.dom.*;
%    doctype = 'html';
%    d = Document('test', doctype);
%    
%    p = Paragraph('Chapter ');
%    p.Style = { CounterInc('chapter'), CounterReset('table'), WhiteSpace('preserve') };
%    append(p, AutoNumber('chapter'));
%    append(d, p);
%    
%    p = Paragraph('Table ');
%    append(p, AutoNumber('chapter'));
%    append(p, '.');
%    append(p, AutoNumber('table'));
%    p.Style = { CounterInc('table'), WhiteSpace('preserve') };
%    append(d, p);
%    
%    p = Paragraph('Chapter ');
%    p.Style = { CounterInc('chapter'), CounterReset('table'), WhiteSpace('preserve') };
%    append(p, AutoNumber('chapter'));
%    append(d, p);
%    
%    p = Paragraph('Table ');
%    append(p, AutoNumber('chapter'));
%    append(p, '.');
%    append(p, AutoNumber('table'));
%    p.Style = { CounterInc('table'), WhiteSpace('preserve') };
%    append(d, p);
%    
%    close(d);
%    rptview('test', doctype);
%
%    See also mlreportgen.dom.AutoNumber, mlreportgen.dom.CounterInc

%    Copyright 2014 Mathworks, Inc.
%    Built-in class

%{
properties

     %StreamName Name of stream with counter to be reset
     StreamName;
end
%}