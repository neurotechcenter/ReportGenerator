%append Append content to this hyperlink target
%     textObj = append(targetObj, 'text') converts 'text' to a 
%     Text object, appends it the content of the target, and returns the
%     Text object.
%
%     textObj = append(targetObj, 'content', 'StyleName') converts 
%     'content' to a Text object having the specified style name, appends 
%     it to the content of the target, and returns the Text object.
%
%     textObj = append(targetObj, textObj) appends an object of type 
%     mlreportgen.dom.Text to the target target content.
%
%     autoNumObj = append(targetObj, autoNumObj) appends an object of type 
%     mlreportgen.dom.AutoNumber to the target content. This allows 
%     creation of autonumbered link targets.

%    Copyright 2014 MathWorks, Inc.
%    Built-in function.
