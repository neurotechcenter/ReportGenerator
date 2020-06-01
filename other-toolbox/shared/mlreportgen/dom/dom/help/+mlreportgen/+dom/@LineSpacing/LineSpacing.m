%mlreportgen.dom.LineSpacing Spacing between lines of a paragraph
%    spacingObj = LineSpacing() specifies a line spacing equal to the
%    height of one line at the paragraph font size.
%
%    spacingObj = LineSpacing(multiple) specifies a line spacing as a 
%    multiple of the paragraph line height, e.g., 1.5.
%
%    spacingObj = LineSpacing('value') specifies line spacing as
%    a dimension,  e.g., '10pt'.
%
%    spacingObj = LineSpacing('value', 'type') specifies line spacing 
%    value and value type. Valid types are:
%
%         * multiple - Value is the spacing in terms of number of lines
%         * exact    - Value is the exact size of the line spacing
%         * atleast  - Value is the minimum size of the line spacing
%                      (applies only to Word)
%
%
%    Example:
%
%    % Create a paragraph with a spacing between lines equal to 1.5
%    % times the height of the lines.
%    p = Paragraph();
%    p.Style = {LineSpacing(1.5)};
%    
%
%    LineSpacing properties:
%        Id    - Id of this object
%        Tag   - Tag of this object
%        Type  - Type of line spacing
%        Value - Line spacing

%    Copyright 2014 Mathworks, Inc.
%    Built-in class

%{
properties

     %Type Type of line spacing
     %
     %    Specifies how the line spacing value is to be interpreted:
     %
     %        * multiple - Value is a multiple of the paragraph's line 
     %                     height
     %
     %        * exact    - Value is the exact spacing between lines
     %      
     %        * atleast  - Value is the minimum spacing between lines.
     %                     The actual value may be larger. Applies only
     %                     to Word documents
     Type;

     %Value Spacing between lines
     %
     %    Interpretation of the this property depends on the setting
     %    of this object's Type setting.
     %
     Value;
end
%}