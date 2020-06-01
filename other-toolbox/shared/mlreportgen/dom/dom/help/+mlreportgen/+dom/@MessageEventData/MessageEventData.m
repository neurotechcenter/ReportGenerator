%mlreportgen.dom.MessageEventData Holds message triggering a message event
%    data = MessageEventData(msg) creates a message event data object 
%    that contains a DOM message, e.g., a message of type 
%    mlreportgen.dom.ProgressMessage.
%
%    Note: the DOM message dispatcher attaches an object of this type
%    to a Message event when it dispatches a message. This enables
%    Message event listeners to retrieve the dispatched message. 
%    You need to create instances of this type only if you want to create
%    your own message dispatcher.
%
%    MessageEventData properties:
%        Id      - Id of this object
%        Message - A message object (read-only)
%        Tag     - Tag of this object
%
%    Example:
%
%    import mlreportgen.dom.*;
%    doctype = 'html';
%    d = Document('test', doctype);
%    d.Tag = 'My report';
%    
%    dispatcher = MessageDispatcher.getTheDispatcher;
%    l = addlistener(dispatcher, 'Message', ...
%        @(src, evtdata) disp(evtdata.Message.formatAsText));
%    
%    open(d);
%    dispatch(dispatcher, ProgressMessage('starting chapter', d));
%    p = Paragraph('Chapter ');
%    p.Tag = 'chapter title';
%    p.Style = { CounterInc('chapter'), CounterReset('table'), WhiteSpace('pre') };
%    append(p, AutoNumber('chapter'));
%    append(d, p);
%    
%    close(d);
%    rptview('test', doctype);
%    
%    delete (l);
%
%    See also mlreportgen.dom.MessageDispatcher


%    Copyright 2014 Mathworks, Inc.
%    Built-in class

%{
properties

     %Message mlreportgen.dom message object
     %
     %  The value of this read-only property is a DOM message object,
     %  such as a mlreportgen.dom.ProgressMessage.
     %
     Message;
end
%}