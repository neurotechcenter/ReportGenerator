%mlreportgen.dom.TemplateText XML markup from document template
%    This object contains XML markup read from a document's template
%    when it is opened. More specifically, it contains one of the 
%    segments of template text that lies between the beginning of the
%    template and the first hole in the template, between subsequent
%    holes in the template, or between the last hole and the end of
%    the template. Moving from hole to hole causes these segments of 
%    text to be embedded in TemplateText objects and appended to the
%    document's list of children. This guarantees that the template 
%    text will be included in the document output in the same order in
%    which it occcurs in the template interspersed with content appended
%    at each hole.
%
%    TemplateText properties:
%        DOCXText - Text to output to a DOCX document
%        HTMLText - Text to output to an HTML document
%        Id       - Id of this raw text object
%        Parent   - Parent of this raw text object
%        Tag      - Tag of this raw text object
%
%    Example:
%
%    import mlreportgen.dom.*;
%    d = Document('test');
%    d.TitleBarText = 'My Report';
%    open(d);
%    % Display browser title bar text that the DOM template parser
%    % inserts into the markup read from the beginning of the template.
%    disp(d.Children(2).HTMLText));
%    close(d);

%    Copyright 2014 Mathworks, Inc.
%    Built-in class
