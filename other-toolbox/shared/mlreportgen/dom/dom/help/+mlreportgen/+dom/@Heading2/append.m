%append Append content to this heading
%     textObj = append(headingObj, 'text') creates a text object 
%     containing the specified text string and appends it to this 
%     heading.
%
%     textObj = append(headingObj, 'text', 'StyleName') creates a text object
%     containing the specified text string and having the specified style 
%     and appends it to this heading.
%
%     obj = append(headingObj, obj) appends any of the following types of 
%     objects to this heading:
%
%          • CustomElement
%          • ExternalLink
%          • Image
%          • InternalLink
%          • LinkTarget
%          • Text
%
%    Note: the custom element must be a valid HTML or DOCX child of this
%    heading, depending on whether the output type of the document to
%    which this heading is appended is HTML or DOCX, respectively.

%    Copyright 2015 MathWorks, Inc.
%    Built-in function.
