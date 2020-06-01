%mlreportgen.dom.DocumentPart Create a part of another document.
%    This class defines a form that can be filled out and appended to a 
%    document or another document part of the same output type.
%
%    part = DocumentPart() creates an HTML part based on the DOM API's 
%    default HTML template.
%
%    part = DocumentPart(type) creates a document  part of the specified 
%    type based on the DOM API's default template for that type.
%
%      Valid document part types:
%        *	'docx'      - Microsoft Word part
%        *	'html'      - HTML document part
%        *	'html-file' - single-file HTML document part
%        *	'pdf'       - PDF document part
%
%    part = DocumentPart(type, templatepath) creates a document part of 
%    the specified type based on the specified template. The template must
%    be a Word (dotx) or HTML (htmx) template, depending on the part type. 
%    Use a Word template for PDF parts.
%
%    part = DocumentPart(type, templatepath, buildingblockname) creates a 
%    document part of the specified type based on a template of the 
%    specified name stored in the specified template.
%
%    part = DocumentPart(templatesrc, buildingblockname) creates a document
%    part of the specified type based on a template of the specified name 
%    stored in the template used by the specified template source. The 
%    template source can be another document or document part.
%
%
%    DocumentPart methods:
%        append         - Append a MATLAB or DOM object to this part
%        addHTML        - Appends an HTML markup string to this part
%        addHTMLFile    - Appends the contents of an HTML file to this part
%        close          - Close this part
%        fill           - Fill holes in this part's template
%        moveToNextHole - Move to next hole in this part
%        open           - Open this part  
%
%    DocumentPart properties:
%        Children           - Content of this part
%        CurrentHoleId      - Id of current hole
%        CurrentHoleType    - Type of current hole (inline or block)
%        CurrentPageLayout  - Current page layout properties 
%        Id                 - Id of this document
%        Tag                - Tag of this document
%        TemplatePath       - Path of this part's template
%        Type               - Type of document (e.g., docx, html, html-file, pdf)'

%    Copyright 2013-2015 Mathworks, Inc.
%    Built-in class

%{
properties
     %Children Content of this document
     %      Content of this document.
     Children;
end
%}