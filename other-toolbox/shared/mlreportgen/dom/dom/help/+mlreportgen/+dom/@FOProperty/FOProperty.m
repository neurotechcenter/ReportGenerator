%mlreportgen.dom.CSSProperty FO property
%    prop = FOProperty('NAME', 'VALUE') creates XML Style Sheet Language
%    (XSL) Formatting Object (FO) property having the  specified name and
%    value. The DOM API uses FO objects to generate PDF output.
%
%    Use instances of this object with instances of
%    mlreportgen.dom.FOProperties to apply FO properties programmatically
%    to FO objects.
%
%    Note. Output-independent DOM format objects generate most FO
%    properties used to generate PDF output. To ensure that your DOM
%    application is as independent of output type as possible, you should
%    use instances of this class only for FO properties not otherwise
%    supported by DOM format objects.
%
%    FOProperty properties:
%        Name  - Name of this FO property
%        Value - Value of this FO property
%        Id    - Id of this CSS property    
%        Tag   - Tag of this CSS property
%
%    See also mlreportgen.dom.FOProperties

%    Copyright 2015 MathWorks, Inc.
%    Built-in class

%{
properties
     %Name Name of this FO property
     %    The value of this property is a string that specifies an 
     %    XML Style Sheet Language (XSL) Formatting Object (FO) property.
     %
     %    For names of FO properties, see
     %    http://www.w3.org/TR/2001/REC-xsl-20011015/slice6.html#fo-section
     Name;

     %Value Value of this property
     %    The value of this property is a string that specifies the 
     %    value of this property.
     %
     %    For valid values of FO properties, see
     %    http://www.w3.org/TR/2001/REC-xsl-20011015/slice6.html#fo-section
     Value;

end
%}