%mlreportgen.dom.CounterInc Increment an auto number counter
%    inc = CounterInc() creates an empty incrementer.
%
%    inc = CounterInc('stream') creates a counter incrementer for the
%    specified auto number stream. Assigning this format to the style of
%    a DOM object causes the associated stream counter to be incremented
%    when the object is appended to a document.
%
%    CounterInc properties:
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
%    p.Style = { CounterInc('chapter'), WhiteSpace('preserve') };
%    append(p, AutoNumber('chapter'));
%    append(d, p);
%    
%    p = Paragraph('Chapter ');
%    p.Style = { CounterInc('chapter'), WhiteSpace('preserve') };
%    append(p, AutoNumber('chapter'));
%    append(d, p);
%    
%    close(d);
%    rptview('test', doctype);
%
%    See also mlreportgen.dom.AutoNumber, mlreportgen.dom.CounterReset

%    Copyright 2014 Mathworks, Inc.
%    Built-in class

%{
properties

     %StreamName Name of stream with counter to be incremented
     StreamName;
end
%}