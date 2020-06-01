%mlreportgen.dom.LinkTarget Create a target for a hyperlink.
%    targetObj = LinkTarget('targetName') creates a link target object.
%
%    LinkTarget methods:
%        append         - Append content to this target
%        clone          - Clone this target
%
%    LinkTarget properties:
%        CustomAttributes  - Custom element attributes
%        Id                - Id of this text
%        Name              - Name of this target
%        Style             - Formats that define this target's style
%        StyleName         - Name of this target's stylesheet-defined style
%        Tag               - Tag of this text

%    Copyright 2014-2018 Mathworks, Inc.
%    Built-in class

%{
properties

     %Name Name of this hyperlink target.
     %
     %    Note: Word replaces spaces in link targets with underscore 
     %    characters. Hence, you should avoid spaces in link targets
     %    if your report targets Word or both HTML and Word.
     %
     %    Note: Word does not allow link target name greater than 40 characters.
     %    You can use mlreportgen.utils.hash(Name) to keep link target
     %    less than 40 characters.
     %
     Name;
 
end
%}