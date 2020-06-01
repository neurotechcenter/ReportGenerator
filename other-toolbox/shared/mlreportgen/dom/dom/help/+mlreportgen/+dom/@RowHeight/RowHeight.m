%mlreportgen.dom.RowHeight Height of a table row
%    heightObj = RowHeight() specifies row height to be 1 inch.
%
%    heightObj = RowHeight('height') sets a row to the specified height.
%
%    heightObj = RowHeight('height', 'type') sets a row to be either
%    exactly the specified height ('type' = 'exact') or at least the
%    specified height ('type' = 'atleast', applies only to Word 
%    documents).
%
%    Example:
%
%    % Create a row that is at least 1-inch high
%    import mlreportgen.dom.*;
%    r = TableRow();
%    r.Style = {RowHeight('1in', 'atleast')};
%    
%
%    RowHeight properties:
%        Id    - Id of this object
%        Tag   - Tag of this object
%        Type  - Type of row height
%        Value - Row height

%    Copyright 2014-2017 Mathworks, Inc.
%    Built-in class

%{
properties

     %Type Type of row height
     %
     %    Specifies how the row height value is to be interpreted:
     %
     %        * 'exact'    - Value is the exact spacing between lines
     %      
     %        * 'atleast'  - Value is the minimum spacing between lines.
     %                     The actual value may be larger. Applies only
     %                     to Word documents
     Type;

     %Value Height of row
     %
     %    Interpretation of the this property depends on the setting
     %    of this object's Type setting.
     %
     %    The value of this property is a string having the format 
     %    valueUnits where Units is an abbreviation for the units in
     %    which the size is expressed. The following abbreviations are
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
     Value;
end
%}