%mlreportgen.dom.BackgroundColor Background color of a document object
%    colorObj = BackgroundColor() creates a white background.
%
%    colorObj = BackgroundColor('name') creates a background color of the 
%    specified name.
%
%    The name must be a CSS color name. See 
%    http://www.crockford.com/wrrrld/color.html for a list
%    of valid CSS color names.
%    
%    colorObj = Color('#RRGGBB') creates a color specified by 
%    a hexadecimal rgb value.
%
%    BackgroundColor properties:
%        HexValue - Hexadecimal rgb value of this color (read-only)
%        Id       - Id of this color object
%        Tag      - Tag of this color object
%        Value    - Name or hexadecimal rgb value of this color
%
%    Example:
%
%    import mlreportgen.dom.*;
%    doctype = 'html';
%    d = Document('test', doctype);
%    blue = 'DeepSkyBlue';
%    % blue = '#00BFFF';
%    colorfulStyle = {Bold, Color(blue), BackgroundColor('Yellow')};
%    p = Paragraph('deep sky blue paragraph with yellow background');
%    p.Style = colorfulStyle;
%    append(d, p);
%    close(d);
%    rptview('test', doctype);
%
%    See also mlreportgen.dom.Color

%    Copyright 2014 Mathworks, Inc.
%    Built-in class

%{
properties
     %Value Background color name or rgb value
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