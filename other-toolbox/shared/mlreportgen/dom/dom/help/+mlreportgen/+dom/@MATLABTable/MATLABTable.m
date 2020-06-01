%mlreportgen.dom.MATLABTable Convert a MATLAB table to a DOM table
%    domTableObj = MATLABTable(matlabTable) creates a DOM table object of
%    type MATLABTable from a MATLAB table object. This constructor assigns
%    "rgMATLABTable" to the StyleName property of this table. The DOM API's
%    default HTML, Word, and PDF templates define this style in their style
%    sheets. To customized the default appearance of the table, you can
%    override the default definitions in the template or define your own
%    style and assign its name to the StyleName property of this table.
%
%    domTableObj = MATLABTable(matlabTable, styleName) creates a DOM table
%    object of type MATLABTable from a matlab table object and assigns
%    a table style name to the DOM table object.
%
%    Example:
%
%    import mlreportgen.dom.*
%
%    lastName = {'Smith';'Johnson';'Williams';'Jones';'Brown'};
%    age = [38;43;38;40;49];
%    height = [71;69;64;67;64];
%    weight = [176;163;131;133;119];
%    bloodPressure = [124 93; 109 77; 125 83; 117 75; 122 80];
%    matlabTable = table(age,height,weight,bloodPressure,...
%                  'RowNames', lastName);
%
%    rpt = Document('mydoc', 'pdf');
%
%    % Append table directly to the document.
%    domTable = append(rpt, matlabTable);
%    domTable.StyleName = 'MyMATLABTableStyle;
%
%    % Append table indirectly to the document.
%    append(rpt, MATLABTable(matlabTable, 'MyMATLABTableStyle'))
%
%    close(rpt);
%    rptview(rpt.OutputPath);
%    
%
%    MATLABTable properties:
%      BackgroundColor         - Color of this table's background
%      Body                    - Body section of this table
%      Border                  - Type of border to be drawn around table
%      BorderColor             - Color of this table's border
%      BorderCollapse          - Whether to collapse borders (HTML only)
%      BorderWidth             - Width of this table's border
%      Children                - Children (sections) of this table
%      ColSep	               - Type of line to be drawn between columns
%      ColSepColor             - Color of this table's column separator
%      ColSepWidth             - Width of this table's column separator
%      BorderWidth             - Width of this table's border
%      ColSpecGroups           - Array of table column group properties
%      CustomAttributes        - Custom attributes of this table
%      FlowDirection           - Direction of text flow in this table
%      Footer                  - Footer section of this table
%      Id                      - Id of this table
%      HAlign                  - Horizontal alignment of this table
%      Header                  - Header section of this table
%      HeaderRule              - Defines a rule between header and body
%      NCols                   - Number of columns in this table
%      OuterLeftMargin         - Outer left margin (indent) of this table
%      Parent                  - Parent of this table
%      RowNamesRule            - Whether to display row names rule
%      RowSep                  - Type of line to be drawn between rows
%      RowSepColor             - Color of this table's row separator
%      RowSepWidth             - Width of this table's row separator
%      Style                   - Formats that apply to this table
%      StyleName               - Name of table defined in a stylesheet
%      TableEntriesHAlign      - Default horizontal alignment of entries
%      TableEntriesInnerMargin - Inner margin (padding) of table's entries
%      TableEntriesStyle       - Style of this table's table entries
%      TableEntriesVAlign      - Default vertical alignment of entries
%      Tag                     - Tag of this table
%      Width                   - Width of this table
%
%    MATLABTable methods:
%      append          - Append a row to the body of this table.
%      appendFooterRow - Append a row to this table's footer.
%      appendHeaderRow - Append a row to this table's header.
%      clone  - Clone this table
%
%    Note: You can set the StyleName property of any of a MATLAB table's
%    sections, thereby overriding the style specified by the MATLAB table
%    itself. However, if you do this for a Word document, you must 
%    explicitly specify the width of each section's columns to ensure
%    that all sections have the same width. This is because Word, unlike
%    HTML and PDF, has no built-in support for formal tables, forcing the DOM
%    API to simulate a MATLAB table as three tables, one for each section,
%    embedded in a 3x1 table.
%
%    See also mlreportgen.dom.Table, mlreportgen.dom.FormalTable

%    Copyright 2016 Mathworks, Inc.
%    Built-in class

%{
properties
     %HeaderRule - Rule between header and body sections of this table
     %      The default value of this property is a HorizontalRule
     %      object that defines a horizontal rule between the header
     %      and body sections of this table. You customize the rule by
     %      changing the rule's properties.
     HeaderRule;

     %RowNamesRule - Whether to include a rule above the row names column
     %      Set this property to true to create a rule above the table's
     %      row names column. The rule has the same properties as the
     %      header rule.
     RowNamesRule;

end
%}