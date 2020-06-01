%mlreportgen.dom.AutoNumberStream Autonumber stream
%    An autonumber stream generates a sequence of numbers to be used to
%    number chapters, tables, figures, and other document objects.
%    Objects of this class are created by 
%    mlreportgen.dom.Document.createAutoNumberStream.
%
%    AutoNumberStream properties:
%        CharacterCase - Character case of generated numbers
%        CharacterType - Character type of generated numbers
%        Id            - Id of this object
%        InitialValue  - Initial value of generated numbers
%        StreamName    - Name of stream
%        Tag - Tag of this object
%
%    See also mlreportgen.dom.AutoNumber, 
%    mlreportgen.dom.Document.createAutoNumberStream

%    Copyright 2014 Mathworks, Inc.
%    Built-in class

%{
properties
     %CharacterCase Character case of generated numbers
     %    The value of this property may be
     %
     %    VALUE   DESCRIPTION
     %    'lower' Loser case (e.g., a, b, c, ...)
     %    'upper' Upper case (e.g., A, B, C, ...)
     %
     CharacterCase;

     %CharacterType Character type of generated numbers
     %    The value of this property may be
     %
     %    VALUE        DESCRIPTION
     %    'alphabetic' e.g., a, b, c, ...
     %    'arabic'     e.g., 1, 2, 3, ...
     %    'roman'      e.g., i, ii, iii, ...
     %
     CharacterType;

     %Initial value Initial value of generated numbers
     %    The value of this property should be one less than the number
     %    you want to be generated first. For example, if you want the
     %    number of the first item to be numbered by this stream to be 2,
     %    you should set the value of this property to be 1.
     %
     %    See also mlreportgen.dom.CounterInc, mlreportgen.dom.CounterReset
     InitialValue;

     %StreamName Name of stream
     StreamName;
end
%}