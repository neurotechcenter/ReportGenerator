%mlreportgen.dom.InnerMargin Margin between content and bounding box
%    margin = InnerMargin() creates an unspecified margin between
%    the content of an object and its bounding box.
%
%    margin = InnerMargin('all') creates the specified margin  on all 
%    sides between the content of an object and its bounding box.
%    The value of 'all' is a string having the 
%    format valueUnits where Units is an abbreviation for the units 
%    in which the size is expressed. The following abbreviations are
%    valid:
%
%    Abbreviation  Units
%    px            pixels
%    cm            centimeters
%    in            inches
%    mm            millimeters
%    pc            picas
%    pt            points
%
%    margin = InnerMargin('left', 'right') creates the specified margins  
%    between the left and right sides of the content of an object and 
%    its bounding box.
%
%    margin = InnerMargin('left', 'right', 'top', 'bottom') creates the 
%    specified margins between sides of the content of an object and 
%    its bounding box.
%
%    InnerMargin properties:
%        Bottom - Size of bottom margin
%        Left   - Size of left margin
%        Id     - Id of this object
%        Right  - Size of right margin
%        Tag    - Tag of this object
%        Top    - Size of top margin
%
%    Example:
%
%    import mlreportgen.dom.*;
%    doctype = 'html';
%    d = Document('test', doctype);
%    p = Paragraph('Hello World');
%    p.Style = {Border('solid', 'Red'), ...
%        HAlign('center'), InnerMargin('12pt')};
%    append(d, p);
%    close(d);
%    rptview('test', doctype);
%
%    See also mlreportgen.dom.OuterMargin

%    Copyright 2014-2017 Mathworks, Inc.
%    Built-in class