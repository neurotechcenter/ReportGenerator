%mlreportgen.dom.ExternalLink Create a hyperlink to an external target
%
%    linkObj = ExternalLink() creates a link with an empty target and
%    empty link text.
%
%    linkObj = ExternalLink('target', 'text') creates a link to the
%    specified external target containing the specified text.
%
%    linkObj = ExternalLink('target', 'text', 'styleName') creates a link 
%    to the specified external target containing a Text object with the
%    specified text and style name.
%
%    linkObj = ExternalLink('target', textObj) creates a link to the
%    specified external target containing the specified 
%    mlreportgen.dom.Text object.
%
%    ExternalLink methods:
%        append         - Append text and images to this link
%        clone          - Clone this target
%
%    ExternalLink properties:
%        Children          - Children of this external link
%        CustomAttributes  - Custom element attributes
%        Id                - Id of this text
%        Parent            - Parent of this link
%        Tag               - Tag of this text
%        Target            - External target of this hyperlink
%
%    Example:
%
%    import mlreportgen.dom.*
%    d = Document('mydoc');
%    append(d, ExternalLink('http://www.mathworks.com/', 'MathWorks'));
%    close(d);
%    rptview('mydoc', 'html');

%    Copyright 2014-2015 Mathworks, Inc.
%    Built-in class

%{
properties

     %Target Name of this hyperlink target (read-only)
     Target;
 
end
%}