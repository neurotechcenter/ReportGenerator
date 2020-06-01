%entry Get a table entry
%    entryObj = entry(tableObj, row, col) returns the table entry at 
%    the specified column in the specified row.
%
%    Note: this function throws an error if a row has fewer entries
%    then the table has columns. This can happen, for example, if 
%    the row contains entries that span multiple table columns. 
%    Use a row's NEntries and Entries properties to access table
%    entries that span multiple columns.

%    Copyright 2014 MathWorks, Inc.
%    Built-in function.
