%mlreportgen.dom.HorizontalRule Create a horizontal rule.
%     hr = HorizontalRule() creates a horizontal rule.
%
%    HorizontalRule methods:
%        clone          - Clone this horizontal rule
%
%    HorizontalRule properties:
%        Border            - Border style of this horizontal rule
%        BorderColor       - Border color of this horizontal rule
%        BorderWidth       - Border width of this horizontal rule
%        BackgroundColor   - Background color of this horizontal rule
%        Id                - Id of this horizontal rule
%        Style             - Formats that define this horizontal rule's style
%        StyleName         - Name of horizontal rule's stylesheet-defined style
%        Tag               - Tag of this horizontal rule

%    Copyright 2015-2017 Mathworks, Inc.
%    Built-in class

%{
properties
     %Border Type of border represented by this horizontal rule. 
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
     %    object to this horizontal rule's Style property. Unsetting this 
     %    property removes the object.
     Border;

     %BorderColor Color of this horizontal rule's border   
     %    The value of this property may be a color name (e.g., 'blue')
     %    or a hexadecimal RGB value (e.g., '#0000ff').
     %
     %    See http://www.crockford.com/wrrrld/color.html for a list
     %    of valid color names.
     BorderColor;

     %BorderWidth Width of this horizontal rule's border
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

     %BackgroundColor Background color of this horizontal rule
     %    You may specify the background color either as a color
     %    name (e.g., 'red') or a hexadecimal RGB value of the form
     %    '#rrggbb', e.g., 'FF0000'. If this property is empty and the 
     %    horizontal rule’s StyleName property specifies a style sheet 
     %    style, the color of this horizontal rule is determined by the 
     %    specified style. 
     %
     %    Note: Setting this property adds a corresponding BackgroundColor 
     %    format object to this horizontal rule’s Style property. 
     %    Unsetting this property removes the object.
     %
     BackgroundColor;

end
%}