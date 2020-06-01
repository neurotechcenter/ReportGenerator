%mlreportgen.dom.OuterMargin Margin between bounding box and surroundings
%    margin = OuterMargin() creates an unspecified margin between
%    the bounding box of an object and its surroundings.
%
%    margin = OuterMargin('all') creates the specified margin  on all 
%    sides between the bounding box of an object and its surroundings.
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
%    margin = OuterMargin('left', 'right') creates the specified margins  
%    between the left and right sides of the bounding box of an object and 
%    its surroundings.
%
%    margin = OuterMargin('left', 'right', 'top', 'bottom') creates the 
%    specified margins between the sides of the bounding box of an object 
%    and its surroundings.
%
%    OuterMargin properties:
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
%        HAlign('center'), InnerMargin('12pt') ...
%        OuterMargin('0pt', '0pt', '0pt', '12pt')};
%    append(d, p);
%    p = Paragraph('Greetings from MATLAB');
%    p.Style = {Border('solid', 'Green'), ...
%        HAlign('center'), InnerMargin('12pt')};
%    append(d, p);
%    close(d);
%    rptview('test', doctype);
%
%    See also mlreportgen.dom.InnerMargin

%    Copyright 2014-2017 Mathworks, Inc.
%    Built-in class