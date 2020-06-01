%mlreportgen.dom.PageMargins Margins of pages in a Word or PDF layout
%    margins = PageMargins() specifies one-inch top, bottom, left, and 
%    right margins and half-inch gutter, header, and footer sizes.
%
%    Example:
%
%    % Reset the margins specified by the default DOM template.
%    import mlreportgen.dom.*;
%    d = Document('myreport', 'docx');
%    open(d); 
%    s = d.CurrentDOCXSection;
%    s.PageMargins.Left  = '.5in';
%    s.PageMargins.Right = '.5in';
%    append(d, 'Left and right margins are .5 inch');
%    close(d);
%    rptview('myreport', 'docx');  
%
%    PageMargins properties:
%        Bottom - Bottom margin size
%        Footer - Footer offset (DOCX) or size (PDF)
%        Gutter - Gutter size (DOCX only)
%        Header - Header offset (DOCX) or size (PDF)
%        Id     - Id of this margins object
%        Left   - Left margin size
%        Right  - Right margin size
%        Tag    - Tag of this margins object
%        Top    - Top margin size
%
%    See also mlreportgen.dom.PageLayout

%    Copyright 2015-2017 Mathworks, Inc.
%    Built-in class

%{
properties
     %Bottom Offset of page content from bottom of page
     %    For DOCX output, this property may be positive or negative. If
     %    the value is positive, body text starts at the specified offset
     %    or at the top of the footer whichever is greater, i.e., the 
     %    starting point is automatically adjusted to start above the
     %    footer. If this value is negative, the body content always starts
     %    at the specified offset even if this causes the body content to 
     %    overlap the footer content.
     %
     %    For PDF output, this value must be positive. It specifes the
     %    offset of the footer, if there is a footer, or the body content
     %    from the bottom of the page. 
     %
     %    The value of this property is a string having the format 
     %    valueUnits where Units is an abbreviation for the units in
     %    which the size is expressed. The following abbreviations are
     %    valid:
     %
     %    Abbreviation  Units
     %
     %    px            pixels
     %    cm            centimeters
     %    in            inches
     %    mm            millimeters
     %    pc            picas
     %    pt            points
     Bottom;

     %Footer Offset (DOCX) or size (PDF) of footer
     %    For DOCX output, this property specifies the offset of the page
     %    footer from the bottom of the page. The footer expands upward
     %    from this point to fit the footer content.
     %
     %    For PDF output, this property specifies the size of the page
     %    footer. The page footer resides between the bottom page margin
     %    and the page body. Thus, the body content is offset from the
     %    bottom of the page by an amount equal to the bottom margin and
     %    the footer size.
     %
     %    The value of this property is a string having the format 
     %    valueUnits where Units is an abbreviation for the units in
     %    which the size is expressed. The following abbreviations are
     %    valid:
     %
     %    Abbreviation  Units
     %
     %    px            pixels
     %    cm            centimeters
     %    in            inches
     %    mm            millimeters
     %    pc            picas
     %    pt            points
     Footer;

     %Gutter Size of gutter (DOCX only)
     %    This property specifies the width of the  gutter. This value is
     %    added to the left margin of the first and odd pages of a section
     %    and to the right margin of even pages to allow room for binding
     %    the pages into a book.
     %
     %    The value of this property is a string having the format 
     %    valueUnits where Units is an abbreviation for the units in
     %    which the size is expressed. The following abbreviations are
     %    valid:
     %
     %    Abbreviation  Units
     %
     %    px            pixels
     %    cm            centimeters
     %    in            inches
     %    mm            millimeters
     %    pc            picas
     %    pt            points
     Gutter;

     %Header Offset (DOCX) or size (PDF) of header
     %    For DOCX output, this property specifies the offset of the page
     %    header from the top of the page. The header expands downward
     %    from this point to fit the header content.
     %
     %    For PDF output, this property specifies the size of the page
     %    header. The page header resides between the top page margin
     %    and the page body. Thus, the body content is offset from the
     %    top of the page by an amount equal to the top margin and
     %    the foooter size.
     %
     %    The value of this property is a string having the format 
     %    valueUnits where Units is an abbreviation for the units in
     %    which the size is expressed. The following abbreviations are
     %    valid:
     %
     %    Abbreviation  Units
     %
     %    px            pixels
     %    cm            centimeters
     %    in            inches
     %    mm            millimeters
     %    pc            picas
     %    pt            points
     Header;

     %Left Offset of body content from left side of page
     %    The value of this property is a string having the format 
     %    valueUnits where Units is an abbreviation for the units in
     %    which the size is expressed. The following abbreviations are
     %    valid:
     %
     %    Abbreviation  Units
     %
     %    px            pixels
     %    cm            centimeters
     %    in            inches
     %    mm            millimeters
     %    pc            picas
     %    pt            points
     Left;

     %Right Offset of body content from right side of page
     %    Abbreviation  Units
     %
     %    px            pixels
     %    cm            centimeters
     %    in            inches
     %    mm            millimeters
     %    pc            picas
     %    pt            points
     Right;

     %Top Offset of page content from top of page
     %    For DOCX output, this property may be positive or negative. If
     %    the value is positive, body content starts at the specified 
     %    offset or at the bottom of the header whichever is greater, i.e.,
     %    the starting point is automatically adjusted to start below the
     %    footer. If this value is negative, the body content always starts
     %    at the specified offset even if this causes the body content to 
     %    overlap the header content.
     %
     %    For PDF output, this value must be positive. It specifes the
     %    offset of the header, if there is a header, or the body content
     %    from the top of the page.   
     %
     %    The value of this property is a string having the format 
     %    valueUnits where Units is an abbreviation for the units in
     %    which the size is expressed. The following abbreviations are
     %    valid:
     %
     %    The value of this property is a string having the format 
     %    valueUnits where Units is an abbreviation for the units in
     %    which the size is expressed. The following abbreviations are
     %    valid:
     %
     %    Abbreviation  Units
     %
     %    px            pixels
     %    cm            centimeters
     %    in            inches
     %    mm            millimeters
     %    pc            picas
     %    pt            points 
     Top;
end
%}