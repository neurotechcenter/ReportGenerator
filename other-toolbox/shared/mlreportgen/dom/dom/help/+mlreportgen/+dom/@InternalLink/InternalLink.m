%mlreportgen.dom.InternalLink Create a hyperlink to a target in this
%  document
%
%    linkObj = InternalLink() creates a link with an empty target and
%    empty link text.
%
%    linkObj = InternalLink('target', 'text') creates a link to the
%    specified internal target containing the specified text.
%
%    linkObj = InternalLink('target', 'text', 'styleName') creates a link 
%    to the specified internal target containing a Text object with the
%    specified text and style name.
%
%    linkObj = InternalLink('target', textObj) creates a link to the
%    specified internal target containing the specified 
%    mlreportgen.dom.Text object.
%
%    InternalLink methods:
%        append         - Append text and images to this link
%        clone          - Clone this target
%
%    InternalLink properties:
%        Children          - Children of this internal link
%        CustomAttributes  - Custom element attributes
%        Id                - Id of this text
%        Parent            - Parent of this link
%        Tag               - Tag of this text
%        Target            - Internal target of this hyperlink
%
%    Example:
%
%    import mlreportgen.dom.*
%    d = Document('mydoc');
%    append(d, InternalLink('bio', 'Author''s Bio'));
%    h = Heading(1, LinkTarget('bio'));
%    append(h, 'Author''s Bio');
%    append(d, h);
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