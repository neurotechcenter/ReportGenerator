%mlreportgen.dom.Underline Draw line under text
%    underline = Underline() draws a single line under text
%
%    underline = Underline('type') draws a line of the specified type 
%    under the text.
%
%                                                  VALID FOR
%     TYPE     DESCRIPTION                         WORD HTML/PDF
%     'single'         single line                 X     X
%     'double'         double underline            X
%     'words'          words only (not spaces)     X
%     'thick'          thick underline             X
%     'dotted'         dotted underline            X
%     'dottedHeavy'    thick dotted                X
%     'dash'           dashed underline            X
%     'dashedHeavy'    thick dashed underline      X
%     'dashLong'       long dashed underline       X
%     'dashLongHeavy'  thick long dashed underline X
%     'dotDash'        dot dash underline          X
%     'dotDotDash'     dash dot dot underline      X
%     'dashDotDotHeavy thick dash dot dot          X
%     'dashDotHeavy    thick dash dot              X
%     'none'           no underline                X
%     'wave'           wavy underline              X
%     'wavyDouble'     two wavy underlines         X
%     'wavyHeavy'      thick wavy underline        X  
%
%    underline = Underline('type', color) draws a line of the specified type 
%    and color under the text. The color parameter must be a 
%    mlreportgen.dom.Color object.

%    Copyright 2014-2015 Mathworks, Inc.
%    Built-in class

%{
properties
     %Color Color of underline
     %    The value of this property may be a color name (e.g., 'blue')
     %    or a hexadecimal RGB value (e.g., '#0000ff').
     %
     %    See http://www.crockford.com/wrrrld/color.html for a list
     %    of valid color names.
     Color;

     %Type Type of underline
     %     The value of this property may be
     %
     %                                                  VALID FOR
     %     TYPE     DESCRIPTION                         WORD HTML/PDF
     %     'single'         single line                 X     X
     %     'double'         double underline            X
     %     'words'          words only (not spaces)     X
     %     'thick'          thick underline             X
     %     'dotted'         dotted underline            X
     %     'dottedHeavy'    thick dotted                X
     %     'dash'           dashed underline            X
     %     'dashedHeavy'    thick dashed underline      X
     %     'dashLong'       long dashed underline       X
     %     'dashLongHeavy'  thick long dashed underline X
     %     'dotDash'        dot dash underline          X
     %     'dotDotDash'     dash dot dot underline      X
     %     'dashDotDotHeavy thick dash dot dot          X
     %     'dashDotHeavy    thick dash dot              X
     %     'none'           no underline                X
     %     'wave'           wavy underline              X
     %     'wavyDouble'     two wavy underlines         X
     %     'wavyHeavy'      thick wavy underline        X
     Type;
end
%}