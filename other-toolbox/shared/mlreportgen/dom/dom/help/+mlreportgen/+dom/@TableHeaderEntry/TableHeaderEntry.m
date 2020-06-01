%mlreportgen.dom.TableHeaderEntry Entry in a table header
%   
%     entryObj = TableHeaderEntry() creates an empty table header entry.
%
%     entryObj = TableHeaderEntry('text') creates a table header header entry containing a Text 
%     object containing the specified text.
%
%     entryObj = TableHeaderEntry('text', 'StyleName') creates a table header entry 
%     containing a Text object containing the specified text and having 
%     the specified style.
%
%     entryObj = TableHeaderEntry(domObj) creates a table header entry containing 
%     domObj, where domObj is an object of any of the following types:
%
%         * CustomElement
%         * Image
%         * OrderedList
%         * Paragraph
%         * UnorderedList
%         * Table
%         * Text
%
%     Note: This class is intended primarily to support HTML table
%     creation. It is rendered in an HTML document as a th (table header
%     cell) element. Use of this element eliminates the need to format
%     a table header entry explicitly. Instead, it relies on the browser
%     to render the header entry appropriately. For Word and PDF output, 
%     the DOM API treats a TableHeaderEntry as a TableEntry.
%
%    TableHeaderEntry methods:
%        append         - Append a MATLAB or DOM object to this part
%        clone          - Clone this part
%
%    TableHeaderEntry properties:
%        Border            - Type of border to draw around this entry
%        BorderColor       - Color of border drawn around this entry
%        BorderWidth       - Width of border drawn around this entry
%        ColSpan           - Number of columns spanned by this entry
%        CustomAttributes  - Custom element attributes
%        Id                - Id of this element
%        InnerMargin       - Inner margin (padding) around this entry
%        RowSpan           - Number of rows spanned by this table entry
%        Style             - Formats that define this element's style
%        StyleName         - Name of element's stylesheet-defined style
%        Tag               - Tag of this element
%        Valign            - Vertical alignment of this table entry

%    Copyright 2014-2015 Mathworks, Inc.
%    Built-in class