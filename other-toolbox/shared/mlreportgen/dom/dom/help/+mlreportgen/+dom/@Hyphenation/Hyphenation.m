%mlreportgen.dom.Hyphenation Hyphenation
%    hyph = Hyphenation() creates hyphenation with '-' as the 
%    hyphenation character.
%
%    hyph = Hyphenation(CHAR) creates hyphenation with CHAR as 
%    the hyphenation character. CHAR can be a space or any other
%    character.
%
%    hyph = Hyphenation('') creates hyphenation with empty space 
%    as the hyphenation character.
%
%    hyph = Hyphenation([]) disables hyphenation.
%
%    hyph = Hyphenation(true) creates hyphenation with the 
%    default '-' as the hyphenation character.
%
%    hyph = Hyphenation(false) disables hyphenation.
%
%    hyph = Hyphenation('hyph') creates hyphenation with the default 
%    '-' as the hyphenation character.
%
%    hyph = Hyphenation('space') creates hyphenation with ' ' as
%    the hyphenation character.
%
%    hyph = Hyphenation('none') disables hyphenation.
%
%    Hyphenation properties:
%       Id    - Id of this object
%       Tag   - Tag of this object
%       Value - Hyphenation character
%
%    Example:
%
%       import mlreportgen.dom.*
%       d = Document('hyph_example', 'pdf');
%       open(d);
%       t = Table(rand(6));
%       t.Border = 'Solid';
%       t.RowSep = 'Solid';
%       t.ColSep = 'Solid';
%       t.Style = [t.Style {Hyphenation(char(8212))}]; %em dash (extra wide dash)
%       append(d,t);
%       close(d);
%       rptview(d);

%    Copyright 2014-2018 Mathworks, Inc.
%    Built-in class


%{
properties
     %Value Hyphenation character
     %    The value of this property is a hyphenation character.
     %
     %    Special values:
     %    []        Disables hyphenation
     %    ''        Uses empty space as hyphenation character.
     %
     Value;
end
%}
