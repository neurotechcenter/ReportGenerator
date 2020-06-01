%mlreportgen.dom.ProgressMessage Progress message
%    msg = ProgressMessage('text', 'source') creates a progress message with
%    the specified text originating from the specified source object.
%
%    ProgressMessage methods:
%        formatAsHTML - Format message as HTML
%        formatAsText - Format with white space
%        passesFilter - Whether message passes filter
%
%    ProgressMessage properties:
%        Id     - Id of this message object
%        Source - Source of this message
%        Tag    - Tag of this message object
%        Text   - Text of this message
%
%    See also mlreportgen.dom.MessageDispatcher.dispatch

%    Copyright 2014 Mathworks, Inc.
%    Built-in class