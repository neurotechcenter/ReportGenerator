%mlreportgen.dom.Width Width of a table or image
%    width = Width() creates a width of 1 inch.
%
%    width = Width('value') creates the specified width. The 'value'
%    argument is a string having the  format valueUnits where Units is 
%    an abbreviation for the units  in which the size is expressed. 
%    The following abbreviations are valid:
%
%    Abbreviation  Units
%    px            pixels
%    cm            centimeters
%    in            inches
%    mm            millimeters
%    pc            picas
%    pt            points
%    %             percent
%    
%    Width properties:
%        Id    - Id of this object
%        Tag   - Tag of this object
%        Value - If true, text is bold; otherwise, regular weight
%
%    Example:
%
%    import mlreportgen.dom.*;
%    doctype = 'html';
%    d = Document('test', doctype);
%    t = Table(magic(5));
%    t.Style = {Border('inset', 'crimson', '6pt'), Width('50%')};
%    t.TableEntriesInnerMargin = '6pt';
%    t.TableEntriesHAlign = 'center';
%    t.TableEntriesVAlign = 'middle';
%    append(d, t);
%    close(d);
%    rptview('test', doctype);
%    See also mlreportgen.dom.Height

%    Copyright 2014-2017 Mathworks, Inc.
%    Built-in class

%{
properties

     %Value Value of width
     %
     %    Value is a string having the  format valueUnits where Units is 
     %    an abbreviation for the units  in which the size is expressed. 
     %    The following abbreviations are valid:
     %
     %    Abbreviation  Units
     %    px            pixels
     %    cm            centimeters
     %    in            inches
     %    mm            millimeters
     %    pc            picas
     %    pt            points
     %    %             percent
     Value;
end
%}