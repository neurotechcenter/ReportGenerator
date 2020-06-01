%mlreportgen.dom.DebugMessage Debug message
%    msg = DebugMessage('text', 'source') creates a debug message with
%    the specified text originating from the specified source object.
%
%    DebugMessage methods:
%        formatAsHTML - Format message as HTML
%        formatAsText - Format with white space
%        passesFilter - Whether message passes filter
%
%    DebugMessage properties:
%        Id     - Id of this message object
%        Source - Source of this message
%        Tag    - Tag of this message object
%        Text   - Text of this message
%
%    See also mlreportgen.dom.MessageDispatcher.dispatch

%    Copyright 2014 Mathworks, Inc.
%    Built-in class