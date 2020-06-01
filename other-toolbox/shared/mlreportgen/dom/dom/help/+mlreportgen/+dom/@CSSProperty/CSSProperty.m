%mlreportgen.dom.CSSProperty CSS property
%    prop = CSSProperty('NAME', 'VALUE') creates a CSS format property
%    having the  specified name and value.
%
%    Use instances of this object with instances of
%    mlreportgen.dom.CSSProperties to apply CSS properties programmatically
%    to HTML objects.
%
%    Note. Output-independent DOM format objects generate most CSS
%    properties used to generate HTML output. To ensure that your DOM
%    application is as independent of output type as possible, you should
%    use instances of this class only for FO properties not otherwise
%    supported by DOM format objects.
%
%    CSSProperty properties:
%        Name  - Name of this CSS property
%        Value - Value of this CSS property
%        Id    - Id of this CSS property    
%        Tag   - Tag of this CSS property

%    Copyright 2015 MathWorks, Inc.
%    Built-in class

%{
properties
     %Name Name of this CSS property
     %    The value of this property is a string that specifies a CSS
     %    property.
     %
     %    For names of CSS properties, see 
     %    http://www.w3schools.com/cssref/default.asp
     Name;

     %Value Value of this property
     %    The value of this property is a string that specifies the 
     %    value of this property.
     %
     %    For valid values of CSS properties, see 
     %    http://www.w3schools.com/cssref/default.asp
     Value;

end
%}