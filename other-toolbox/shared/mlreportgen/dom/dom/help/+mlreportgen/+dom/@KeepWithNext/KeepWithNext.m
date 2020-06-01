%mlreportgen.dom.KeepWithNext Keep paragraph on same page as next
%    obj = KeepWithNext() keeps a paragraph on the same page as the
%    paragraph that follows it.
%
%    obj = KeepWithNext(tf) keeps a paragraph on the same page as the next
%    if tf = true.
%
%    Note: this format applies only to Microsoft Word and PDF documents
%
%    KeepWithNext properties:
%        Id    - Id of this object
%        Tag   - Tag of this object
%        Value - Whether to keep paragraph on same page as next

%    Copyright 2014-2015 Mathworks, Inc.
%    Built-in class

%{
properties
     %Id Id of this object
     %      Id of this object.
     Id;

     %Tag Tag of this object
     %      Tag of this object.
     Tag;

     %Value Whether to keep paragraph on same page as next
     %
     %      Valid values:
     %
     %      true  - keep paragraph on same page as next
     %      false - allow a page break between this paragraph and the next
     %
     Value;
end
%}