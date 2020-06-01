%mlreportgen.dom.UnorderedList Unordered (bulletted) list
%    list = UnorderedList() creates an empty list.
%
%    list = UnorderedList(array) creates an UnorderedList object from a 
%    1xN array of double values, 1xN array of strings or a 
%    1xN categorical array.
%
%    list = UnorderedList(items) creates an unordered list from a 
%    1xN cell array of objects. Valid object types include:
%
%        * char array (string)
%        % double
%        % 1xN cell array of objects (list item)
%        % MxN cell array of objects (table item)
%        % mlreportgen.dom.Text
%        % mlreportgen.dom.Paragraph
%        % mlreportgen.dom.Table
%        % mlreportgen.dom.Image
%        % mlreportgen.dom.UnorderedList
%        % mlreportgen.dom.OrderedList
%
%    Example:
%
%        import mlreportgen.dom.*;
%        d = Document('mydoc');
%        ul = UnorderedList({Text('a'), 'b', 1, {'c', Paragraph('d')}});
%        append(d, ul);
%        close(d):
%        rptview('mydoc', 'html');
%
%    UnorderedList methods:
%        append         - Append a MATLAB or DOM object to this part
%        clone          - Clone this part
%
%    UnorderedList properties:
%        CustomAttributes  - Custom list attributes
%        Id                - Id of this list
%        Style             - Formats that define this list's style
%        StyleName         - Name of list's stylesheet-defined style
%        Tag               - Tag of this list
%
%    See also mlreportgen.dom.OrderedList

%    Copyright 2014 Mathworks, Inc.
%    Built-in class