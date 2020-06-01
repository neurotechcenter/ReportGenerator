%mlreportgen.dom.MessageFilter Filter to control message dispatcher
%    
%
%    MessageFilter properties:
%        DebugMessagesPass    - Pass or block debug messages
%        ErrorMessagesPass    - Pass or block error messages
%        GlobalFilter         - Pass or block all messages
%        ProgressMessagesPass - Pass or block progress messages
%        SourceFilter         - Pass messages only from this object
%        WarningMessagesPass  - Pass or block warning messages

%    Copyright 2014 Mathworks, Inc.
%    Built-in class

%{
properties
     %DebugMessagesPass Pass or block debug messages
     %      If true, pass debug messages; otherwise, block them.
     DebugMessagesPass;

     %ErrorMessagesPass Pass or block error messages
     %      If true, pass error messages; otherwise, block them.
     ErrorMessagesPass;

     %GlobalFilter Pass or block all messages 
     %      This property may have the following values:
     %
     %      VALUE  DESCRIPTION
     %      []      Pass all messages that meet other filter conditions
     %      'pass'  Pass all messages that meet other filter conditions
     %      'block' Block all messages
     GlobalFilter;

     %ProgressMessagesPass Pass or block progress messages
     %      If true, pass progress messages; otherwise, block them.
     ProgressMessagesPass;

     %SourceFilter Pass messages only from this object
     %      Pass messages only from the DOM object to which this property
     %      is set and then only if the messages meet the other filter
     %      conditions specified by this object.
     SourceFilter;

     %WarningMessagesPass Pass or block warning messages
     %      If true, pass warning messages; otherwise, block them.
     WarningMessagesPass;
end
%}