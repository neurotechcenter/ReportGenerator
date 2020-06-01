%mlreportgen.dom.HTML Convert HTML text to a group of DOM objects
%     htmlObj = HTML() creates an empty HTML object.
%
%     htmlObj = HTML(htmlText) converts a string of HTML text to a group
%     of DOM objects and appends it to a newly created HTML object. This
%     constructor supports common HTML elements and attributes, including
%     the HTML class and style attributes. It supports common CSS
%     formats as values of the HTML style attributes.
%
%     HTML properties:
%        Id                          - Id of this group object
%        HTMLTag                     - HTML tag name of this group
%        Children                    - Children of this group
%        Parent                      - Parent of this group
%        StyleName                   - Style name of this  group
%        Style                       - Formats to be applied to this group
%        Tag                         - Tag of this group object
%        KeepInterElementWhiteSpace  - Whether to convert white space
%                                      between HTML elements
%
%     HTML methods:
%        append - Append HTML text or another HTML object to this HTML object
%
%    Example:
%
%    import mlreportgen.dom.*;
%    rpt = Document('MyReport', 'docx');
%    html = HTML('<p><b>Hello</b> <i style="color:green">World</i></p>');
%    append(html, '<p>This is <u>me</u> speaking</p>');
%    append(rpt, html);
%    close(rpt);
%    rptview(rpt.OutputPath);
%
%    HTML ELEMENT SUPPORT
%
%    This object supports the following HTML elements
%
%    ELEMENT   ATTRIBUTES
%    a         class, style, href, name
%    b         class, style
%    body      class, style
%    br        
%    code      class, style
%    del       class, style
%    div       class, style
%    font      class, style, color, face, size
%    hr        class, style, align
%    h1-h6     class, style, align
%    i         class, style 
%    ins       class, style
%    img       class, style, src, height, width, alt
%    li        class, style
%    ol        class, style
%    p         class, style, align
%    pre       class, style
%    s         class, style
%    span      class, style
%    strike    class, style
%    sub       class, style
%    sup       class, style
%    table     class, style, align, bgcolor, border, cellspacing, 
%              cellpadding, frame, rules, width
%    tbody     class, style, align, valign
%    tfoot     class, style, align, valign
%    thead     class, style, align, valign
%    td        class, style, bgcolor,  height, width, colspan, rowspan,
%              valign, nowrap
%    tr        class, style, align, bgcolor, valign
%    tt        class, style
%    u         class, style
%    ul        class, style
%
%    For information on these elements, see http://www.w3schools.com/tags
%
%    CSS PROPERTIES SUPPORT
%
%    This object supports the following CSS properties:
%
%    background-color
%    border
%    border-bottom
%    border-bottom-color
%    border-bottom-style
%    border-bottom-width
%    border-color
%    border-left
%    border-left-color
%    border-left-style
%    border-left-width
%    border-right
%    border-right-color
%    border-right-style
%    border-right-width
%    border-style
%    border-top
%    border-top-color
%    border-top-style
%    border-top-width
%    color
%    counter-increment
%    counter-reset
%    display
%    font-family
%    font-size
%    font-style
%    font-weight
%    height
%    line-height
%    list-style-type
%    margin
%    margin-bottom
%    margin-left
%    margin-right
%    margin-top
%    padding
%    padding-bottom
%    padding-left
%    padding-right
%    padding-top
%    text-align
%    text-decoration
%    text-indent
%    vertical-align
%    white-space
%    width
%
%    For information on these formats, see http://www.w3schools.com/cssref
%
%    CUSTOM CSS PROPERTIES
%
%    HTML objects accept HTML markup that contains custom CSS properties,
%    i.e., properties that begin with '-'. Custom CSS properties are
%    included in HTML output but skipped in DOCX and PDF output.
%
%    Example: 
%
%    import mlreportgen.dom.*;
%    outputType = 'pdf';
%    d = Document('custom_css_props', outputType);
%    append(d, HTML(['<p style="' ...
%        '-moz-appearance:button;' ...
%        '-webkit-appearance:button;' ...
%        'color:red;' ...
%        '">Hello World</p>']));
%    close(d);
%    rptview(d.OutputPath);

%     Copyright 2014-2018 Mathworks, Inc.
%     Built-in class

%{
properties
     %KeepInterElementWhiteSpace Whether to convert white space between
     %HTML elements. 
     %    If this property is true, the DOM converts white space between 
     %    elements in the input HTML markup to DOM Text objects. 
     %    If false (the default), the DOM ignores white space between elements. 
     %    HTML browsers ignore white space between elements, allowing you 
     %    to use white space to format markup for readability, for example,
     %    using line feeds to divide markup into lines and spaces to indent
     %    the lines. This option allows you to specify that the DOM similarly 
     %    ignore white space used purely to format the HTML markup for readability.
     %
     %    Note: In order to use this property create an empty HTML object 
     %    and set this property before appending the htmlText to the created
     %    HTML object.
     %
     %    Note: this option allows you to to convert but not preserve 
     %    inter-element white space. To preserve white space, include a 
     %    WhiteSpace format in the HTML object's Style format.
     %
     %    For example,
     %    h = HTML('<p>     <span>Hello</span>      </p>');
     %    h.Style = {WhiteSpace('preserve')}
     KeepInterElementWhiteSpace;
end
%}