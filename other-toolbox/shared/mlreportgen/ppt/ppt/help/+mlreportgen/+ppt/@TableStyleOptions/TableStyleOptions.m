%mlreportgen.ppt.TableStyleOptions Emphasize a table's rows or columns
%    Instances of this class emphasize or deemphasize a table's rows
%    and columns. The table style specified by the table's StyleName
%    property determines the distinctive colors and fonts used to 
%    emphasize rows and columns. This object has no effect if the table
%    does not specify a style.
%
%    format = TableStyleOptions() emphasizes the table's first row 
%    (i.e., the header row) and stripes alternate succeeding rows (i.e.,
%    the table body rows).
%
%    TableStyleOptions properties:
%        FirstRow           - Emphasizes a table's first row
%        LastRow            - Emphasizes a table's last row
%        FirstColumn        - Emphasizes a table's first column
%        LastColumn         - Emphasizes a table's last column
%        BandedRows         - Stripes alternate table rows
%        BandedColumns      - Stripes alternate table columns
%        Tag                - Tag of this object
%        Id                 - Id of this object
%
%
%    Example:
%    clear import
%    import mlreportgen.ppt.*
%    slidesFile = 'myppt.pptx';
%    slides = Presentation(slidesFile);
%    add(slides,'Title and Content'); 
%
%    % create table
%    t = Table(magic(5));
%
%    % set table StyleName property
%    t.StyleName = 'Medium Style 2 - Accent 1';
%
%    % apply default TableStyleOptions format to the table, which 
%    % emphasizes first row and stripes alternate rows
%    t.Style = {TableStyleOptions()};
%
%    replace(slides,'Title','Table with TableStyleOptions format'); 
%    replace(slides,'Content',t); 
%
%    close(slides);
%    if ispc
%       winopen(slides.OutputPath);
%    end

%    Copyright 2015 MathWorks, Inc.
%    Built-in class

%{
properties

    %FirstRow Emphasizes a table's first (header) row
     %    The value of this property may be true or false. True (the 
     %    default) emphasizes the table's first row, using the formatting 
     %    defined by the table style specified by the table's StyleName 
     %    property.
     %  
     %    Note: This property correspond to the "Header Row" option in the
     %    PowerPoint editor's Table Tools Design tab.
     FirstRow;

    %LastRow Emphasizes a table's last row
     %    The value of this property is false by default. True 
     %    emphasizes the table's last row, using the formatting defined by
     %    the table style specified by the table's StyleName property.
     %  
     %    Note: This property correspond to the "Total Row" option in the
     %    PowerPoint editor's Table Tools Design tab.
     LastRow;

    %FirstColumn Emphasizes a table's first column
     %    The value of this property is false by default. True emphasizes
     %    the table's last row, using the formatting defined by
     %    the table style specified by the table's StyleName property.
     %  
     %    Note: This property correspond to the "First Column" option in 
     %    the PowerPoint editor's Table Tools Design tab.
     FirstColumn;

    %LastColumn Emphasizes a table's last column
     %    The value of this property is false by default. True emphasizes
     %    the table's last row, using the formatting defined by
     %    the table style specified by the table's StyleName property.
     %  
     %    Note: This property correspond to the "Last Column" option in the
     %    PowerPoint editor's Table Tools Design tab.
     LastColumn;

    %BandedRows Stripes alternate rows
     %    The value of this property is true by default. True stripes 
     %    (varies the background color of) alternate table rows to create a
     %    banded effect.
     %
     %    Note: This property correspond to the "Banded Rows" option in the
     %    PowerPoint editor's Table Tools Design tab.
     BandedRows;

    %BandedColumns Stripes alternate columns
     %    The value of this property is false by default. True stripes 
     %    (varies the background color of) alternate table columns to 
     %    create a banded effect.
     %
     %    Note: This property correspond to the "Banded Columns" option in 
     %    the PowerPoint editor's Table Tools Design tab.
     BandedColumns;

end
%}