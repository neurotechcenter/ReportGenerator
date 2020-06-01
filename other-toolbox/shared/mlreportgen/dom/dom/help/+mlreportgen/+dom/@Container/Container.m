%mlreportgen.dom.Container Container of document objects
%     obj = Container() creates a container with an HTML tag name, div.
%     This container generates an HTML div element containing its
%     contents in HTML output and generates its content in Word output.
%     In HTML output, the generated div element has the style name and
%     inherits the CSS formats specified by this object's StyleName and
%     Style properties. In Word and PDF output, the generated content inherits 
%     the formats specified by this object's Style property. Word and PDF output 
%     ignores this object's HTML tag name and style name.
%     
%     obj = Container(HTMLTag) creates a container with the specified
%     HTML tag name. For example, Container('section') generates the
%     element <section>...</section> in HTML output. The tag is ignored
%     in Word output.
%
%     Use this class to create HTML container elements, such as div,
%     section, and article. You can also use this to apply formats
%     to all the children of the container.
%
%     Container methods:
%        clone  - Creates a copy of this container
%        append - Append a DOM object to this container
%
%     Container properties:
%        Id        - Id of this group object
%        Children  - Children of this group
%        HTMLTag   - HTML tag name of this container
%        Parent    - Parent of this group
%        StyleName - Style name of this  container
%        Style     - Formats to be applied to this container
%        Tag       - Tag of this group object
%
%     Example
%
%     import mlreportgen.dom.*;
%     rpt = Document('MyReport', 'docx');
%
%     c = Container();
%     % Color all the text in this container red.
%     c.Style = {Color('red')};
%     append(c, Paragraph('Hello'));
%     append(c, Table(magic(5)));
%     append(rpt, c);
%     close(rpt);
%     rptview(rpt.OutputPath);
%     
%     See also mlreportgen.dom.Group

%     Copyright 2014-2015 Mathworks, Inc.
%     Built-in class

%{
properties
     %HTMLTag HTML tag name of this container
     HTMLTag;
end
%}