% MATLAB Report Generator
% Version 5.6 (R2019a) 23-Nov-2018
%
% MATLAB Report Generator
%
% Report Generator Functions
%   report          - Generate a report from a .rpt file.
%   setedit         - Graphically edit a .rpt file.
%   rptviewfile     - View generated report files.
%   rptconvert      - Transform a source file to a report format.
%   rpteditstyle    - Create and edit document transform stylesheets.
%   compwiz         - Create custom Report Generator components.
%   rptrelatedfiles - Find all files related to a report.
%
% Word and HTML Template-Based Report Functions
%   rptview       - Display a template-based report (html, ddocx, pdf)
%   unzipTemplate - Unzip an HTML (htmtx) template 
%   zipTemplate   - Zip an HTML (htmtx) template
%
% Template-Based Report (DOM) Objects
%   mlreportgen.dom.AutoNumber        - Auto number
%   mlreportgen.dom.AutoNumberStream  - Auto number stream
%   mlreportgen.dom.CharEntity        - Special character
%   mlreportgen.dom.CoreProperties    - Core properties of a document or template
%   mlreportgen.dom.CustomAttribute   - Custom attribute of a document element
%   mlreportgen.dom.CustomElement     - Custom document element
%   mlreportgen.dom.CustomText        - Text to be included in a custom element
%   mlreportgen.dom.DebugMessage      - Debug message
%   mlreportgen.dom.Document          - HTML, Microsoft Word, or PDF document
%   mlreportgen.dom.DocumentPart      - Part of a document
%   mlreportgen.dom.DOCXPageFooter    - Footer of a Word document page
%   mlreportgen.dom.DOCXPageHeader    - Header of a Word document page
%   mlreportgen.dom.DOCXSection       - Section of a Word document page layout
%   mlreportgen.dom.DOCXSubDoc        - Reference to another Word document to be included in the current document
%   mlreportgen.dom.ErrorMessage      - Error message
%   mlreportgen.dom.ExternalLink      - Hyperlink to an external link target
%   mlreportgen.dom.FormalTable       - Table with header, footer, and body sections
%   mlreportgen.dom.Group             - Group of document objects
%   mlreportgen.dom.Heading           - Heading of a document section
%   mlreportgen.dom.Image             - Image
%   mlreportgen.dom.ImageArea         - Area of an image that serves as a hyperlink
%   mlreportgen.dom.ImageMap          - Map of hyperlink areas in an iamge
%   mlreportgen.dom.InternalLink      - Hyperlink to a link target (anchor) in this document
%   mlreportgen.dom.LinkTarget        - Target (anchor) for a hyperlink
%   mlreportgen.dom.ListItem          - Item in an unordered or ordered list
%   mlreportgen.dom.MessageDispatcher - Dispatcher for document generation status messages
%   mlreportgen.dom.MessageEventData  - Contains the message that triggered a Message event
%   mlreportgen.dom.MessageFilter     - Filter for messages dispatched by the messsage dispatcher
%   mlreportgen.dom.OPCPart           - Part of a document's OPC package
%   mlreportgen.dom.OrderedList       - OrderedList
%   mlreportgen.dom.Paragraph         - Paragraph
%   mlreportgen.dom.ProgressMessage   - Progress message
%   mlreportgen.dom.RawText           - Word or HTML markup to insert in a document
%   mlreportgen.dom.Table             - Table
%   mlreportgen.dom.TableBody         - Body section of a formal table
%   mlreportgen.dom.TableColSpec      - Properties (e.g., width) of a table column
%   mlreportgen.dom.TableColSpecGroup - Group of table column specs
%   mlreportgen.dom.TableEntry        - Table entry
%   mlreportgen.dom.TableFooter       - Footer section of a formal table
%   mlreportgen.dom.TableRow          - Table row
%   mlreportgen.dom.TableHeader       - Header section of a formal table
%   mlreportgen.dom.TableHeaderEntry  - Entry in the header section of a table
%   mlreportgen.dom.Template          - Template for a document
%   mlreportgen.dom.TemplateHole      - Hole to be appended to a document template
%   mlreportgen.dom.TemplateText      - Text from template to be included in output document
%   mlreportgen.dom.Text              - String of characters
%   mlreportgen.dom.UnorderedList     - UnorderedList
%   mlreportgen.dom.WarningMessage    - Warning message
%
% Report Format Objects
%   mlreportgen.dom.AllowBreakAcrossPages   - Allow table row to straddle a page boundary
%   mlreportgen.dom.BackgroundColor         - Background color of a DOM object, such as a paragraph
%   mlreportgen.dom.Bold                    - Font weight of document text
%   mlreportgen.dom.Border                  - Border of a DOM object
%   mlreportgen.dom.BorderCollapse          - Collapse adjacent borders of an HTML table into a single border
%   mlreportgen.dom.Color                   - Color of a document object, e.g., text or table border
%   mlreportgen.dom.ColSep                  - Draw lines between table columns
%   mlreportgen.dom.CounterInc              - Increment auto number counter
%   mlreportgen.dom.CounterReset            - Reset auto number counter
%   mlreportgen.dom.DOCXPageMargins         - Margins of pages in a DOCX page layout section
%   mlreportgen.dom.DOCXPageSize            - Size and orientation of pages in a DOCX page layout section
%   mlreportgen.dom.DOCXRawFormat           - XML markup for a Word format
%   mlreportgen.dom.FirstLineIndent         - Indent first line of paragraph
%   mlreportgen.dom.FlowDirection           - Direction of text flow across page (left to right or right to left)
%   mlreportgen.dom.FontFamily              - Font family
%   mlreportgen.dom.FontSize                - Font size
%   mlreportgen.dom.HAlign                  - Align object relative to sides of its container
%   mlreportgen.dom.Height                  - Height of an image
%   mlreportgen.dom.InnerMargin             - Space between the content and bounding box of a document object
%   mlreportgen.dom.Italic                  - Slant of a document text
%   mlreportgen.dom.KeepLinesTogether       - Start paragraph on new page if it cannot fit on current page
%   mlreportgen.dom.KeepWithNext            - Keep paragraph on the same page as the paragraph that follows it
%   mlreportgen.dom.LineSpacing             - Spacing between lines of a paragraph
%   mlreportgen.dom.OuterMargin             - Space between a document object and its surroundings
%   mlreportgen.dom.OutlineLevel            - Level of a paragraph in an outline, e.g., a table of contents
%   mlreportgen.dom.PageBreakBefore         - Always start paragraph on a new page
%   mlreportgen.dom.RepeatAsHeaderRow       - Repeat as header row when table flows across multiple pages
%   mlreportgen.dom.RowHeight               - Height of a table row
%   mlreportgen.dom.RowSep                  - Draw lines between table rows
%   mlreportgen.dom.ScaleToFit              - Scale an image to fit a page
%   mlreportgen.dom.Strike                  - Strike through text
%   mlreportgen.dom.Underline               - Draw line under text
%   mlreportgen.dom.VAlign                  - Align object relative to top and bottom of its container
%   mlreportgen.dom.VerticalAlign           - Vertical alignment of text relative to baseline (e.g., superscript)
%   mlreportgen.dom.WhiteSpace              - Preserve white space in text
%   mlreportgen.dom.WidowOrphanControl      - Prevent a page break after the first or before the last line line of a Word paragraph
%   mlreportgen.dom.Width                   - Width of a table or image
%
% Formatting Components
%   rptgen.cfr_image               - Image
%   rptgen.cfr_link                - Link
%   rptgen.cfr_list                - List
%   rptgen.cfr_paragraph           - Paragraph
%   rptgen.cfr_section             - Chapter/Subsection
%   rptgen.cfr_table               - Table
%   rptgen.cfr_text                - Text
%   rptgen.cfr_titlepage           - Title Page
%
% Handle Graphics Components
%   rptgen_hg.chg_ax_loop          - Axes Loop
%   rptgen_hg.chg_ax_snap          - Axes Snapshot
%   rptgen_hg.chg_fig_loop         - Figure Loop
%   rptgen_hg.chg_fig_snap         - Figure Snapshot
%   rptgen_hg.chg_obj_anchor       - Handle Graphics Linking Anchor
%   rptgen_hg.chg_obj_loop         - Object Loop
%   rptgen_hg.chg_obj_name         - Handle Graphics Name
%   rptgen_hg.chg_prop_table       - Handle Graphics Property Table
%   rptgen_hg.chg_property         - Handle Graphics Parameter
%   rptgen_hg.chg_summ_table       - Handle Graphics Summary Table
%
% Logical & Flow Control Components
%   rptgen_lo.clo_else             - Logical Else
%   rptgen_lo.clo_else_if          - Logical Elseif
%   rptgen_lo.clo_for              - For Loop
%   rptgen_lo.clo_if               - Logical If
%   rptgen_lo.clo_then             - Logical Then
%   rptgen_lo.clo_while            - While Loop
%
% MATLAB Components
%   rptgen.cml_eval                - Evaluate MATLAB Expression
%   rptgen.cml_variable            - Insert Variable
%   rptgen.cml_ver                 - MATLAB/Toolbox Version Number
%   rptgen.cml_whos                - Variable Table
%   rptgen.cml_prop_table          - MATLAB Property Table
%
% Report Generator Components
%   rptgen.crg_comment             - Comment
%   rptgen.crg_empty               - Empty Component
%   rptgen.crg_halt_gen            - Stop Report Generation
%   rptgen.crg_import_file         - Import File
%   rptgen.crg_nest_set            - Nest Setup File
%   rptgen.crg_tds                 - Time/Date Stamp
%

%   Copyright 1997-2018 The MathWorks, Inc.
