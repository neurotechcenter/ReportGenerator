%mlreportgen.dom.Form Defines a form
%    This class defines a form that can be filled out and appended to a 
%
%
%    Form methods:
%        append         - Append a MATLAB or DOM object to this part
%        addHTML        - Appends an HTML markup string to this part
%        addHTMLFile    - Appends the contents of an HTML file to this part
%        close          - Close this part
%        fill           - Fill holes in this part's template
%        moveToNextHole - Move to next hole in this part
%        open           - Open this part  
%
%    Form properties:
%        CurrentHoleId      - Id of current hole
%        CurrentHoleType    - Type of current hole (inline or block)
%        CurrentPageLayout  - Current page layout properties 
%        Type               - Type of document (e.g., docx, html, html-file, pdf)
%        DOCXVersion        - Word version

%    Copyright 2013-2015 Mathworks, Inc.
%    Built-in class

%{
properties
     %CurrentHoleId Id of current hole
     %      This property specifies the id of the hole at which this
     %      form (document or document part) is currently positioned. 
     %      Any objects appended to this document are appended after
     %      the template content that preceded this hole.
     CurrentHoleId;

     %CurrentHoleType Type of the current hole (block or inline)
     %      Specified the type of this hole: block or inline. Inline
     %      holes occur only in paragraphs. Thus, you can append to an
     %      inline hole only types of objects that paragraphs can contain,
     %      for example, text and images, but not paragraphs or tables.
     CurrentHoleType;

     %CurrentPageLayout Current page layout properties
     %      The value of this property is an object of PageLayout type
     %      that specifies the properties of the current page layout.
     %      You can use this object to set the properties of the
     %      current page layout, e.g., page height and width, margins, 
     %      headers and footers.
     CurrentDOCXSection;

     %TemplatePath Path of this document's template
     %     Path of the Word or HTML template for this document. If this 
     %     property is empty, a default template is used to generate the
     %     document. This property cannot be changed after a document has
     %     been opened for output.
     TemplatePath;

     %Type Output type of this document (docx, html, html-file, pdf)
     %      Specifies the output type of this document: docx, html, html-file
     %      or pdf. You cannot set this property after the document has been
     %      opened.
     Type;

     %DOCXVersion Version of Word supported by this document
     %      Content of this document.
     DOCXVersion;
end
%}