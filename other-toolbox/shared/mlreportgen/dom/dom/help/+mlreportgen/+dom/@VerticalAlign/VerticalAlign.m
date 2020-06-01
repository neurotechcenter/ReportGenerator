%mlreportgen.dom.VerticalAlign Vertical alignment of text
%    align = VerticalAlign() creates a superscript alignment.
%
%    align = VerticalAlign('value') creates an alignment as specified by
%    the 'value'.
%
%    VALUE                     DESCRIPTION
%    'superscript' or 'super'  Aligns the text as if it is superscript
%    'subscript' or 'sub'      Aligns the text as if it is subscript
%    'baseline'                Aligns the baseline of the text with the baseline of the parent element
%
%
%    VerticalAlign properties:
%        Id    - Id of this object
%        Tag   - Tag of this object
%        Value - Vertical alignment of text relative to baseline
%
%    Example:
%    import mlreportgen.dom.*;
%    doctype = 'html';
%    d = Document('test', doctype);
%    p = Paragraph('e = mc');
%    t = Text('2');
%    t.Style = {VerticalAlign('superscript')};
%    append(p, t);
%    append(d, p);
%    close(d);
%    rptview('test', doctype);

%    Copyright 2014-2018 Mathworks, Inc.
%    Built-in class

%{
properties
     %Value Vertical alignment of text relative to baseline
     %
     %    VALUE                     DESCRIPTION
     %    'superscript' or 'super'  Aligns the text as if it is superscript
     %    'subscript' or 'sub'      Aligns the text as if it is subscript
     %    'baseline'                Aligns the baseline of the text with the baseline of the parent element
     %
     Value;
end
%}