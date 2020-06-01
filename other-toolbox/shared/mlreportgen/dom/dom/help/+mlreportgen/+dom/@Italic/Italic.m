%mlreportgen.dom.Italic Italic format
%    italicObj = Italic() creates a format object that specifies that the
%    text object whose style contains it is italic.
%
%    italicObj = Italic(tf) creates a format object that specifies that the
%    text object that includes it in its style is italic, if tf = true and
%    upright if tf = false.
%
%    Example:
%
%    % Create a paragraph whose default text weight is italic.
%    p = Paragraph('italic text');
%    p.Style = {Italic};
%
%    % Add some upright text
%    t = Text('upright text');
%    t.Style = {Italic(false)};
%    append(p, t);
%    
%
%    Italic properties:
%        Id    - Id of this object
%        Tag   - Tag of this object
%        Value - If true, text is italic; otherwise, upright

%    Copyright 2014 Mathworks, Inc.
%    Built-in class

%{
properties
     %Id Id of this object
     %      Id of this object.
     Id;

     %Tag Tag of this object
     %      Tag of this object.
     Tag;

     %Value Whether corresponding text is italic
     %
     %      Valid values:
     %
     %      true  - text whose style includes this format is italic
     %      false - text whose style includes this format is upright
     %
     %      Note: if the corresponding text object, e.g., a Text or 
     %      Paragraph object, specifies a style defined in a style 
     %      sheet, this value overrides the stylesheet style. For example,
     %      if the stylesheet style specifies that the text is italic and
     %      this value is false, the resulting text is upright,
     %      i.e., not italic.
     Value;
end
%}