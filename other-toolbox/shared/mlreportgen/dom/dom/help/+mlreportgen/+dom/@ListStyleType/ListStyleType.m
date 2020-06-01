%mlreportgen.dom.ListStyleType Type of list-item marker for a list
%    lisyStyleTypeObj = ListStyleType() creates a format object which
%    specifies the list-item marker for the list as "disc".
%
%    lisyStyleTypeObj = ListStyleType(value) creates a format object which
%    specifies the list-item marker for the list as the specified value.
%
%    Note: This property applies only to HTML and PDF documents. This
%    format is not supported programmatically for DOCX, but can be achieved
%    using template list styles.
%
%    ListStyleType properties:
%        Id    - Id of this object
%        Tag   - Tag of this object
%        Value - Name of the list-item marker
%
%    Example:
%
%    import mlreportgen.dom.*
%    d = Document('mydoc');
%    % Create an unordered list with list-item marker as 'circle'
%    ul = UnorderedList({'a','b','c'});
%    ul.Style = {ListStyleType('circle')};
%    append(d,ul);
%    close(d);
%    rptview(d.OutputPath);

%    Copyright 2015 MathWorks, Inc.
%    Built-in class

%{
properties
     %Value Name of the list-item marker
     %    The value of this property specifies the name of the list-item
     %    marker to be used for the list items
     %    Valid values are:
     %
     %    VALUE                       DESCRIPTION
     %    'circle'                    The marker is a circle
     %    'cjk-ideographic'           The marker is plain ideographic numbers
     %    'decimal'                   The marker is a number
     %    'decimal-leading-zero'      The marker is a number with leading zeros (01, 02, 03, etc.)
     %    'disc'                      Default value. The marker is a filled circle
     %    'hiragana'                  The marker is traditional Hiragana numbering
     %    'hiragana-iroha'            The marker is traditional Hiragana iroha numbering
     %    'katakana'                  The marker is traditional Katakana numbering
     %    'katakana-iroha'            The marker is traditional Katakana iroha numbering
     %    'lower-alpha'               The marker is lower-alpha (a, b, c, d, e, etc.)
     %    'lower-greek'               The marker is lower-greek
     %    'lower-latin'               The marker is lower-latin (a, b, c, d, e, etc.)
     %    'lower-roman'               The marker is lower-roman (i, ii, iii, iv, v, etc.)
     %    'none'                      No marker is shown
     %    'square'                    The marker is a square
     %    'upper-alpha'               The marker is upper-alpha (A, B, C, D, E, etc.)
     %    'upper-greek'               The marker is upper-greek
     %    'upper-latin'               The marker is upper-latin (A, B, C, D, E, etc.)
     %    'upper-roman'               The marker is upper-roman (I, II, III, IV, V, etc.)
     Value;
end
%}