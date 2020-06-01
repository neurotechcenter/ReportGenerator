%mlreportgen.dom.Strike Strike through text
%    strike = Strike() draws a single line throught text
%
%    strike = Strike('type') draws a line of the specified type through
%    text. Valid values of 'type':
%    
%    VALUE    DESCRIPTION
%    'single' single line
%    'double' double line
%    'none'   no strike through  
%
%    Strike properties:
%        Id    - Id of this object
%        Tag   - Tag of this object
%        Value - Type of strike throught text

%    Copyright 2014 Mathworks, Inc.
%    Built-in class

%{
properties
     %Value Type of strike throught text
     %
     %      Valid values:
     %
     %      VALUE    DESCRIPTION
     %      'single' single line
     %      'double' double line
     %      'none'   no strike through 
     Value;
end
%}