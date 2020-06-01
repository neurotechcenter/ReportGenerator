%mlreportgen.dom.ScaleToFit Scale an image to fit a page
%    scale = ScaleToFit() scales an image to fit between the margins of
%    a Word or PDF page or to fit an entry in a Word or PDF table.
%
%    Note: this format scales an image to fit a table entry only if
%    you specify the table entry's height and width in any of the following
%    ways:
%
%    * By including an mlreportgen.dom.Height or mlreportgen.dom.Width
%      object in the entry's Style property
%
%    * By including a Height or Width object in the parent table's
%      TableEntriesStyle property
%
%    * By including a Height object in the Style property of the parent
%      table ore table section
%
%    * By including a Width object in the Style property of the parent
%      table, table section, or row
%
%    scale = ScaleToFit(tf) scales an image if tf is true.
%
%    ScaleToFit properties:
%        Id    - Id of this object
%        Tag   - Tag of this object
%        Value - Whether to scale an image (true or false)
%
%    Example
%
%    import mlreportgen.dom.*
%    
%    d = Document('s2f', 'pdf');
%    open(d);
%    p = Paragraph('img.Style = {ScaleToFit(true)}');
%    p.Style = {PageBreakBefore};
%    append(d, p);
%    img = Image(which('ngc6543a.jpg'));
%    img.Style = {ScaleToFit};
%    append(d, img);
%    
%    p = Paragraph('Scale to fit table cell');
%    append(d, p);
%    append(d, 'table.entry(1,1).Style = {Height(''1in''), Width(''1in'')}');
%    img = Image(which('ngc6543a.jpg'));
%    img.Style = {ScaleToFit};
%    table = Table({img, Paragraph('Entry 12')});
%    table.Border = 'solid';
%    table.Width = '2in';
%    table.entry(1,1).Style = {Height('1in'), Width('1in')};
%    table.entry(1,2).Border = 'solid';
%    append(d, table);
%    
%    close(d);
%    rptview(d.OutputPath);

%    Copyright 2014-2015 Mathworks, Inc.
%    Built-in class

%{
properties

     %Value Value - Whether to scale an image (true or false)
     Value;
end
%}