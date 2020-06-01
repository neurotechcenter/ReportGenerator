%mlreportgen.dom.ErrorMessage Error message
%    msg = ErrorMessage('text', 'source') creates a error message with
%    the specified text originating from the specified source object.
%
%    ErrorMessage methods:
%        formatAsHTML - Format message as HTML
%        formatAsText - Format with white space
%        passesFilter - Whether message passes filter
%
%    ErrorMessage properties:
%        Id     - Id of this message object
%        Source - Source of this message
%        Tag    - Tag of this message object
%        Text   - Text of this message
%
%    See also mlreportgen.dom.MessageDispatcher.dispatch

%    Copyright 2014 Mathworks, Inc.
%    Built-in class