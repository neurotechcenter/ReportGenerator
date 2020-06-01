%mlreportgen.dom.CustomText Plain text to be appended to a custom element
%    text = CustomText() creates an empty CustomText object.
%
%    text = PlainText('text') creates a CustomText object containing
%    the specified text.
%
%    CustomText properties:
%        Id       - Id of this custom text object
%        Parent   - Parent of this custom text object
%        Tag      - Tag of this custom text object
%        Value    - Text contained by this object
%
%    Example:
%
%    import mlreportgen.dom.*;
%    d = Document('test');
%    script = CustomElement('script');
%    append(script, CustomText('document.write("Hello World!")'));
%    append(d, script);
%    close(d);
%    rptview('test', 'html');

%    Copyright 2014 Mathworks, Inc.
%    Built-in class

%{
properties
     %Value Text to be included in a custom element
     Value;
end
%}