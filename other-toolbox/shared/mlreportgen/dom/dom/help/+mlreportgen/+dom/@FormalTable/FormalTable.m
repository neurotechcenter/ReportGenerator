% mlreportgen.dom.FormalTable Create a formal table
%     tableObj = FormalTable() creates an empty formal table.
%
%     tableObj = FormalTable(ncols) creates an empty formal table whose
%     header, body, and footer sections each have the specified number of
%     columns.
%
%     tableObj = FormalTable(body_array) creates a formal table whose body 
%     content is specified by a two-dimensional numeric array, a 
%     two-dimensional categorical array, or a two-dimensional cell array 
%     of MATLAB data types (e.g., strings or a two-dimensional array),
%     or DOM objects (e.g., paragraphs or images). The constructor converts
%     basic MATLAB types to corresponding DOM types, e.g., strings to Text objects.
%
%     tableObj = FormalTable(body_array, 'StyleName') creates a formal table 
%     having the specified table style name and body content The style 
%     specified by 'StyleName'  must be defined in the template used to
%     create the document to which this table is appended.
%
%     tableObj = FormalTable(header_array, body_array) creates a formal 
%     table whose header and body content are specified by header_array
%     and body_array, respectively.
%
%     tableObj = FormalTable(header_array, body_array, 'styleName') creates 
%     a formal table whose header and body content are specified by header_array
%     and body_array, respectively, and whose style is specified by 
%     'styleName'.
%
%     tableObj = FormalTable(header_array, body_array, footer_array) 
%     creates a formal table whose header, body, and footer content are 
%     specified by header_array, body_array, and footer_array,
%     respectively.
%
%     tableObj = FormalTable(matlabTable) returns a DOM table having the 
%     content and format specified by the specified MATLAB table. 
%
%     tableObj = FormalTable(matlabTable, 'StyleName') returns a DOM table 
%     having the content and format specified by the Matlab table and the
%     style specified by style name. The style specified by 'StyleName'
%     can override the format specified by the MATLAB table.
%
%    FormalTable properties:
%      BackgroundColor         - Color of this table's background
%      Body                    - Body section of this table
%      Border                  - Type of border to be drawn around table
%      BorderColor             - Color of this table's border
%      BorderCollapse          - Whether to collapse borders (HTML only)
%      BorderWidth             - Width of this table's border
%      Children                - Children (sections) of this table
%      ColSep	               - Type of line to be drawn between columns
%      ColSepColor             - Color of this table's column separator
%      ColSepWidth             - Width of this table's column separator
%      BorderWidth             - Width of this table's border
%      ColSpecGroups           - Array of table column group properties
%      CustomAttributes        - Custom attributes of this table
%      FlowDirection           - Direction of text flow in this table
%      Footer                  - Footer section of this table
%      Id                      - Id of this table
%      HAlign                  - Horizontal alignment of this table
%      Header                  - Header section of this table
%      NCols                   - Number of columns in this table
%      OuterLeftMargin         - Outer left margin (indent) of this table
%      Parent                  - Parent of this table
%      RowSep                  - Type of line to be drawn between rows
%      RowSepColor             - Color of this table's row separator
%      RowSepWidth             - Width of this table's row separator
%      Style                   - Formats that apply to this table
%      StyleName               - Name of table defined in a stylesheet
%      TableEntriesHAlign      - Default horizontal alignment of entries
%      TableEntriesInnerMargin - Inner margin (padding) of table's entries
%      TableEntriesStyle       - Style of this table's table entries
%      TableEntriesVAlign      - Default vertical alignment of entries
%      Tag                     - Tag of this table
%      Width                   - Width of this table
%
%    FormalTable methods:
%      append          - Append a row of table entries to this table.
%      appendFooterRow - Append a row to this table's footer.
%      appendHeaderRow - Append a row to this table's header.
%      clone           - Clone this table
%
%    Note: You can set the StyleName property of any of a formal table's
%    sections, thereby overriding the style specified by the formal table
%    itself. However, if you do this for a Word document, you must 
%    explicitly specify the width of each section's columns to ensure
%    that all sections have the same width. This is because Word, unlike
%    HTML and PDF, has no built-in support for formal tables, forcing the DOM
%    API to simulate a formal table as three tables, one for each section,
%    embedded in a 3x1 table.
%
%    See also mlreportgen.dom.Table, mlreportgen.dom.TableBody,
%    mlreportgen.dom.TableHeader, mlreportgen.dom.TableFooter

%    Copyright 2014-2017 Mathworks, Inc.
%    Built-in class

%{
properties

     %BackgroundColor Color of this table's background
     %    The value of this property may be a color name (e.g., 'blue')
     %    or a hexadecimal RGB value (e.g., '#0000ff').
     %
     %    See http://www.crockford.com/wrrrld/color.html for a list
     %    of valid color names.
     BackgroundColor;

     %Body Body section of this table (read-only)
     %    A formal table constructor creates a table body object and
     %    assigns it to this property when the formal table is 
     %    constructed. You cannot subsequently set this property.
     %    However, you can append content to the table body and set
     %    its properties via this property.
     %
     %    See also mlreportgen.dom.TableBody
     Body;

     %Border Type of border to draw around this table. 
     %    Valid types are:  
     %
     %                                                    Applies To
     %    VALID VALUE                 DESCRIPTION	      DOCX HTML/PDF
     %    'dashed'                    dashed line          X    X
     %    'dashdotstroked'                                 X
     %    'dashsmallgap'              dashed line          X
     %    'dotted'                    dotted line          X    X
     %    'dotdash'                   dot dash line        X	 	
     %    'dotdotdash'                dot dot dash line    X
     %    'double'                    double line          X    X
     %    'doublewave'                double wavy line     X 	
     %    'inset'                                          X    X
     %    'none'                      no border            X    X
     %    'outset'                                         X    X
     %    'single'                    single line          X
     %    'solid'                     single line               X
     %    'thick'                     thick line           X
     %    'thickthinlargegap'                              X
     %    'thickthinmediumgap'                             X
     %    'thickthinsmallgap'                              X
     %    'thinthicklargegap'                              X
     %    'thinthicksmallgap'                              X
     %    'thinthickmediumgap'                             X
     %    'thinthickthinlargegap'                          X
     %    'thinthickthinmediumgap'                         X
     %    'thinthickthinsmallgap'                          X
     %    'threedemboss'                                   X
     %    'threedengrave'                                  X
     %    'triple'                    triple line          X
     %    'wave'                      wavy line            X
     %
     %    Note: Setting this property adds a corresponding Border format 
     %    object to this paragraph's Style property. Unsetting this 
     %    property removes the object.
     Border;

     %BorderCollapse Whether to collapse cell borders (HTML only)
     %    Valid values are:
     %
     %    VALUE        DESCRIPTION 
     %    []           Determined by browser
     %    'on'         collapse
     %    'off'        separate
     BorderCollapse;

     %BorderColor Color of this table's border
     %    
     %    The value of this property may be a color name (e.g., 'blue')
     %    or a hexadecimal RGB value (e.g., '#0000ff').
     %
     %    See http://www.crockford.com/wrrrld/color.html for a list
     %    of valid color names.
     BorderColor;

     %BorderWidth Width of this table's border
     %    The value of this property is a string having the 
     %    format valueUnits where Units is an abbreviation for the units 
     %    in which the size is expressed. The following abbreviations are
     %    valid:
     %
     %    Abbreviation  Units
     %
     %    px            pixels
     %    cm            centimeters
     %    in            inches
     %    mm            millimeters
     %    pc            picas
     %    pt            points
     BorderWidth;

     %ColSep Type of line to draw between columns of this table
     %    This property accepts the same set of values as the table's 
     %    Border property. 
     ColSep;

     %ColSepColor Color of this table's column separator
     %    The value of this property may be a color name (e.g., 'blue')
     %    or a hexadecimal RGB value (e.g., '#0000ff').
     %
     %    See http://www.crockford.com/wrrrld/color.html for a list
     %    of valid color names.
     ColSepColor;

     %ColSepWidth Width of this table's column separator
     %    The value of this property is a string having the 
     %    format valueUnits where Units is an abbreviation for the units 
     %    in which the size is expressed. The following abbreviations are
     %    valid:
     %
     %    Abbreviation  Units
     %
     %    px            pixels
     %    cm            centimeters
     %    in            inches
     %    mm            millimeters
     %    pc            picas
     %    pt            points
     ColSepWidth;

     %ColSpecGroups Array of table column group properties
     %    Array of TableColSpecGroup objects that specify the width, 
     %    alignment and other properties of a group of this table's columns. 
     %    The first col spec group object applies to the first group of 
     %    table columns, the second to the second group, etc. The number
     %    of columns belonging to each group is specified by the col spec 
     %    group's Span property. For example, if the first col spec group 
     %    object has a span of 2, it applies to the first two columns of 
     %    the table. If the second group has a span of 3, it applies to
     %    the next three columns in the table, etc.
     %
     %    Example
     %
     %    The following code sets the width and color of the first column of a table.
     %    import mlreportgen.dom.*
     %    doc = Document('mydoc', 'docx');
     %    grps(1) = TableColSpecGroup;
     %    grps(1).Span = 1;
     %    grps(1).Style = {Color('red'), Width('1in')};
     %    table = Table(magic(5));
     %    table.ColSpecGroups = grps;
     %    append(doc, table);
     %    close(doc);
     %
     ColSpecGroups;

     %Footer Footer section of this table (read-only)
     %    A formal table constructor creates a table footer object and
     %    assigns it to this property when the formal table is 
     %    constructed. You cannot subsequently set this property.
     %    However, you can append content to the table header and set
     %    its properties via this property.
     %
     %    See also mlreportgen.dom.TableFooter
     Footer;

     %HAlign Horizontal alignment of this table
     %    Valid values are:
     %
     %    VALUE        DESCRIPTION
     %    'center'	   Align center
     %    'left'       Align left
     %    'right'      Align right
     HAlign;

     %Header Header section of this table (read-only)
     %    A formal table constructor creates a table header object and
     %    assigns it to this property when the formal table is 
     %    constructed. You cannot subsequently set this property.
     %    However, you can append content to the table header and set
     %    its properties via this property.
     %
     %    See also mlreportgen.dom.TableHeader
     Header;

     %NCols Number of columns in this table
     NCols;

     %RowSep Type of line to draw between rows of this table
     %    This property accepts the same set of values as the table's 
     %    Border property. 
     RowSep;

     %RowSepColor Color of this table's row separator
     %    The value of this property may be a color name (e.g., 'blue')
     %    or a hexadecimal RGB value (e.g., '#0000ff').
     %
     %    See http://www.crockford.com/wrrrld/color.html for a list
     %    of valid color names.
     RowSepColor;

     %RowSepWidth Width of this table's row separator
     %    The value of this property is a string having the 
     %    format valueUnits where Units is an abbreviation for the units 
     %    in which the size is expressed. The following abbreviations are
     %    valid:
     %
     %    Abbreviation  Units
     %
     %    px            pixels
     %    cm            centimeters
     %    in            inches
     %    mm            millimeters
     %    pc            picas
     %    pt            points
     RowSepWidth;

     %OuterLeftMargin Outer left margin (indent) of this table
     %    The value of this property is a string having the 
     %    format valueUnits where Units is an abbreviation for the units 
     %    in which the size is expressed. The following abbreviations are
     %    valid:
     %
     %    Abbreviation  Units
     %
     %    px            pixels
     %    cm            centimeters
     %    in            inches
     %    mm            millimeters
     %    pc            picas
     %    pt            points
     %OuterLeftMargin;

     %TableEntriesHAlign Horizontal alignment of entries
     %    Valid values are:
     %
     %    VALUE        DESCRIPTION
     %    []           Determined by Web browser or Word
     %    'center'	   Align center
     %    'left'       Align left
     %    'right'      Align right
     %
     %    Note: horizontal alignment is apparent only if the column is
     %    wide enough.
     %
     %    Note: setting this property appends an HAlign format to 
     %    the TableEntriesStyle property of this table.
     TableEntriesHAlign;

     %TableEntriesInnerMargin Inner margin (padding) of table's entries
     %    The value of this property is a string having the 
     %    format valueUnits where Units is an abbreviation for the units 
     %    in which the size is expressed. The following abbreviations are
     %    valid:
     %
     %    Abbreviation  Units
     %
     %    px            pixels
     %    cm            centimeters
     %    in            inches
     %    mm            millimeters
     %    pc            picas
     %    pt            points
     %
     %    Note: setting this property appends an InnerMargin format to 
     %    the TableEntriesStyle format array of this table.
     TableEntriesInnerMargin;

     %TableEntriesStyle Style of table entries
     %    The value of this property must be a cell array of format
     %    objects that define the style of this table's entries.
     %
     %    Note: Be careful not to inadvertently overwrite a previous
     %    setting of this property. For example, setting this table's
     %    TableEntriesHAlign property appends an HAlign format object
     %    to this property. To avoid overwriting this property, you should
     %    set this property before setting other table properties that
     %    append formats to this property.
     %
     TableEntriesStyle

     %TableEntriesVAlign Vertical alignment of entries
     %    Valid values are:
     %
     %    VALUE        DESCRIPTION
     %    []           Determined by Web browser or Word
     %    'middle'	   Align middle
     %    'top'        Align top
     %    'bottom'     Align bottom
     %
     %    Note: vertical alignment is apparent only if the row is high
     %    enough.
     %
     %    Note: setting this property appends a VAlign format to 
     %    the TableEntriesStyle property of this table.
     TableEntriesVAlign;

     %Width Width of this table
     %    The value of this property is a string having the 
     %    format valueUnits where Units is an abbreviation for the units 
     %    in which the size is expressed. The following abbreviations are
     %    valid:
     %
     %    Abbreviation  Units
     %
     %    px            pixels
     %    cm            centimeters
     %    in            inches
     %    mm            millimeters
     %    pc            picas
     %    pt            points
     Width;
end
%}

