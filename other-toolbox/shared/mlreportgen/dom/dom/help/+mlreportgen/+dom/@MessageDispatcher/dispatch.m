%dispatch Dispatch a document generation status message
%    dispatch(dispatcher, message) dispatches a DOM status message.
%    More specifically, this method creates an MCOS event of type
%    'Message' that contains the specified message. You can display, log
%    or otherwise process messages by creating a listener for message
%    events.
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
%    See also mlreportgen.dom.MessageDispatcher.getTheDispatcher,
%    mlreportgen.dom.ErrorMessage, mlreportgen.dom.DebugMessage,
%    mlreportgen.dom.ProgressMessage, mlreportgen.dom.WarningMessage

%    Copyright 2014 MathWorks, Inc.
%    Built-in function.
