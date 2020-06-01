% mlreportgen.dom.Table Create a table.
%     tableObj = Table(ncols) returns an empty table having the 
%     specified number of columns. Use this constructor as the starting
%     point for creating a table from scratch.
%
%     tableObj = Table(array) returns a table whose content is 
%     specified by a two-dimensional numeric array or a 
%     two-dimensional cell array of MATLAB data types (e.g., strings),
%     two-dimensional categorical array and DOM objects 
%     (e.g., paragraphs or images). The constructor converts basic MATLAB
%     types to corresponding DOM types, e.g., strings to Text objects.
%
%     tableObj = Table(array, 'StyleName') returns a table having the 
%     specified content and style name. The style specified by 'StyleName'
%     must be defined in the  template used to create the document to 
%     which this table is appended.
%
%     tableObj = Table(matlabTable) returns a DOM table having the 
%     content and format specified by the specified MATLAB table. 
%
%     tableObj = Table(matlabTable, 'StyleName') returns a DOM table 
%     having the content and format specified by the Matlab table and the
%     style specified by style name. The style specified by 'StyleName'
%     can override the format specified by the MATLAB table.
%
%
%    Table properties:
%      BackgroundColor         - Color of this table's background
%      Border                  - Type of border to be drawn around table
%      BorderCollapse          - Whether to collapse borders (HTML only)
%      BorderColor             - Color of this table's border
%      BorderWidth             - Width of this table's border
%      Children                - Children (rows) of this table
%      ColSep	               - Type of line to be drawn between columns
%      ColSepColor             - Color of this table's column separator
%      ColSepWidth             - Width of this table's column separator
%      ColSpecGroups           - Array of table column group properties
%      CustomAttributes        - Custom attributes of this table
%      FlowDirection           - Direction of text flow in this table
%      Id                      - Id of this table
%      HAlign                  - Horizontal alignment of this table
%      NCols                   - Number of columns in this table
%      NRows                   - Number of rows in this table
%      Parent                  - Parent of this table
%      RowSep                  - Type of line to be drawn between rows
%      RowSepColor             - Color of this table's row separator
%      RowSepWidth             - Width of this table's row separator
%      OuterLeftMargin         - Outer left margin (indent) of this table
%      Style                   - Formats that apply to this table
%      StyleName               - Name of table defined in a stylesheet
%      TableEntriesHAlign      - Default horizontal alignment of entries
%      TableEntriesInnerMargin - Inner margin (padding) of table's entries
%      TableEntriesStyle       - Style of table's entries
%      TableEntriesVAlign      - Default vertical alignment of entries
%      Tag                     - Tag of this table
%      Width                   - Width of this table
%
%    Table methods:
%      append - Append a row of table entries to this table.
%      clone  - Clone this table
%      entry  - Get a table entry
%      row    - Get a table row
%
%    Example:
%
%    import mlreportgen.dom.*;
%    d = Document('myreport', 'html');
%    open(d); 
%    t = Table(magic(5));
%    t.Style = {RowHeight('1in')};
%    t.Border = 'solid';
%    t.BorderWidth = '1px';
%    t.ColSep = 'solid';
%    t.ColSepWidth = '1';
%    t.RowSep = 'solid';
%    t.RowSepWidth = '1';
%    % Set this property first to avoid being overwritten.
%    t.TableEntriesStyle = {FontFamily('Arial'), Width('1in'), Color('red'), Bold};
%    t.TableEntriesHAlign = 'center';
%    t.TableEntriesVAlign = 'middle';
%    append(d, t);
%    close(d);
%    rptview('myreport', 'html');  
%
%    Text Hyphenation in PDF Tables
%
%    Hyphenation of table content, using zero-width spaces, is enabled by
%    default in PDF output. This is done to enable wrapping of numbers and
%    symbols that are too long to fit on a single line in a table entry.
%    You can use the DOM API's Hyphenation format to turn on hyphenation
%    selectively for table entries, rows, or columns. For example, you
%    might want to do this if a column contains English text. The DOM API
%    wraps text at word boundaries indicated by spaces. Turning off the
%    default hyphenation prevents breaking words to fit text in a table
%    entry. The following example enables hyphenation only in column two,
%    which contains numbers and textual symbols, to ensure that the numbers
%    and symbols fit in the column.
%
%    import mlreportgen.dom.*
%    d = Document('mydoc', 'pdf');
%    c = {'A long number: ', pi; 
%        'A long symbol:', 'abcdefghijklmnopqrstuvwxyz'};
%    t = Table(c);
%    t.Style = {Hyphenation(false), ResizeToFitContents(false)};
%    colspec(1) = TableColSpecGroup;
%    colspec(1).Span = 1;
%    colspec(1).Style = {Width('1in')};
%    colspec(2) = TableColSpecGroup;
%    colspec(2).Span = 1;
%    colspec(2).Style = {Width('1in'), Hyphenation('')};
%    t.ColSpecGroups = colspec;
%    append(d, t);
%    close(d);
%    rptview(d);
%
%    See also mlreportgen.dom.FormalTable, mlreportgen.dom.Hyphenation

%    Copyright 2013-2018 Mathworks, Inc.
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

     %Border Type of border to draw around this table. 
     %    Valid types are:  
     %
     %                                                    Applies To
     %    VALID VALUE                 DESCRIPTION	      DOCX HTML
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
     %    object to this table's Style property. Unsetting this 
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
     %    px            pixels
     %    cm            centimeters
     %    in            inches
     %    mm            millimeters
     %    pc            picas
     %    pt            points
     BorderWidth;

     %ColSep Type of line to draw between columns of this table
     % 
     %    Valid types are:  
     %                                                    Applies To
     %    VALID VALUE                 DESCRIPTION	      DOCX HTML
     %    []                          Determined by       Word Browser
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

     %FlowDirection Direction of text flow in this table
     %    The value of this property may be 
     %
     %    VALUE        DESCRIPTION 
     %     []          Determined by Web browser or Word
     %     'ltr'       left to right
     %     'rtl'       right to left
     FlowDirection;

     %HAlign Horizontal alignment of this table
     %    Valid values are:
     %
     %    VALUE        DESCRIPTION
     %    []           Determined by Web browser or Word
     %    'center'	   Align center
     %    'left'       Align left
     %    'right'      Align right
     HAlign;
     
     %NCols Number of columns in this table
     NCols;
     
     %NRows Number of rows in this table
     NRows;

     %RowSep Type of line to draw between rows of this table
     % 
     %    Valid types are:  
     %                                                    Applies To
     %    VALID VALUE                 DESCRIPTION	      DOCX HTML
     %    []                          Determined by       Word Browser
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
     %    Note: the styles specified by this property apply to the content
     %    of a table's entries not to the entries themselves. For example,
     %    you can use this property to define the font size of a table's
     %    entries but not the type or color of the entry borders. To
     %    specify the borders, you have to set the Style property of each
     %    entry:
     %
     %    import mlreportgen.dom.*;
     %    table = Table(magic(5));
     %    table.Style = {Border('solid'), BorderCollapse('on')};
     %    for r = 1:5
     %        for c = 1:5
     %            table.entry(r,c).Style = {Border('solid')}; 
     %        end
     %    end
     %
     %    Note: Be careful not to inadvertently overwrite a previous
     %    setting of this property. For example, setting this table's
     %    TableEntriesHAlign property appends an HAlign format object
     %    to this property. To avoid overwriting this property, you should
     %    set this property before setting other table properties that
     %    append formats to this property.
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

