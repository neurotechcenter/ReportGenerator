% mlreportgen.dom
%
%   Use the following classes to create and format Word, HTML, and PDF
%   reports.
%
%
% Content Classes
% -----------------------------------------
%   
%   AutoNumber                  - An automatically generated number
%   AutoNumberStream            - Autonumber stream
%   CharEntity                  - Create a character entity reference.
%   Container                   - Container of document objects
%   CoreProperties              - OPC core properties of a document or template
%   CustomAttribute             - Custom element attribute
%   CustomElement               - Custom element of a document
%   CustomText                  - Plain text to be appended to a custom element
%   DOCXPageFooter              - Page footer for a Word document.
%   DOCXPageHdrFtr              - Page Base class for page header and footer
%   DOCXPageHeader              - Page header for a Word document.
%   DOCXPageLayout              - Page layout properties of a Word document
%   DOCXPageMargins             - Margins of pages in a Word page layout
%   DOCXPageSize                - Size, orientation of pages in a Word layout
%   DOCXRawFormat               - XML markup for an array of Word formats
%   DOCXSection                 - Page layout section of a Word document
%   DOCXSubDoc                  - Reference to an external Word document
%   Document                    - Create a dom document
%   DocumentPart                - Create a part of another document.
%   ExternalLink                - Create a hyperlink to an external target
%   FormalTable                 - Create a formal table
%   Group                       - Group of document objects
%   HTML                        - Convert HTML text to a group of dom objects
%   HTMLFile                    - Convert contents of HTML file to a group of dom objects
%   Heading                     - Create a heading paragraph.
%   Heading1                    - Create a heading paragraph.
%   Heading2                    - Create a heading paragraph.
%   Heading3                    - Create a heading paragraph.
%   Heading4                    - Create a heading paragraph.
%   Heading5                    - Create a heading paragraph.
%   Heading6                    - Create a heading paragraph.
%   HorizontalRule              - Create a horizontal rule.
%   Image                       - Create an image to be included in a report.
%   ImageArea                   - Defines an image area as a hyperlink
%   ImageMap                    - Map of hyperlinkable areas in an image
%   InternalLink                - Create a hyperlink to a target in this
%   Leader                      - Create a leader.
%   LineBreak                   - Force following content to start on a new line.
%   LinkTarget                  - Create a target for a hyperlink.
%   ListItem                    - Item in a list
%   MATLABTable                 - Convert a MATLAB table to a DOM table
%   NumPages                    - Insert the count of the total number of pages.
%   OPCPart                     - Part to be included in an OPC package
%   OrderedList                 - Ordered (numbered) list
%   PDFPageFooter               - Page footer for a Word document.
%   PDFPageHeader               - Page header for a Word document.
%   PDFPageLayout               - Page layout properties of PDF document
%   Page                        - Insert the current page number.
%   PageBreak                   - Force following content to start on a new page.
%   PageMargins                 - Margins of pages in a Word or PDF layout
%   PageNumber                  - initial value and format of page numbers in a page layout
%   PageRef                     - Create a reference to the target page.
%   Paragraph                   - Create a formatted block of text, i.e., a paragraph.
%   RawText                     - XML markup to be inserted in a document.
%   StyleRef                    - Create a reference based on a style.
%   TOC                         - Creates a table of contents for DOCX and PDF reports
%   Table                       - Create a table.
%   TableBody                   - Body section of a formal table
%   TableColSpec                - Defines style of a table column
%   TableColSpecGroup           - Defines style of a group of table columns
%   TableEntry                  - Create a table Entry
%   TableFooter                 - Footer section of a formal table
%   TableHeader                 - Header section of a formal table
%   TableHeaderEntry            - Entry in a table header
%   TableRow                    - Creates a table row
%   Template                    - Create a template for a document
%   TemplateHole                - Hole to be appended to a template
%   TemplateText                - XML markup from document template
%   Text                        - Create a text object.
%   UnorderedList               - Unordered (bulletted) list
%   Watermark                   - Watermark for a PDF page section
%
% Format Classes
% --------------
%
%   AllowBreakAcrossPages       - Allow row to straddle page break
%   BackgroundColor             - Background color of a document object
%   Bold                        - Bold format
%   Border                      - Border of a dom object
%   BorderCollapse              - Collapse HTML table borders
%   CSSProperties               - Set of CSS objects
%   CSSProperty                 - CSS property
%   ColSep                      - Draw lines between table columns
%   Color                       - Color of a document object
%   CounterInc                  - Increment an auto number counter
%   CounterReset                - Reset an auto number counter
%   Display                     - CSS Display property
%   FOProperties                - Array of FO format objects
%   FOProperty                  - FO property
%   FirstLineIndent             - Indent first line of a paragraph
%   FlowDirection               - Direction of text flow
%   FontFamily                  - Font family
%   FontSize                    - Font size
%   HAlign                      - Horizontal alignment of a document object
%   Height                      - Height of an image
%   InnerMargin                 - Margin between content and bounding box
%   Italic                      - Italic format
%   KeepLinesTogether           - Start paragraph on new page if necessary
%   KeepWithNext                - Keep paragraph on same page as next
%   LineSpacing                 - Spacing between lines of a paragraph
%   ListStyleType               - Type of list-item marker for a list
%   OuterMargin                 - Margin between bounding box and surroundings
%   OutlineLevel                - Level of paragraph in an outline
%   PageBreakBefore             - Always start paragraph on new page
%   PageMargins                 - Margins of pages in a Word or PDF layout
%   PageNumber                  - initial value and format of page numbers in a page layout
%   PageSize                    - Size, orientation of pages in a Word or PDF layout
%   RepeatAsHeaderRow           - Repeat header row
%   ResizeToFitContents         - Allow table to resize its columns
%   RowHeight                   - Height of a table row
%   RowSep                      - Draw lines between table rows
%   ScaleToFit                  - Scale an image to fit a page
%   Strike                      - Strike through text
%   TextOrientation             - Text orientation in a table entry or row
%   Underline                   - Draw line under text
%   VAlign                      - Vertical alignment of a document object
%   VerticalAlign               - Vertical alignment of text
%   WhiteSpace                  - Preserve white space
%   WidowOrphanControl          - Prevent widows and orphans
%   Width                       - Width of an image or table entry
%
% Report Message Classes
% ----------------------
%
%   DebugMessage                - Debug message
%   ErrorMessage                - Error message
%   MessageDispatcher           - dom message dispatcher
%   MessageEventData            - Holds message triggering a message event
%   MessageFilter               - Filter to control message dispatcher
%   ProgressMessage             - Progress message
%   WarningMessage              - Warning message     
%__________________________________________________________________________

%   Copyright 2016 The MathWorks, Inc.

