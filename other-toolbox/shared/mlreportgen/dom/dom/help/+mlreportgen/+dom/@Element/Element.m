%mlreportgen.dom.Element Defines a document element
%    This class defines a formatted document object
%
%
%    Element methods:
%        append         - Append a MATLAB or DOM object to this part
%        clone          - Clone this part
%
%    Element properties:
%        CustomAttributes  - Custom element attributes
%        Id                - Id of this element
%        Style             - Formats that define this element's style
%        StyleName         - Name of element's stylesheet-defined style
%        Tag               - Tag of this element

%    Copyright 2013 Mathworks, Inc.
%    Built-in class

%{
properties
     %StyleName Name of element's stylesheet-defined style
     %     Name of a style specified in the stylesheet of the document or
     %     document part to which this element is appended. The specified 
     %     style defines the appearance of this element in the output 
     %     document where not overridden by the formats specified by 
     %     this element’s Style property.
     %      
     StyleName;

     %Style Formats that define this element's style
     %      Array of format objects that specify the format of this  
     %      element. The formats specified by this property override 
     %      corresponding formats defined by the stylesheet style 
     %      specified by this element’s StyleName property. Formats that do
     %      not apply to this element are ignored.
     Style;

     %CustomAttributes Custom element attributes
     %      Array of custom attributes of this element. The attributes
     %      must be supported by the output type of the document to which 
     %      this elemement is appended.
     CustomAttributes;
end
%}