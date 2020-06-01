%mlreportgen.dom.Bold Bold format
%    boldObj = Bold() creates a format object that specifies that the
%    text to which it applies is bold.
%
%    boldObj = Bold(tf) creates a format object that specifies that the
%    text object that includes it in its style is bold, if tf = true and
%    regular weight if tf = false.
%
%    Example:
%
%    % Create a paragraph whose default text weight is bold.
%    p = Paragraph('bold text');
%    p.Style = {Bold};
%
%    % Add some regular-weight text
%    t = Text('regular weight text');
%    t.Style = {Bold(false)};
%    append(p, t);
%    
%
%    Bold properties:
%        Id    - Id of this object
%        Tag   - Tag of this object
%        Value - If true, text is bold; otherwise, regular weight

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

     %Value Whether corresponding text is bold
     %
     %      Valid values:
     %
     %      true  - text whose style includes this format is bold
     %      false - text whose style includes this format is not bold
     %
     %      Note: if the corresponding text object, e.g., a Text or 
     %      Paragraph object, specifies a style defined in a style 
     %      sheet, this value overrides the stylesheet style. For example,
     %      if the stylesheet style specifies that the text is bold and
     %      this value is false, the resulting text is regular weight,
     %      i.e., not bold.
     Value;
end
%}