%mlreportgen.dom.ColSep Draw lines between table columns
%    sep = ColSep() creates unspecified column separators.
%
%    sep = ColSep('style') creates a column separator of the specified style.
%    See mlreportgen.dom.ColSep.Style for a list of valid styles.
%
%    sep = ColSep('style', 'color') creates a column separator having the 
%    specified style and color. See mlreportgen.dom.ColSep.Color for
%    information on specifying color.
%
%    sep = ColSep('style', 'color', 'width') creates a column separator
%    having the specified style, color, and width. 
%    See mlreportgen.dom.ColSep.Width for information on specifying
%    column separator width.  
%
%    ColSep properties:
%        Color       - Color of column separators
%        Id          - Id of this object
%        Style       - Style of column separators
%        Tag         - Tag of this object
%        Width       - Width of column separators
%
%    Example:
%
%    import mlreportgen.dom.*;
%    doctype = 'html';
%    d = Document('test', doctype);
%    t = Table(magic(5));
%    t.Style = {Border('inset', 'crimson', '6pt'), ...
%        ColSep('double', 'DarkGreen', '3pt'), Width('50%')};
%    t.TableEntriesInnerMargin = '6pt';
%    t.TableEntriesHAlign = 'center';
%    t.TableEntriesVAlign = 'middle';
%    append(d, t);
%    close(d);
%    rptview('test', doctype);
%
%    See also mlreportgen.dom.Border, mlreportgen.dom.RowSep

%    Copyright 2014-2017 Mathworks, Inc.
%    Built-in class

%{
properties

     %Color Color of column separators
     %    The value of this property may be a color name (e.g., 'blue')
     %    or a hexadecimal RGB value (e.g., '#0000ff').
     %
     %    See http://www.crockford.com/wrrrld/color.html for a list
     %    of valid color names.
     Color;

     %Style Style of column separators
     %    Valid styles are:  
     %                                                    Applies To
     %    STYLE                       DESCRIPTION	      DOCX HTML/PDF
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
     Style;

     %Width Width of column separators
     %
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
     Width;

end
%}