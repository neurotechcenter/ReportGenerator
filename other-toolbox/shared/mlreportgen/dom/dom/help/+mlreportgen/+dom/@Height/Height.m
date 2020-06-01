%mlreportgen.dom.Height Height of an image
%    height = Height() creates a height of 1 inch.
%
%    height = Height('value') creates the specified height. The 'value'
%    argument is a string having the  format valueUnits where Units is 
%    an abbreviation for the units  in which the size is expressed. 
%    The following abbreviations are valid:
%
%    Abbreviation  Units
%    px            pixels
%    cm            centimeters
%    in            inches
%    mm            millimeters
%    pc            picas
%    pt            points
%    %             percent
%    
%    Height properties:
%        Id    - Id of this object
%        Tag   - Tag of this object
%        Value - If true, text is bold; otherwise, regular weight
%
%    See also mlreportgen.dom.RowHeight, mlreportgen.dom.Width

%    Copyright 2014-2017 Mathworks, Inc.
%    Built-in class

%{
properties

     %Value Value of height
     %
     %    Value is a string having the  format valueUnits where Units is 
     %    an abbreviation for the units  in which the size is expressed. 
     %    The following abbreviations are valid:
     %
     %    Abbreviation  Units
     %    px            pixels
     %    cm            centimeters
     %    in            inches
     %    mm            millimeters
     %    pc            picas
     %    pt            points
     %    %             percent
     Value;
end
%}