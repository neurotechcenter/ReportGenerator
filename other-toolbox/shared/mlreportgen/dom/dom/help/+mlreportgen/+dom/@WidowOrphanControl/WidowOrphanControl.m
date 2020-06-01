%mlreportgen.dom.WidowOrphanControl Prevent widows and orphans
%    obj = WidowOrphanControl() prevents a page break after the first line
%    of a paragraph (orphan) or before the last line of a paragraph
%    (widow).
%
%    obj = WidowOrphanControl(tf) prevents widows and orphans if 
%    tf = true;
%
%    Note: this format applies only to Microsoft Word documents
%
%    WidowOrphanControl properties:
%        Id    - Id of this object
%        Tag   - Tag of this object
%        Value - Whether to prevent widows and orphans

%    Copyright 2014 Mathworks, Inc.
%    Built-in class

%{
properties
     %Id Id of this object
     %      Id of this object.
     Id;

     %Tag Tag of this object
     %      Tag of this object.
     Tag;

     %Value Whether to prevent widows and orphans
     %
     %      Valid values:
     %
     %      true  -  prevents a page break after the first line
     %               of a paragraph (orphan) or before the last 
     %               line of a paragraph
     %               (widow).
     %      false -  allows widows and orphans
     %
     Value;
end
%}