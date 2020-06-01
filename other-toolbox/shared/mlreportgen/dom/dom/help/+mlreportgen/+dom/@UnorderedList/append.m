%append Append items to list
%    list = append(list, item) appends a ListItem to the list.
%    
%    list = append(list, items) appends a cell array of strings
%    to the list.
%
%    list = append(list, ulist) appends an UnorderedList item to the list.
%
%    list = append(list, olist) appends an OrderedList item to the list.
%
%    customElemObj = append(list, customElemObj) appends a 
%    CustomElement to this list.
%
%    Note: the custom element must be a valid HTML or DOCX child of a
%    list, depending on whether the output type of the document to
%    which this element is appended is HTML or DOCX, respectively.
%
%    See also mlreportgen.dom.OrderedList

%    Copyright 2014 MathWorks, Inc.
%    Built-in function.
