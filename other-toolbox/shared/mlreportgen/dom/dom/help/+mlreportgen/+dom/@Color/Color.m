%mlreportgen.dom.Color Color of a document object
%    colorObj = Color() creates a black color.
%
%    colorObj = Color('name') creates a color of the specified name.
%    The name must be a CSS color name. See 
%    http://www.crockford.com/wrrrld/color.html for a list
%    of valid CSS color names.
%    
%    colorObj = Color('#RRGGBB') creates a color specified by 
%    a hexadecimal rgb value.
%
%    Color properties:
%        HexValue - Hexadecimal rgb value of this color (read-only)
%        Id       - Id of this color object
%        Tag      - Tag of this color object
%        Value    - Name or hexadecimal rgb value of this color
%
%    Example:
%
%    % Create a a bold, deep sky blue style and apply it to a paragraph
%    import mlreportgen.dom.*;
%    doctype = 'html';
%    d = Document('test', doctype);
%    blue = 'DeepSkyBlue';
%    % blue = '#00BFFF';
%    colorfulStyle = {Bold, Color(blue)};
%    p = Paragraph('deep sky blue paragraph');
%    p.Style = colorfulStyle;
%    append(d, p);
%    close(d);
%    rptview('test', doctype);
%
%    See also mlreportgen.dom.BackgroundColor

%    Copyright 2014 Mathworks, Inc.
%    Built-in class

%{
properties
     %Value Color name or hexidecimal rgb value
     %    The value of this property may be a color name (e.g., 'blue')
     %    or a hexadecimal RGB value (e.g., '#0000ff').
     %
     %    See http://www.crockford.com/wrrrld/color.html for a list
     %    of valid color names.
     Value;

     %HexValue Hex value represented by a color name (read-only)
     %     This property specifies the hex rgb value of the Value
     %     property. If the Value property is itself a hex rgb value,
     %     the two values are identical.
     HexValue;
end
%}