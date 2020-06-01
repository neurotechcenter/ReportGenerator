%append Append content to a table entry
%     textObj = append(entry, 'text') wraps 'text' in a 
%     Paragraph object and appends the Paragraph object to the table entry.
%     The text is wrapped in a paragraph in all output types to be
%     consistent with Microsoft Word, which does not allow table entries
%     to contain unwrapped text.
%
%     Note: text wrapping can cause unexpected behavior in HTML and PDF
%     output. For example, in HTML output, the text in the table entry is
%     surrounded by substantial white space. This is because browsers by
%     default surround paragraphs with substantial white space. If you want
%     to make your tables more compact, you can either change the default
%     formatting of p elements in your report style sheet to minimize the
%     amount of white space surrounding paragraphs or you can wrap your
%     text yourself in a paragraph with minimum surrounding white space.
%     Use the DOM OuterMargin format or the CSS margin format to specify
%     the surrounding white space of the paragraph.
%
%     textObj = append(entry, 'text', 'StyleName') wraps 'text' in a 
%     Paragraph object and appends the Paragraph object to the table entry.
%     The text is wrapped in a paragraph in all output types to be
%     consistent with Microsoft Word, which does not allow table entries
%     to contain unwrapped text.

%
%     domObj = append(entry, domObj) creates a table entry containing 
%     domObj, where domObj is an object of any of the following types:
%
%         * CustomElement
%         * HTML
%         * HTMLFile
%         * HorizontalRule
%         * Image
%         * LineBreak
%         * OrderedList
%         * NumPages
%         * Page
%         * PageRef
%         * Paragraph
%         * StyleRef
%         * UnorderedList
%         * Table
%         * Text
%
%    This method wraps the Text object in a Paragraph object and appends
%    the Paragraph object to the table entry.
%
%    Copyright 2013-2017 MathWorks, Inc.
%    Built-in function.
