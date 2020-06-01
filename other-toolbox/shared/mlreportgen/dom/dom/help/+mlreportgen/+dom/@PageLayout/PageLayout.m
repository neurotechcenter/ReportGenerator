%mlreportgen.dom.PageLayout Page layout properties of a Word or PDF document
%    section = PageLayout() creates an empty page layout. 
%
%    PageLayout properties:
%        
%        Id          - Id of this object
%        PageFooters - Page footers for this layout
%        PageHeaders - Page headers for this layout
%        PageMargins - Margin sizes and page orientation in this layout
%        PageSize    - Size of pages in this layout
%        Parent      - Parent of this layout
%        RawFormats  - XML markup for unsupported layout formats
%        Style       - Style of this layout
%        Tag         - Tag of this object
%
%    See also mlreportgen.dom.PageFooter,
%    mlreportgen.dom.PageFooter, mlreportgen.dom.PageMargins,
%    mlreportgen.dom.PageSize

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