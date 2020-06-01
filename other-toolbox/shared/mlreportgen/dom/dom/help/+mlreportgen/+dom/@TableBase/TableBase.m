% mlreportgen.dom.TableBase Super class of tables
%
%    TableBase properties:
%      Children                - Children (rows) of this table section
%      ColSep	               - Type of line to be drawn between columns
%      ColSepColor             - Color of this table's column separator
%      ColSepWidth             - Width of this table's column separator
%      Id                      - Id of this table section
%      NCols                   - Number of columns in this table
%      NRows                   - Number of rows in this table
%      RowSep                  - Type of line to be drawn between rows
%      RowSepColor             - Color of this table's row separator
%      RowSepWidth             - Width of this table's row separator
%      Parent                  - Parent of this table section
%      Style                   - Formats that apply to this table
%      StyleName               - Name of table defined in a stylesheet
%      TableEntriesHAlign      - Default horizontal alignment of entries
%      TableEntriesInnerMargin - Inner margin (padding) of table's entries
%      TableEntriesStyle       - Style of table's entries
%      TableEntriesVAlign      - Default vertical alignment of entries
%      Tag                     - Tag of this table section
%
%    TableBase methods:
%      append - Append a row of table entries to this table.
%      clone  - Clone this table
%      entry  - Get a table entry
%      row    - Get a table row

%    Copyright 2014-2017 Mathworks, Inc.
%    Built-in class

%{
properties

     %ColSep Type of line to draw between columns of this table
     % 
     %    Valid types are:  
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

     %NCols Number of columns in this table
     NCols;
     
     %NRows Number of rows in this table
     NRows;

     %RowSep Type of line to draw between rows of this table
     % 
     %    Valid types are:  
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

end
%}

