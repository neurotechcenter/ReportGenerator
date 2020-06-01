%mlreportgen.dom.RowSep Draw lines between table rows
%    sep = RowSep() creates unspecified row separators.
%
%    sep = RowSep('style') creates a row separator of the specified style.
%    See mlreportgen.dom.RowSep.Style for a list of valid styles.
%
%    sep = Rowsep('style', 'color') creates a row separator having the 
%    specified style and color. See mlreportgen.dom.RowSep.Color for
%    information on specifying color.
%
%    sep = RowSep('style', 'color', 'width') creates a row separator
%    having the specified style, color, and width. 
%    See mlreportgen.dom.RowSep.Width for information on specifying
%    row separator width.  
%
%    RowSep properties:
%        Color       - Color of row separators
%        Id          - Id of this object
%        Style       - Style of row separators
%        Tag         - Tag of this object
%        Width       - Width of row separators
%
%    Example:
%
%    import mlreportgen.dom.*;
%    doctype = 'html';
%    d = Document('test', doctype);
%    t = Table(magic(5));
%    t.Style = {Border('inset', 'crimson', '6pt'), ...
%        ColSep('double', 'DarkGreen', '3pt'), ...
%        RowSep('double', 'Gold', '3pt'), ...
%        Width('50%')};
%    t.TableEntriesInnerMargin = '6pt';
%    t.TableEntriesHAlign = 'center';
%    t.TableEntriesVAlign = 'middle';
%    append(d, t);
%    close(d);
%    rptview('test', doctype);
%
%    See also mlreportgen.dom.Border, mlreportgen.dom.ColSep

%    Copyright 2014-2017 Mathworks, Inc.
%    Built-in class

%{
properties

     %Color Color of row separators
     %    The value of this property may be a color name (e.g., 'blue')
     %    or a hexadecimal RGB value (e.g., '#0000ff').
     %
     %    See http://www.crockford.com/wrrrld/color.html for a list
     %    of valid color names.
     Color;

     %Style Style of row separators
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

     %Width Width of row separators
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