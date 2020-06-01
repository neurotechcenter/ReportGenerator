%mlreportgen.dom.FlowDirection Direction of text flow
%    obj = FlowDirection() causes text to flow from left to right.
%
%    obj = FlowDirection('flow') causes text to flow from left to
%    right ('flow' = 'ltr') or right to left ('flow' = 'rtl').
%
%    FlowDirection properties:
%        Id    - Id of this object
%        Tag   - Tag of this object
%        Value - Direction of text flow across page
%
%    Example:
%
%    import mlreportgen.dom.*;
%    doctype = 'docx';
%    d = Document('test', doctype);
%    p = Paragraph('able was I ere I saw elba');
%    p.Style = {FlowDirection('rtl')};
%    append(d, p);
%    close(d);
%    rptview(d.OutputPath, doctype);

%    Copyright 2014 MathWorks, Inc.
%    Built-in class

%{
properties

     %Value Direction of text flow across page
     %
     %      Valid values:
     %
     %      'ltr' - text flows left to right
     %      'rtl' - text flows right to left
     %
     Value;
end
%}