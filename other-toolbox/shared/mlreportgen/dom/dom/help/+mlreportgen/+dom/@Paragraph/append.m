%append Append content to this paragraph
%     textObj = append(paraObj, 'text') creates a text object 
%     containing the specified text string and appends it to this 
%     paragraph.
%
%     textObj = append(paraObj, 'text', 'StyleName') creates a text object
%     containing the specified text string and having the specified style 
%     and appends it to this paragraph.
%
%     obj = append(paraObj, obj) appends any of the following types of 
%     objects to this paragraph:
%
%          • CustomElement
%          • ExternalLink
%          • Image
%          • InternalLink
%          • Leader
%          • LineBreak
%          • LinkTarget
%          • NumPages
%          • Page
%          • PageRef
%          • StyleRef
%          • Text
%
%    Note: the custom element must be a valid HTML or DOCX child of this
%    paragraph, depending on whether the output type of the document to
%    which this paragraph is appended is HTML or DOCX, respectively.

%    Copyright 2013-2016 MathWorks, Inc.
%    Built-in function.
