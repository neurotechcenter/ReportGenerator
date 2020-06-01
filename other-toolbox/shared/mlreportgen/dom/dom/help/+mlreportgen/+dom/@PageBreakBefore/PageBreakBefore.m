%mlreportgen.dom.PageBreakBefore Always start paragraph on new page
%    obj = PageBreakBefore() always starts a paragraph or heading on a new page
%
%    obj = PageBreakBefore(tf) always starts paragraph on a new page if tf
%    is true.
%
%    Note: use mlreportgen.dom.PageBreak to force any type of content to
%    begin on a new page.
%
%    PageBreakBefore properties:
%        Id    - Id of this object
%        Tag   - Tag of this object
%        Value - Whether to start paragraph on a new page
%
%    See also mlreportgen.dom.PageBreak, mlreportgen.dom.KeepLinesTogether.

%    Copyright 2014-2015 Mathworks, Inc.
%    Built-in class

%{
properties
     %Value Whether to stare paragraph on a new page
     %
     %      Valid values:
     %
     %      true  - paragraph always starts on next page
     %      false - paragraph starts on new page only when it cannot fit
     %              entirely or partially on current page.
     Value;
end
%}