%createAutoNumberStream Create an auto number stream for this document
%    stream = createAutoNumberStream(doc, 'name', 'type', initValue) 
%    creates a stream of the specified name, e.g., 'chapter', and type and 
%    the  specified initial value and associates it with this document. The
%    stream type parameter indicates the type of characters used to 
%    represent the auto number values. 
%
%        VALUE     DESCRIPTION
%         'a'      Lower case alphabetic (a, b, c, ...)
%         'A'      Upper case alphabetic (A, B, C, ...)
%         'i'      Lower case roman numerals (i, ii, iii, ...)
%         'I'      Uppercase roman numerals (I, II, III, ...)
%         'n'      Arabic numerals
%         'N'      Arabic numerals
%
%    stream = createAutoNumberStream(doc, 'name', 'type') 
%    creates a stream of the specified name, e.g., 'chapter', and type 
%    with an initial value of 0 and associates it with this document.
%    stream = createAutoNumberStream(doc, 'name', 'type') 
%
%    stream = createAutoNumberStream(doc, 'name') 
%    creates an Arabic stream of the specified name, e.g., 'chapter',
%    with an initial value of 0 and associates it with this document. 
%
%    See also mlreportgen.dom.AutoNumberStream, 
%    mlreportgen.dom.Document.getAutoNumberStream

%    Copyright 2014 Mathworks, Inc.
%    Built-in method

