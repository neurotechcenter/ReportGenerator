%mlreportgen.dom.Message Status message
%
%    Message methods:
%        formatAsHTML - Format message as HTML
%        formatAsText - Format with white space
%        passesFilter - Whether message passes filter
%
%    Message properties:
%        Id     - Id of this message object
%        Source - Source of this message
%        Tag    - Tag of this message object
%        Text   - Text of this message

%    Copyright 2014 Mathworks, Inc.
%    Built-in class

%{
properties
     %Source Source of this message
     %      Object that created this message
     Source;

     %Text Text of this message
     Text;
end
%}