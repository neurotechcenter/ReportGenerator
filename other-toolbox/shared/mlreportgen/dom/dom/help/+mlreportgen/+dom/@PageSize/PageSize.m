%mlreportgen.dom.PageSize Size, orientation of pages in a Word or PDF layout
%    size = PageSize() specifies an 8.5x11-inch, portrait page
%    layout for pages in a page layout section.
%
%    size = PageSize('height', 'width') specifies a portrait page
%    having the specified height and width.
%
%    size = PageSize('height', 'width', 'orientation') specifies the
%    height, width, and orientation ('portrait' or 'landscape') of pages
%    in a Word or PDF page layout.
%
%    Example:
%
%    % Change the orientation specified by the default DOM template 
%    % ('portrait') to landscape.
%    import mlreportgen.dom.*;
%    d = Document('myreport', 'docx');
%    open(d); 
%    s = d.CurrentPageLayout;
%    s.PageSize.Orientation  = 'landscape';
%    s.PageSize.Height = '8.5in';
%    s.PageSize.Width = '11in';
%    append(d, 'This document has landscape pages');
%    close(d);
%    rptview('myreport', 'docx');  
%
%    PageSize properties:
%        Height      - Height of pages in a Word page layout section
%        Id          - Id of this page size object
%        Orientation - Orientation (landscape or portrait) of section pages
%        Tag         - Tag of this page size object
%        Width       - Width of pages in a Word page layout section
%
%    See also mlreportgen.dom.PageLayout

%    Copyright 2014-2017 Mathworks, Inc.
%    Built-in class

%{
properties
     %Height Height of pages in a page layout
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
     Height;

     %Orientation Orientation (landscape or portrait) of section pages
     %    Valid values for this property are:
     %
     %        * 'portrait'
     %        * 'landscape'
     %
     %    Note: the Height and Width values of this object should reflect
     %    this setting. For example, if the value of this property is
     %    'landscape' and the document is to be printed on 8.5x11-inch
     %    paper, the Height and Width properties should be set to 
     %    '8.5in' and '11in', respectively.
     Orientation;

     %Width Width of pages in a page layout
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
     Width;

 
end
%}