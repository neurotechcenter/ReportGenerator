%mlreportgen.dom.DOCXPageHeader Page header for a Word document.
%    header = DOCXPageHeader() creates a default page header based on the 
%    DOM API's default DOCX template.
%
%    header = DOCXPageHeader('pagetype') creates a page header that applies
%    to the specified page type and is based on the DOM API's 
%    default DOCX template.
%
%      Valid page types:
%        *	'default' - Header for odd pages of the section, even pages if 
%                       no even page header is specified, and first page if
%                       no first page header is specified
%        *	'even'    - Header for even pages of the section
%        *	'first'   - Header for first page of the section
%
%    header = DOCXPageHeader('pagetype', 'templatepath') creates a page  
%    header of the specified page type based on the specified template. The  
%    template must be a Word (dotx) template. The template may contain 
%    holes to be filled during report generation.
%
%    header = DOCXPageHeader('pagetype', 'templatepath', 'embeddedTemplateName') 
%    creates a header of the specified page type based on a template of the 
%    specified name stored in the specified template.
%
%    header = DOCXPageHeader('pagetype', templatesrc, 'buildingblockname') 
%    creates a header of the specified page type based on a template of the 
%    specified name stored in the template used by the specified template 
%    source. The template source can be a document or a document part.
%
%    DOCXPageHeader methods:
%        append         - Append a MATLAB or DOM object to this header
%        addHTML        - Appends an HTML markup string to this header
%        addHTMLFile    - Appends the contents of an HTML file to this header
%        close          - Close this header
%        fill           - Fill holes in this header's template
%        moveToNextHole - Move to next hole in this header
%        open           - Open this header 
%
%    DOCXPageHeader properties:
%        Children           - Content of this part
%        CurrentHoleId      - Id of current hole
%        CurrentHoleType    - Type of current hole (inline or block)
%        Id                 - Id of this document
%        Tag                - Tag of this document
%        TemplatePath       - Path of this part's template
%        PageType           - Type of page to which header applies
%
%    See also mlreportgen.dom.DOCXPageLayout, mlreportgen.dom.DOCXPageHeader

%    Copyright 2014-2016 Mathworks, Inc.
%    Built-in class