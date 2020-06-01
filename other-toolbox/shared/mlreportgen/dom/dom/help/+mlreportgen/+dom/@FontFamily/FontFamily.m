%mlreportgen.dom.FontFamily Font family
%    family = FontFamily() creates a Times New Roman font family.
%
%    family = FontFamily('name') creates the specified font family.
%
%    FontFamily properties:
%        BackupFamilyNames       - Backups for unavailable font
%        ComplexScriptFamilyName - Family to use for complex scripts
%        EastAsiaFamilyName      - Family to use in an East Asia locale
%        FamilyName              - Family name
%        Id                      - Id of this font family object
%        Tag                     - Tag of this font family object

%    Copyright 2014 Mathworks, Inc.
%    Built-in class

%{
properties
     %BackupFamilyNames Backups for unavailable font
     %      Cell array of names of font families that a browser can use 
     %      if the font family specified by FamilyName is not available on
     %      a user's system.
     BackupFamilyNames;

     %ComplexScriptFamilyName Family to use for complex scripts
     %      Name of family to substitute for the font specified by 
     %      FamilyName in a locale that requires a complex script 
     %      (e.g., Arabic) to render text.
     ComplexScriptFamilyName;

     %EastAsiaFamilyName Family to use in an East Asia locale
     %      Name of family to substitute for the font specified by 
     %      FamilyName in an East Asian locale, e.g., China, Japan, Korea.
     EastAsiaFamilyName;

     %FamilyName Family name
     FamilyName;
end
%}