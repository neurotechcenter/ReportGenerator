%mlreportgen.dom.Leader Create a leader.
%
%    l = Leader() creates a leader of 'dots'.
%    l = Leader('pattern') creates a leader of the specified pattern. Valid
%    pattern values are:
%
%    Value                DESCRIPTION
%    'dots' or '.'       leader of dots
%    'space' or ' '      leader of spaces
%
%    Leader methods:
%        clone          - Clone this leader
%
%    Leader properties:
%        Pattern           - Pattern of the leader
%        Style             - Formats that define this leader's style
%        StyleName         - Name of leader's stylesheet-defined style
%        CustomAttributes  - Custom element attributes
%        Children          - Children of this leader
%        Parent            - Parent of this leader
%        Tag               - Tag of this leader
%        Id                - Id of this leader

%    Copyright 2015 Mathworks, Inc.
%    Built-in class

%{
properties
     %Pattern Name of this leader
     %    Valid pattern values are:
     %
     %    Value                DESCRIPTION
     %    'dots' or '.'       leader of dots
     %    'space' or ' '      leader of spaces
     Pattern;
 
end
%}