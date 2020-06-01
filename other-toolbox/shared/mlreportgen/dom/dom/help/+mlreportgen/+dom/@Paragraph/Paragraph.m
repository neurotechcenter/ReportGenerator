%mlreportgen.dom.Paragraph Create a formatted block of text, i.e., a paragraph.
%     paraObj = Paragraph('text') creates a paragraph containing a text 
%     object containing the specified text string.
%
%     paraObj = Paragraph('text', 'StyleName') creates a paragraph having 
%     the specified paragraph style and containing a text object 
%     containing the specified text string. The paragraph style must be 
%     defined in the template used to create the document to which this 
%     paragraph is appended.
%
%     paraObj = Paragraph(obj) creates a paragraph containing the specified
%     object where the object can be any of the following mlreportgen.dom
%     types:
%
%        * ExternalLink
%        * Image
%        * InternalLink
%        * Text
%
%    Paragraph methods:
%        append         - Append content to this paragraph
%        clone          - Clone this paragraph
%
%    Paragraph properties:
%        BackgroundColor   - Background color of this paragraph
%        Bold              - Whether paragraph text is bold
%        Color             - Color of paragraph text
%        CustomAttributes  - Custom element attributes
%        FirstLineIndent   - Amount to indent paragraph's first line
%        FontFamilyName    - Name of font family used to render paragraph
%        FontSize          - Size of font used to render paragraph
%        HAlign            - Horizontal alignment of this paragraph.  
%        Id                - Id of this paragraph
%        Italic            - Whether this paragraph is italic
%        OuterLeftMargin   - Outer left margin (left indent) of paragraph
%        OutlineLevel      - Outline levelof this paragraph
%        Style             - Formats that define this paragraph's style
%        Strike            - Type of strikethrough through paragraph
%        StyleName         - Name of paragraph's stylesheet-defined style
%        Tag               - Tag of this paragraph
%        Underline         - Type of line, if any, to draw under paragraph
%        WhiteSpace        - Preserves white space and line breaks

%    Copyright 2013-2017 Mathworks, Inc.
%    Built-in class

%{
properties
     %BackgroundColor Background color of this paragraph
     %    You may specify the background color either as a color
     %    name (e.g., 'red') or a hexadecimal RGB value of the form
     %    '#rrggbb', e.g., 'FF0000'. If this property is empty and the 
     %    paragraph’s StyleName property specifies a style sheet style, the 
     %    color of this paragraph is determined by the specified style. 
     %
     %    Note: Setting this property adds a corresponding BackgroundColor 
     %    format object to this paragraph’s Style property. Unsetting this 
     %    property removes the object.
     %
     BackgroundColor;

     %Bold Whether this paragraph is bold
     %    If true, this property cause this paragraph to be rendered bold.
     %    If this property is false, the paragraph is rendered normal weight. 
     %    If this property is empty and the paragraph’s StyleName property
     %    specifies a stylesheet style, the weight of this paragraph is 
     %    determined by the specified style.
     %
     %    Note: Setting this property adds a corresponding Bold 
     %    format object to this paragraph’s Style property. Unsetting this 
     %    property removes the object.
     %
     Bold;

     %Color Color of this paragraph
     %    Color of this paragraph. You may specify the color either as a color
     %    name (e.g., 'red') or a hexadecimal RGB value of the form
     %    '#rrggbb', e.g., 'FF0000'. If this property is empty and the 
     %    paragraph’s StyleName property specifies a style sheet style, the 
     %    color of this paragraph is determined by the specified style.
     %
     %    Note: Setting this property adds a corresponding Color 
     %    format object to this paragraph’s Style property. Unsetting this 
     %    property removes the object.
     %
     Color;

     %FirstLineIndent Amount to indent paragraph's first line.
     %    The amount may be negative. In this case, the first line is not 
     %    indented. Instead, the lines that succeed the first line are 
     %    indented. The value of this property is a string having the 
     %    format valueUnits where Units is an abbreviation for the units 
     %    in which the size is expressed. The following abbreviations are
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
     %   Note: Setting this property adds a corresponding FirstLineIndent 
     %   format object to this paragraph's Style property. Unsetting this
     %   property removes the object.
     FirstLineIndent;

     %FontFamilyName Name of font family to be used to render this paragraph.
     %    If you need to specify substitutions for this font, do not set 
     %    this property. Instead create and add a FontFamily object to 
     %    this paragraph's Style property.
     %
     %    Note: Setting this property adds a corresponding FontFamily 
     %    format object to this paragraph's Style property. Unsetting this 
     %    property removes the object.
     FontFamilyName;

     %FontSize Size of font to be used to render this paragraph.
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
     %    object to this paragraph's Style property. Unsetting this property
     %    removes the object.
     FontSize;

     %HAlign Horizontal alignment of this paragraph.  
     %     Valid values are:
     %                                                           Applies To
     %     Valid Value       Description 	                      DOCX HTML 	
     %     'center'          Align center                           X    X	 	 
     %     'distribute'      Distribute all characters equally      X	 	
     %     'justify'         Justified                                   X		 
     %     'KashidaHigh'     Widest Kashida length                  X 	
     %     'KashidaLow'      Low Kashida length                     X
     %     'KashidaMedium'   Medium Kashida length                  X	
     %     'left'            Align left                             X    X
     %     'right'           Align right                            X    X
     %     'ThaiDistribute'  Thai language justification            X	 	
     %
     %     Note: Kashida is a type of justification used for some cursive
     %     scripts, primarily Arabic and Persian.
     HAlign;

     %Italic Whether this paragraph is italic
     %    If true, this property cause this paragraph to be rendered italic.
     %    If this property is false, the paragraph is rendered upright. 
     %    If this property is empty and the paragraph’s StyleName property
     %    specifies a stylesheet style, the slant of this paragraph is 
     %    determined by the specified style.
     %
     %    Note: Setting this property adds a corresponding Italic 
     %    format object to this paragraph’s Style property. Unsetting this 
     %    property removes the object.
     %
     Italic;

     %OuterLeftMargin Outer left margin (left indent) of paragraph
     %    This property specifies the space between the left outer 
     %    boundary of this paragraph and the left inner boundary of its 
     %    container. This is equivalent to the left indentation 
     %    property of a Word pragraph.
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
     %    Note: Setting this property adds a corresponding OuterMargin 
     %    object to this paragraph's Style property. Unsetting this 
     %    property removes the object. If you want to indent a paragraph
     %    from both the left and right margin of a page, do not set this
     %    property. Instead, add an OuterMargin object specifying the left
     %    and right indents to the paragraph's Style property.
     %
     %    Example
     %
     %    The following lines indent a paragraph a half-inch from the left 
     %    margin of the page of a  Word document.
     %
     %    p = mlreportgen.dom.Paragraph('some text');
     %    p.OuterLeftMargin = '0.5in';
     %
     OuterLeftMargin;

     %OutlineLevel Outline level of this paragraph
     %    Setting this property causes this paragraph to be included in 
     %    outlines, for example, a table of contents, generated 
     %    automatically from a document.
     OutlineLevel;

     %Strike Type of strikethrough, if any, to draw through this paragraph.
     %    Valid types are:
     %
     %                                                  Applies To
     %    Valid Value      Description                  DOCX    HTML
     %    'double'         Double line                    X       
     %    'none'           Do not draw a strikethrough    X       X	 
     %    'single'         Single line                    X       X
     %
     %    Note: Setting this property adds a corresponding Strike format 
     %    object to this paragraph's Style property. Unsetting this property
     %    removes the object.
     Strike;

     %Underline Type of line, if any, to draw under this paragraph
     %    Type of line, if any, to draw under this paragraph. For HTML output, 
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
     %    If this property is empty and the paragraph’s StyleName property 
     %    specifies a style sheet style, the line drawn under this paragraph, 
     %    if any, is determined by the specified style. 
     %
     %    If you want to specify the color as well as the type of the
     %    underline, do not set this property, Instead, set this paragraph’s
     %    Style property to include an Underline format object that 
     %    specifies the desired type and color.
     %
     %    Note: Setting this property adds a corresponding Underline 
     %    format object to this paragraph’s Style property. Unsetting this 
     %    property removes the object.
     Underline;

     %Preserves white space and line breaks in paragraph.
     %
     %                                                    Applies To
     %    Valid Value   Description	                       DOCX HTML
	 %	
     %    'normal'      Do not preserve white space and      X    X
     %                  line breaks in paragraph	 	 
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
     %                  wraps the paragraph content of a Paragraph
     %                  object in HTML pre tags. If the paragraph
     %                  contains line feeds, the option wraps
     %                  each line of paragraph in a pre element
     %                  followed by a <br/> element. This is
     %                  done to ensure that the HTML output
     %                  is also valid XML and hence can be
     %                  parsed by an XML parser for
     %                  verification purposes.	 	 
     %
     %     Note: Setting this property adds a corresponding WhiteSpace 
     %     format object to this paragraph’s Style property. Unsetting this 
     %     property removes the object.
     WhiteSpace;
end
%}