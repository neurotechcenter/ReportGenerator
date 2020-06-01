%mlreportgen.dom.PDFPageHeader Page header for a PDF document.
%    header = PDFPageHeader() creates a default page header based on the 
%    DOM API's default PDF template.
%
%    header = PDFPageHeader('pagetype') creates a page header that applies
%    to the specified page type and is based on the DOM API's 
%    default PDF template.
%
%      Valid page types:
%        *	'default' - Header for odd pages of the section, even pages if
%                       no even page header is specified, and first page if
%                       no first page header is specified
%        *	'even'    - Header for even pages of the section
%        *	'first'   - Header for first page of the section
%
%    header = PDFPageHeader('pagetype', 'templatepath') creates a page  
%    header of the specified page type based on the specified template. The 
%    template must be a PDF (pdftx) template. The template may contain 
%    holes to be filled during report generation.
%
%    header = PDFPageHeader('pagetype', 'templatepath', 'embeddedTemplateName') 
%    creates a header of the specified page type based on a template of the 
%    specified name stored in the specified template.
%
%    header = PDFPageHeader('pagetype', templatesrc, 'buildingblockname') 
%    creates a header of the specified page type based on a template of the 
%    specified name stored in the template used by the specified template 
%    source. The template source can be a document, or a document part.
%
%    PDFPageHeader methods:
%        append         - Append a MATLAB or DOM object to this header
%        addHTML        - Appends an HTML markup string to this header
%        addHTMLFile    - Appends the contents of an HTML file to this header
%        close          - Close this header
%        fill           - Fill holes in this header's template
%        moveToNextHole - Move to next hole in this header
%        open           - Open this header 
%
%    PDFPageHeader properties:
%        Children           - Content of this part
%        CurrentHoleId      - Id of current hole
%        CurrentHoleType    - Type of current hole (inline or block)
%        CurrentPageLayout  - Current page layout properties
%        Id                 - Id of this document
%        Tag                - Tag of this document
%        TemplatePath       - Path of this part's template
%        PageType           - Type of page to which header applies
%
%    See also mlreportgen.dom.PDFPageLayout, mlreportgen.dom.PDFPageFooter

%    Copyright 2015-2016 Mathworks, Inc.
%    Built-in class