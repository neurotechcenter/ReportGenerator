%mlreportgen.dom.ListItem Item in a list
%    itemObj = ListItem() creates an empty list item.
%
%    itemObj = ListItem('text') creates a list item containing the 
%    specified text string.
%
%    itemObj = ListItem('text', 'styleName') creates a list item containing 
%    a mlreportgen.dom.Text object constructed from the specified text
%    string and having the specified style name.
%
%    itemObj = ListItem(domObj) creates a list item containing 
%    the specified DOM object, which can be either of the following types:
%
%        * Paragraph
%        * Text
%
%    ListItem methods:
%        append         - Append a MATLAB or DOM object to this part
%        clone          - Clone this item
%
%    ListItem properties:
%        Children          - Children of this list item
%        CustomAttributes  - Custom item attributes
%        Id                - Id of this item
%        Parent            - Parent of this item
%        Style             - Formats that define this item's style
%        Tag               - Tag of this item

%    Copyright 2014 Mathworks, Inc.
%    Built-in class
