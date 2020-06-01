%mlreportgen.dom.OulineLevel Level of paragraph in an outline
%    obj = OutlineLevel() sets the outline level of this paragraph to 1.
%    This causes the content of the paragraph to appear in an automatically
%    generated outline, e.g., a table of contents, at the top level.
%
%    obj = OutlineLevel(level) sets paragraph to the specified outline
%    level.
%
%    OutlineLevel properties:
%        Id    - Id of this object
%        Tag   - Tag of this object
%        Value - Outline level

%    Copyright 2014 Mathworks, Inc.
%    Built-in class

%{
properties

     %Value Outline level of paragraph 
     %
     Value;
end
%}