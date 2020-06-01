%mlreportgen.dom.VAlign Vertical alignment of a document object
%    align = VAlign() aligns an object to the top of its container.
%
%    align = VAlign('value') aligns an object as specified  by 'value'.
%
%    VALUE    DESCRIPTION
%    'bottom' Align object to bottom of container
%    'middle' Center object between top and bottom of container
%    'top'    Align object to the top of container
%
%
%    VAlign properties:
%        Id    - Id of this object
%        Tag   - Tag of this object
%        Value - Alignment relative to container's top and bottom
%
%    See also mlreportgen.dom.HALign

%    Copyright 2014 Mathworks, Inc.
%    Built-in class

%{
properties

     %Value Alignment relative to container's top and bottom
     %
     %    VALUE    DESCRIPTION
     %    'bottom' Align object to bottom of container
     %    'middle' Center object between top and bottom of container
     %    'top'    Align object to the top of container
     Value;
end
%}