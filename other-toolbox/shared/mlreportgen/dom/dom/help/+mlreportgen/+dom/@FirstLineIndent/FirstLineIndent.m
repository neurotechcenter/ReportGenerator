%mlreportgen.dom.FirstLineIndent Indent first line of a paragraph
%    obj = FirstLineIndent() creates an empty format object.
%
%    obj = FirstLineIndent('width') indents first line of paragraph by
%    the specified amount. The 'width' argument is a string having the 
%    format valueUnits where Units is an abbreviation for the units in
%    which the size is expressed. The following abbreviations are valid:
%
%    Abbreviation  Units
%    px            pixels
%    cm            centimeters
%    in            inches
%    mm            millimeters
%    pc            picas
%    pt            points
%
%    obj = FirstLineIndent('style', 'width') indents either the first line 
%    of  the paragraph relative to the page margin ('style' = 'normal') or
%    the subsequent lines ('style' = 'hanging').
%    
%    FirstLineIndent properties:
%        Id    - Id of this object
%        Style - Type of indentation (normal or hanging)
%        Tag   - Tag of this object
%        Width - Amount of indentation

%    Copyright 2014-2017 Mathworks, Inc.
%    Built-in class

%{
properties

     %Style Type of indentation (normal or hanging)
     %
     %      Valid values:
     %
     %      'normal'  - first line is indented relative to page margin
     %      'hanging' - subsequent lines are indented relative to page
     %                  margin
     %
     Style;

     %Width Amount of indentation
     %    Width is a string having the  format valueUnits where Units is 
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
     Width;
end
%}