%mlreportgen.dom.DOCXPageLayout Page layout properties of a Word document
%    section = DOCXPageLayout() creates an empty page layout. 
%
%    DOCXPageLayout properties:
%        
%        Id               - Id of this object
%        PageFooters      - Page footers for this layout
%        PageHeaders      - Page headers for this layout
%        PageMargins      - Margin sizes and page orientation in this layout
%        PageSize         - Size of pages in this layout
%        FirstPageNumber  - Page number of the first page in this layout
%        PageNumberFormat - Page number format in this layout
%        SectionBreak     - Page on which this layout starts
%        Parent           - Parent of this layout
%        RawFormats       - XML markup for unsupported layout formats
%        Style            - Style of this layout
%        Tag              - Tag of this object
%
%    See also mlreportgen.dom.PageFooter,
%    mlreportgen.dom.PageFooter, mlreportgen.dom.PageMargins,
%    mlreportgen.dom.PageSize, mlreportgen.dom.PageNumber

%    Copyright 2015 Mathworks, Inc.
%    Built-in class

%{
properties

     %PageFooters Array of page footer objects
     %      This property may specify as many as three page footers
     %      for this layout, one for the first page of the layout,
     %      one for even pages, and one for odd pages.
     %
     %      See also mlreportgen.dom.PageFooter
     PageFooters;

     %PageHeaders Array of page header objects
     %      This property may specify as many as three page headers
     %      for this layout, one for the first page of the layout,
     %      one for even pages, and one for odd pages. 
     %
     %      See also mlreportgen.dom.DOCXPageHeader
     PageHeaders;

     %PageMargins Page margins for this layout
     %      The value of this property is a PageMargins object
     %      that allows you to set the size of the margins, gutter,
     %      and header and footer for pages in this layout.
     %
     %      See also mlreportgen.dom.PageMargins
     %      
     PageMargins;

     %PageSize Page size and orientation for this layout
     %      The value of this property is a PageSize object that
     %      allows you to set the height and width and orientation of 
     %      pages in this layout.
     %
     %      See also mlreportgen.dom.PageSize
     %      
     PageSize;
	 
     %FirstPageNumber Page number of the first page in this layout
     %      This property specifies the numeric value of the first
     %      page. When its value is empty, page numbering continues
     %      from previous section.
     %
     %      See also mlreportgen.dom.PageNumber
     %      
     FirstPageNumber
	 
     %PageNumberFormat Page number format in this layout
     %      This property specifies the type of characters used to 
     %      represent the page number value.
     %
     %        VALUE     DESCRIPTION
     %         'a'      Lower case alphabetic (a, b, c, ...)
     %         'A'      Upper case alphabetic (A, B, C, ...)
     %         'i'      Lower case roman numerals (i, ii, iii, ...)
     %         'I'      Uppercase roman numerals (I, II, III, ...)
     %         'n'      Arabic numerals
     %         'N'      Arabic numerals
     %
     %      See also mlreportgen.dom.PageNumber
     %      
     PageNumberFormat
	 
     %SectionBreak Page on which this layout starts	 
     %      This property specifies where this page layout starts: 
     %      on the same page as the previous layout, on the next page, 
     %      or on the next odd or even page. An empty value indicates 'Next Page'.
     %
     %        VALUE     
     %      'Same Page' 
     %      'Next Page' 
     %      'Odd Page' 
     %      'Even Page' 
     SectionBreak
	 
     %RawFormats XML markup for unsupported layout formats
     %      This property specifies XML markup to be inserted in
     %      the layout properties Word XML element (w:sectPr) for this
     %      layout. It allows you to programmatically specify layout 
     %      properties that are not specified in the document template 
     %      and are not yet supported directly by the DOM API.
     %
     %      Example:
     %
     %      % Turn on line numbering for a document based on the default
     %      % DOM template.
     %      import mlreportgen.dom.*;
     %      d = Document('myreport', 'docx');
     %      open(d); 
     %      s = d.CurrentPageLayout;
     %      % Note that s.RawFormats is initialized with the markup
     %      % for properties specified by the default template. Thus,
     %      % we must append the line numbering property to these
     %      % existing properties.
     %      s.RawFormats = [s.RawFormats ...
     %      {'<w:lnNumType w:countBy="1" w:start="1" w:restart="newSection"/>'}];
     %      append(d, 'This document has line numbers');
     %      close(d);
     %      rptview('myreport', 'docx');  
     %      
     %      For more information on the w:sectPr element, see
     %      http://officeopenxml.com/WPsection.php.
     %
     %      See also mlreportgen.dom.PageRawFormat
     RawFormats;
	 
end
%}