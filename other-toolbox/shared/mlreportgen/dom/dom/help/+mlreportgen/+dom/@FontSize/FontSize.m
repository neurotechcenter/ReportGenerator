%mlreportgen.dom.FontSize Font size
%    size = FontSize() creates a 12pt font.
%
%    size = FontSize('size') creates a font of the specified size.
%    The value of the size argument is a string having the format 
%    valueUnits where Units is an abbreviation for the units in
%    which the size is expressed. The following abbreviations are
%    valid:
%
%    ABBREVIATION  UNITS
%    px            pixels
%    cm            centimeters
%    in            inches
%    mm            millimeters
%    pc            picas
%    pt            points
%
%
%    FontSize properties:
%        Id    - Id of this object
%        Tag   - Tag of this object
%        Value - Size of the font

%    Copyright 2014-2017 Mathworks, Inc.
%    Built-in class

%{
properties
     %Value Size of font
     %    The value of this property is a string having the format 
     %    valueUnits where Units is an abbreviation for the units in
     %    which the size is expressed. The following abbreviations are
     %    valid:
     %
     %    ABBREVIATION  UNITS
     %    px            pixels
     %    cm            centimeters
     %    in            inches
     %    mm            millimeters
     %    pc            picas
     %    pt            points
     %
     Value;
end
%}