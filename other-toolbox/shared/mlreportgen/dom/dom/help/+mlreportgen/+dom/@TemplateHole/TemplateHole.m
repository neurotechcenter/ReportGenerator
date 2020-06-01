%mlreportgen.dom.TemplateHole Hole to be appended to a template
%    hole = TemplateHole() creates a hole with empty properties.
%
%    hole = TemplateHole('id') creates a hole having the specified
%    id.
%
%    hole = TemplateHole('id', 'description') creates a hole having the 
%    specified id and description.
%
%    TemplateHole methods:
%        clone - Clone this hole object
%
%    TemplateHole properties:
%        DefaultHoleStyleName - Name of default style for hole content
%        Description          - Description of this hole
%        HoleId               - Id of this hole
%        Id                   - Id of this hole object
%        Tag                  - Tag of this hole object
%
%    See also mlreportgen.dom.Template

%    Copyright 2014 Mathworks, Inc.
%    Built-in class

%{
properties
     %DefaultHoleStyleName Name of default style for hole content
     %      This style name is assigned to hole content that does not
     %      specify a style name. For example, suppose you append a 
     %      Text object to this hole that does not specify a style name.
     %      Then, the value of this property is assigned to the text object
     %      as its style name. This property allows a template to 
     %      specify the appearance of appended content.
     DefaultHoleStyleName;

     %Description Description of this hole
     %      The value of this property becomes the content of the hole
     %      in the template to which it is assigned to allow you to
     %      determine the purpose of the hole when viewing the template
     %      in Microsoft Word (for dotx templates) or in a Web browser
     %      (for htmtx templates). The description is replaced by 
     %      appended hole content in a document generated from the 
     %      template.
     Description;

     %HoleId Id of this hole
     %      See also mlreportgen.dom.Document.CurrentHoleId
     HoleId;
end
%}