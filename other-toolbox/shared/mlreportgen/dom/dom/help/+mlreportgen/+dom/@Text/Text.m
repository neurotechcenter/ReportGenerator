%mlreportgen.dom.Text Create a text object.
%    textObj = Text() creates an empty text object.
%
%    textObj = Text('text') creates a text object containing the specified 
%    text string.
%
%    textObj = Text('text', 'stylename') creates a text object containing 
%    the specified text string and having the specified style. The style 
%    must be defined in the stylesheet of the template of the document to 
%    which this text object is appended.
%
%    Text methods:
%        append         - Append a custom element to this text object
%        clone          - Clone this text object
%
%    Text properties:
%        BackgroundColor   - Background color of this text
%        Bold              - Whether this text is bold
%        Color             - Color of this text
%        Content           - String content of this text object
%        CustomAttributes  - Custom element attributes
%        FontFamilyName    - Name of font family used to render this text
%        FontSize          - Size of font used to render this text
%        Id                - Id of this text
%        Italic            - Whether this text is italic
%        Style             - Formats that define this text's style
%        Strike            - Type of strikethrough to draw through text
%        StyleName         - Name of this texts's stylesheet-defined style
%        Tag               - Tag of this text
%        Underline         - Type of line, if any, to draw under this text
%        WhiteSpace        - Preserves white space and line breaks in text

%    Copyright 2013-2017 Mathworks, Inc.
%    Built-in class

%{
properties
     %BackgroundColor Background color of this text
     %    You may specify the background color either as a color
     %    name (e.g., 'red') or a hexadecimal RGB value of the form
     %    '#rrggbb', e.g., 'FF0000'. If this property is empty and the 
     %    text’s StyleName property specifies a style sheet style, the 
     %    color of this text is determined by the specified style. 
     %
     %    Note: Setting this property adds a corresponding BackgroundColor 
     %    format object to this text’s Style property. Unsetting this 
     %    property removes the object.
     %
     BackgroundColor;

     %Bold Whether this text is bold
     %    If true, this property cause this text to be rendered bold.
     %    If this property is false, the text is rendered normal weight. 
     %    If this property is empty and the text’s StyleName property
     %    specifies a stylesheet style, the weight of this text is 
     %    determined by the specified style.
     %
     %    Note: Setting this property adds a corresponding Bold 
     %    format object to this text’s Style property. Unsetting this 
     %    property removes the object.
     %
     Bold;

     %Color Color of this text
     %    Color of this text. You may specify the color either as a color
     %    name (e.g., 'red') or a hexadecimal RGB value of the form
     %    '#rrggbb', e.g., 'FF0000'. If this property is empty and the 
     %    text’s StyleName property specifies a style sheet style, the 
     %    color of this text is determined by the specified style.
     %
     %    Note: Setting this property adds a corresponding Color 
     %    format object to this text’s Style property. Unsetting this 
     %    property removes the object.
     %
     Color;

     %Content String content of this text object
     %     Text string contained by this text object.
     Content;

     %FontFamilyName Name of font family to be used to render this text.
     %    If you need to specify substitutions for this font, do not set 
     %    this property. Instead create and add a FontFamily object to 
     %    this text's Style property.
     %
     %    Note: Setting this property adds a corresponding FontFamily 
     %    format object to this text's Style property. Unsetting this 
     %    property removes the object.
     FontFamilyName;

     %FontSize Size of font to be used to render this text.
     %
     %    The value of this property is a string having the format 
     %    valueUnits where Units is an abbreviation for the units in
     %    which the size is expressed. The following abbreviations are
     %    valid:
     %
     %    Abbreviation  Units
     %
     %    px            pixels
     %    cm            centimeters
     %    in            inches
     %    mm            millimeters
     %    pc            picas
     %    pt            points
     %
     %
     %    Note: Setting this property adds a corresponding FontSize format
     %    object to this text's Style property. Unsetting this property
     %    removes the object.
     FontSize;

     %Italic Whether this text is italic
     %    If true, this property cause this text to be rendered italic.
     %    If this property is false, the text is rendered upright. 
     %    If this property is empty and the text’s StyleName property
     %    specifies a stylesheet style, the slant of this text is 
     %    determined by the specified style.
     %
     %    Note: Setting this property adds a corresponding Italic 
     %    format object to this text’s Style property. Unsetting this 
     %    property removes the object.
     %
     Italic;

     %Strike Type of strikethrough, if any, to draw through this text.
     %    Valid types are:
     %
     %                                                  Applies To
     %    Valid Value      Description                  DOCX    HTML
     %    'double'         Double line                    X       
     %    'none'           Do not draw a strikethrough    X       X	 
     %    'single'         Single line                    X       X
     %
     %    Note: Setting this property adds a corresponding Strike format 
     %    object to this text's Style property. Unsetting this property
     %    removes the object.
     Strike;

     %Underline Type of line, if any, to draw under this text
     %    Type of line, if any, to draw under this text. For HTML output, 
     %    the only valid values for this property are 'single' and 'none'.  
     %    In addition to these types, DOCX output supports an extensive 
     %    array of other underline types: 
     %
     %    Valid Value        Description
     %
     %    single             Single underline
     %    words              Underline non-space characters only
     %    double             Double underline
     %    thick              Thick underline
     %    dotted             Dotted underline
     %    dottedHeavy        Thick dotted underline
     %    dash               Dashed underline
     %    dashedHeavy        Thick dashed underline
     %    dashLong           Long dashed underline
     %    dashLongHeavy		 Thick long dashed underline
     %    dotDash		     Dash-dot underline
     %    dashDotHeavy		 Thick dash-dot underline
     %    dotDotDash         Dash-dot-dot underline
     %    dashDotDotHeavy    Thick dash-dot-dot underline
     %    wave               Wavy underline
     %    wavyHeavy          Heavy wavy underline
     %    wavyDouble         Double wavy underline
     %    none               No underline
     %
     %    If this property is empty and the text’s StyleName property 
     %    specifies a style sheet style, the line drawn under this text, 
     %    if any, is determined by the specified style. 
     %
     %    If you want to specify the color as well as the type of the
     %    underline, do not set this property, Instead, set this text’s
     %    Style property to include an Underline format object that 
     %    specifies the desired type and color.
     %
     %    Note: Setting this property adds a corresponding Underline 
     %    format object to this text’s Style property. Unsetting this 
     %    property removes the object.
     Underline;

     %Preserves white space and line breaks in text.
     %
     %                                                    Applies To
     %    Valid Value   Description	                       DOCX HTML
	 %	
     %    'normal'      Do not preserve white space and      X    X
     %                  line breaks in text	 	 
     %    'nowrap'      Sequences of white space collapse         X
     %                  into a single whitespace. Text never
     %                  wraps to the next line.  		 
     %    'pre'         Preserves white space. Text wraps         X
     %                  only on line breaks Acts like the
     %                  <pre> tag in HTML.		 
     %    'pre-line'    Sequences of white space                  X
     %                  collapse into a single white space.
     %                  Text wraps when necessary and on
     %                  line breaks.		 
     %    'pre-wrap'    Preserves white space. Text wraps         X
     %                  when necessary and on line breaks     X   X		 
     %    'preserve'    Same as pre. This  is the only
     %                  option that works in the MATLAB 
     %                  browser. For HTML output, this option
     %                  wraps the text content of a Text
     %                  object in HTML pre tags. If the text
     %                  contains line feeds, the option wraps
     %                  each line of text in a pre element
     %                  followed by a <br/> element. This is
     %                  done to ensure that the HTML output
     %                  is also valid XML and hence can be
     %                  parsed by an XML parser for
     %                  verification purposes.	 	 
     %
     %     Note: Setting this property adds a corresponding WhiteSpace 
     %     format object to this text’s Style property. Unsetting this 
     %     property removes the object.
     WhiteSpace;
end
%}