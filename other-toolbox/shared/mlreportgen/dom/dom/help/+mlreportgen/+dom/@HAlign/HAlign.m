%mlreportgen.dom.HAlign Horizontal alignment of a document object
%    align = HAlign() aligns an object to the left size of its container.
%
%    align = HAlign('value') aligns an object as specified  by 'value'.
%
%    VALUE    DESCRIPTION
%    'center' Center object between sides of container
%    'left'   Align object to the left side of container
%    'right'  Align object to the right side of container
%
%
%    HAlign properties:
%        Id    - Id of this object
%        Tag   - Tag of this object
%        Value - Alignment of an object relative to its container's sides
%
%    See also mlreportgen.dom.VALign

%    Copyright 2014 Mathworks, Inc.
%    Built-in class

%{
properties

     %Value Alignment of an object relative to its container's sides
     %
     %    VALUE    DESCRIPTION
     %    'center'  Center object between sides of container
     %    'left'    Align object to the left side of container
     %    'right'   Align object to the right side of container
     %    'justify' Align text to the left and right sides of container,
     %              adjusting word and letter spacing and hyphenating as
     %              necessary (if hyphenation is enabled).
     %
     % See also mlreportgen.dom.Hyphenation
     Value;
end
%}