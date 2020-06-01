%mlreportgen.dom.TableRow Creates a table row
%    This class defines a formatted document object
%
%
%    TableRow methods:
%        append         - Append entries to this table
%        clone          - Clone this row
%
%    TableRow properties:
%        CustomAttributes  - Custom row attributes
%        Entries           - Table entries in this row
%        Height            - Height of this row
%        Id                - Id of thi row
%        Style             - Formats that define this row's style
%        StyleName         - Name of row's stylesheet-defined style
%        Tag               - Tag of this row

%    Copyright 2013 Mathworks, Inc.
%    Built-in class

%{
properties
     %Entries Table entries in this row
     Entries;

     %Height Height of this row
     Height;

end
%}