%mlreportgen.dom.PDFPageFooter Page footer for a PDF document.
%    footer = PDFPageFooter() creates a default page footer based on the 
%    DOM API's default PDF template.
%
%    footer = PDFPageFooter('pageType') creates a page footer that applies
%    to the specified page type and is based on the DOM API's 
%    default PDF template.
%
%      Valid page types:
%        *	'default' - Footer for odd pages of the section, even pages if
%                       no even page footer is specified, and first page if
%                       no first page footer is specified
%        *	'even'    - Footer for even pages of the section
%        *	'first'   - Footer for first page of the section
%
%    footer = PDFPageFooter('pagetype', 'templatepath') creates a page  
%    footer of the specified page type based on the specified template. The 
%    template must be a PDF (pdftx) template. The template may contain
%    holes to be filled during report generation.
%
%    footer = PDFPageFooter('pagetype', 'templatepath', 'embeddedTemplateName') 
%    creates a footer of the specified page type based on a template of the 
%    specified name stored in the specified template.
%
%    footer = PDFPageFooter('pagetype', templatesrc, 'buildingblockname') 
%    creates a footer of the specified page type based on a template of the 
%    specified name stored in the template used by the specified template 
%    source. The template source can be a document, or a document part.
%
%    PDFPageFooter methods:
%        append         - Append a MATLAB or DOM object to this footer
%        addHTML        - Appends an HTML markup string to this footer
%        addHTMLFile    - Appends the contents of an HTML file to this footer
%        close          - Close this footer
%        fill           - Fill holes in this footer's template
%        moveToNextHole - Move to next hole in this footer
%        open           - Open this footer 
%
%    PDFPageFooter properties:
%        Children           - Content of this part
%        CurrentHoleId      - Id of current hole
%        CurrentHoleType    - Type of current hole (inline or block)
%        CurrentPageLayout  - Current page layout 
%        Id                 - Id of this document
%        Tag                - Tag of this document
%        TemplatePath       - Path of this part's template
%        PageType           - Type of page to which footer applies
%
%    See also mlreportgen.dom.PDFPageLayout, mlreportgen.dom.PDFPageHeader

%    Copyright 2015-2016 Mathworks, Inc.
%    Built-in class