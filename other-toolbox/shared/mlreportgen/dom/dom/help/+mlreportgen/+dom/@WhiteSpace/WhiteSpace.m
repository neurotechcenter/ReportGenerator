%mlreportgen.dom.WhiteSpace Preserve white space
%    ws = WhiteSpace() collapses white space.
%
%    ws = WhiteSpace('option') applies the specified white space option
%    to white space in a Text object.
%
%               APPLIES TO
%    VALUE      HTML WORD  DESCRIPTION
%    'preserve'   X   X    Preserves white space and line breaks
%                          Note: this is the only option that works in the 
%                          MATLAB browser.
%    'normal'     X        Sequences of whitespace will collapse into a 
%                          single whitespace. Text will wrap when 
%                          necessary. This is default.
%    'nowrap'     X        Sequences of whitespace will collapse into a 
%                          single whitespace. Text will never wrap to the
%                          next line. The text continues on the same
%                          line until a <br /> tag is encountered
%    'pre'        X        Whitespace is preserved by the browser. Text 
%                          will wrap only on line breaks.
%                          Acts like the <pre> tag in HTML
%    'pre-line'   X        Sequences of whitespace will collapse into a
%                          single whitespace. Text will wrap when
%                          necessary, and on line breaks.
%    'pre-wrap'   X        Whitespace is preserved by the browser. 
%                          Text will wrap when necessary, and on line 
%                          breaks
%
%    WhiteSpace properties:
%        Id    - Id of this object
%        Tag   - Tag of this object
%        Value - How to treat white space in a text object
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

%    Copyright 2014 Mathworks, Inc.
%    Built-in class

%{
properties
     %Value How to treate white space in a Text object
     %               APPLIES TO
     %    VALUE      HTML WORD  DESCRIPTION
     %    'preserve'   X   X    Preserves white space and line breaks
     %                          Note: this is the only option that works in the 
     %                          MATLAB browser.
     %    'normal'     X        Sequences of whitespace will collapse into a 
     %                          single whitespace. Text will wrap when 
     %                          necessary. This is default.
     %    'nowrap'     X        Sequences of whitespace will collapse into a 
     %                          single whitespace. Text will never wrap to the
     %                          next line. The text continues on the same
     %                          line until a <br /> tag is encountered
     %    'pre'        X        Whitespace is preserved by the browser. Text 
     %                          will wrap only on line breaks.
     %                          Acts like the <pre> tag in HTML
     %    'pre-line'   X        Sequences of whitespace will collapse into a
     %                          single whitespace. Text will wrap when
     %                          necessary, and on line breaks.
     %    'pre-wrap'   X        Whitespace is preserved by the browser. 
     %                          Text will wrap when necessary, and on line 
     %                          breaks
     Value;
end
%}