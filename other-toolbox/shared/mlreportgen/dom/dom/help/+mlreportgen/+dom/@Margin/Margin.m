%mlreportgen.dom.Margin Base class for margin classes
%
%    Margin properties:
%        Bottom - Size of bottom margin
%        Left   - Size of left margin
%        Id     - Id of this object
%        Right  - Size of right margin
%        Tag    - Tag of this object
%        Top    - Size of top margin

%    Copyright 2014-2017 Mathworks, Inc.
%    Built-in class

%{
properties

     %Bottom Size of bottom margin
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
     Bottom;

     %Left Size of left margin
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
     Left;

     %Right Size of right margin
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
     Right;

     %Top Size of top margin
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
     Top;

end
%}