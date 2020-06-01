%mlreportgen.dom.KeepLinesTogether Start paragraph on new page if necessary
%    obj = KeepLinesTogether() starts a paragraph on a new page if it 
%    cannot fit entirely on current page.
%
%    obj = KeepLinesTogether(tf) starts paragraph on a new page only if
%    it cannot fit entirely on current page and tf is true.
%
%    KeepLinesTogether properties:
%        Id    - Id of this object
%        Tag   - Tag of this object
%        Value - Whether to keep paragraph lines together
%
%    See also mlreportgen.dom.PageBreakBefore

%    Copyright 2014 Mathworks, Inc.
%    Built-in class

%{
properties
     %Value Whether to keep paragraph lines together
     %
     %      Valid values:
     %
     %      true  - paragraph always starts on a new page if it cannot fit
     %              entirely on current page
     %      false - paragraph starts on new page only when it cannot fit
     %              partially on current page.
     Value;
end
%}