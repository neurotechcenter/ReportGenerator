%mlreportgen.dom.HTMLFile Convert contents of HTML file to a group of DOM objects
%
%     htmlFileObj = HTMLFile(path) converts the contents of HTML file to a group
%     of DOM objects and appends it to a newly created HTMLFile object. This
%     constructor supports common HTML elements and attributes in the provided HTML file,
%     including the HTML class and style attributes. It supports common CSS
%     formats as values of the HTML style attributes.
%
%     Note: KeepInterElementWhiteSpace property is not honored by HTMLFile.
%     To use that property read the contents of HTML file and use DOM HTML
%     object.
%
%     HTMLFile properties:
%        Id       - Id of this group object
%        HTMLTag   - HTML tag name of this group
%        Children  - Children of this group
%        Parent    - Parent of this group
%        StyleName - Style name of this  group
%        Style     - Formats to be applied to this group
%        Tag      - Tag of this group object
%
%     HTMLFile methods:
%        append - Append HTML markup text, HTML object or another HTMLFile object to this HTMLFile object
%
%    Example:
%
%    import mlreportgen.dom.*;
%    rpt = Document('MyReport', 'docx');
%    path = 'myHTMLfile.html'
%    htmlFile = HTMLFile(path);
%    append(htmlFile, '<p>This is <u>HTML markup text</u></p>');
%    html = HTML('<p>This is <b>HTML object</b></p>');
%    htmlFile.append(html);
%    htmlFile2 = HTMLFile('myHTMLFile2.html');
%    htmlFile.append(htmlFile2)
%    append(rpt, htmlFile);
%    close(rpt);
%    rptview(rpt.OutputPath);
%
%    HTML ELEMENT SUPPORT
%
%    This object supports the following HTML elements in the provided HTML file
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
%    This object supports the following CSS propertie:
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
%    HTMLFile objects accept HTML markup that contains custom CSS
%    properties, i.e., properties that begin with '-'. Custom CSS
%    properties are included in HTML output but skipped in DOCX and PDF
%    output.
%
%    Example: 
%
%    import mlreportgen.dom.*;
%    exampleFile = fullfile(tempdir, 'example.html');
%    fid = fopen(exampleFile,'w');
%    fprintf(fid,'%s', ...
%        ['<html><body><p style="' ...
%        '-moz-appearance:button;' ...
%        '-webkit-appearance:button;' ...
%        'color:red;' ...
%        '">Hello World</p></body></html>']);
%    fclose(fid);
%    outputType = 'html';
%    d = Document('custom_css_props', outputType);
%    append(d, HTMLFile(exampleFile));
%    close(d);
%    delete(exampleFile);
%    rptview(d.OutputPath);

%     Copyright 2014-1015 Mathworks, Inc.
%     Built-in class