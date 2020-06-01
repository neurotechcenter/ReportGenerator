%mlreportgen.dom.TextOrientation Text orientation in a table entry or row
%
%    orient = TextOrientation() orients the text horizontally in a table
%    row or entry.
%
%    orient = TextOrientation('value') orients the text in the specified
%    direction.
%
%    orient = TextOrientation('value', 'width') orients the text in the
%    specified direction and has the specified rotated text width. The
%    width property adjusts the height of the row in the direction where
%    the text rotation occurs. To avoid truncating the rotated text, the
%    width property can be set to the value that allows the display of the
%    longest string in the table row.
%
%    VALUE        DESCRIPTION
%    'horizontal' Draw the text horizontally
%    'up'         Rotate the text 90 degrees counterclockwise
%    'down'       Rotate the text 90 degrees clockwise
%
%
%    TextOrientation properties:
%        Id    - Id of this object
%        Tag   - Tag of this object
%        Value - Orientation of text in a table row or entry
%        Width - Table Entry rotated text width
%
%    NOTE: "Width" property applies only to PDF output.
%
%    Example
%
%     import mlreportgen.dom.*
%     d = Document('mydoc1', 'html');
%     HeadStyle = {Bold, OuterMargin('0in')};
%     ch1 = Paragraph('Col1');
%     ch1.Style = HeadStyle;
%     ch2 = Paragraph('Col2');
%     ch2.Style = HeadStyle;
%     t = Table({ch1, ch2; 'entry1', 'entry2'});
%     EntryStyle = {TextOrientation('down'), VAlign('middle')};
%     t.entry(1,1).Style = EntryStyle;
%     t.entry(1,2).Style = EntryStyle;
%     t.row(1).Style = {RowHeight('24pt', 'atleast')};
%     append(d, t);
%     close(d);
%     rptview(d.OutputPath);

%    Copyright 2015-2017 Mathworks, Inc.
%    Built-in class

%{
properties

     %Value Orientation of text in a table row or entry
     %
     % VALUE        DESCRIPTION
     % 'horizontal' Draw the text horizontally
     %  'up'        Rotate the text 90 degrees counterclockwise
     %  'down'      Rotate the text 90 degrees clockwise
     Value;

     %Width Table Entry rotated text width
     %    Width is a string having the format valueUnits where Units is
     %    an abbreviation for the units in which the size is expressed.
     %    The following abbreviations are valid:
     %
     %    Abbreviation  Units
     %    px            pixels
     %    cm            centimeters
     %    in            inches
     %    mm            millimeters
     %    pc            picas
     %    pt            points
     Width;
end
%}