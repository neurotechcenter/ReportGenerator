%mlreportgen.dom.DOCXPageHdrFtr Page Base class for page header and footer
%
%    DOCXPageFooter methods:
%        append         - Append a MATLAB or DOM object to this header or footer
%        addHTML        - Appends an HTML markup string to this header or footer
%        addHTMLFile    - Appends the contents of an HTML file to this header or footer
%        close          - Close this header or footer
%        fill           - Fill holes in this header's or footer's template
%        moveToNextHole - Move to next hole in this header or footer
%        open           - Open this footer 
%
%    DOCXPageFooter properties:
%        Children           - Content of this part
%        CurrentHoleId      - Id of current hole
%        CurrentHoleType    - Type of current hole (inline or block)
%        Id                 - Id of this document
%        Tag                - Tag of this document
%        TemplatePath       - Path of this part's template
%        PageType           - Type of page to which footer applies

%    Copyright 2014-2015 Mathworks, Inc.
%    Built-in class

%{
properties
     %PageType Type of page to which this footer applies
     %      Valid page types:
     %        *	'default' - Footer for odd pages of the section and even 
     %                      pages if no even page footer is specified
     %        *	'even'    - Footer for even pages of the section
     %        *	'first'   - Footer for first page of the section
     PageType;
end
%}