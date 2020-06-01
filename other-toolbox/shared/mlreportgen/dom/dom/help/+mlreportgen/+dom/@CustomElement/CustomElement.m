%mlreportgen.dom.CustomElement Custom element of a document
%    elem = CustomElement() creates an empty element.
%
%    elem = CustomElement('name') creates a custom element having the
%    specified name. The specified name must be the name of an element
%    supported by the type of document to which this custom element is
%    appended, e.g., 'div' for a custom HTML div element or 'w:p' for
%    a custom Word paragraph element.
%
%
%    Element methods:
%        append         - Append a MATLAB or DOM object to this part
%        clone          - Clone this part
%
%    Element properties:
%        CustomAttributes  - Custom element attributes
%        Id                - Id of this element
%        Name              - Tag name of this element
%        Style             - Formats that define this element's style
%        StyleName         - Name of element's stylesheet-defined style
%        Tag               - Tag of this element
%
%    Example:
%    
%    The CustomElement class allows you to create elements that the DOM
%    API does not (yet) support directly.
%
%    import mlreportgen.dom.*;
%    d = Document('test');
%    input = CustomElement('input');
%    input.CustomAttributes = { 
%        CustomAttribute('type', 'checkbox'), ...
%        CustomAttribute('name', 'vehicle'), ...
%        CustomAttribute('value', 'Bike'), ...
%        };
%    append(input, Text('I have a bike'));
%    append(d, input);
%    append(d, CustomElement('br'));
%    input = CustomElement('input');
%    input.CustomAttributes = { 
%       CustomAttribute('type', 'checkbox'), ...
%        CustomAttribute('name', 'vehicle'), ...
%        CustomAttribute('value', 'Car'), ...
%        };
%    append(input, Text('I have a car'));
%    append(d, input);
%    close(d);
%    rptview('test', 'html');
%
%    See also mlreportgen.dom.CustomAttribute

%    Copyright 2014 Mathworks, Inc.
%    Built-in class

%{
properties
     %Name Tag name of this element
     *  The specified name must be the name of an element
     %  supported by the type of document to which this custom element is
     %  appended, e.g., 'div' for a custom HTML div element or 'w:p' for
     %  a custom Word paragraph element.
     %      
     Name;
end
%}