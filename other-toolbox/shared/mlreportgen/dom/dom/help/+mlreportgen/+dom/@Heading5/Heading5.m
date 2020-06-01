%mlreportgen.dom.Heading5 Create a heading paragraph.
%     headingObj = Heading5() creates an empty level 5 heading.
%
%     headingObj = Heading5('text') creates a level 5 heading
%     containing text string.
%
%     headingObj = Heading5('text', 'styleName') creates a level 5 heading
%     containing text string and the StyleName property styleName. The 
%     style name must specify a paragraph style  defined in the template 
%     used to create the document to which this heading is appended.
%
%     headingObj = Heading5(domObj) creates a level 5 heading
%     containing the specified DOM object. The object can be any of
%     the following types:
%
%        * ExternalLink
%        * Image
%        * InternalLink
%        * LinkTarget
%        * Text
%
%    Heading methods:
%        append         - Append content to this heading
%        clone          - Clone this heading
%
%    Heading properties:
%        BackgroundColor   - Background color of this heading
%        Bold              - Whether heading text is bold
%        Color             - Color of heading text
%        CustomAttributes  - Custom element attributes
%        FirstLineIndent   - Amount to indent heading's first line
%        FontFamilyName    - Name of font family used to render heading
%        FontSize          - Size of font used to render heading
%        HAlign            - Horizontal alignment of this heading.  
%        Id                - Id of this heading
%        Italic            - Whether this heading is italic
%        OuterLeftMargin   - Outer left margin (left indent) of heading
%        OutlineLevel      - Outline levelof this heading
%        Style             - Formats that define this heading's style
%        Strike            - Type of strikethrough through heading
%        StyleName         - Name of heading's stylesheet-defined style
%        Tag               - Tag of this heading
%        Underline         - Type of line, if any, to draw under heading
%        WhiteSpace        - Preserves white space and line breaks

%    Copyright 2015-2017 Mathworks, Inc.
%    Built-in class

%{
properties
     %BackgroundColor Background color of this heading
     %    You may specify the background color either as a color
     %    name (e.g., 'red') or a hexadecimal RGB value of the form
     %    '#rrggbb', e.g., 'FF0000'. If this property is empty and the 
     %    heading’s StyleName property specifies a style sheet style, the 
     %    color of this heading is determined by the specified style. 
     %
     %    Note: Setting this property adds a corresponding BackgroundColor 
     %    format object to this heading’s Style property. Unsetting this 
     %    property removes the object.
     %
     BackgroundColor;

     %Bold Whether this heading is bold
     %    If true, this property cause this heading to be rendered bold.
     %    If this property is false, the heading is rendered normal weight. 
     %    If this property is empty and the heading’s StyleName property
     %    specifies a stylesheet style, the weight of this heading is 
     %    determined by the specified style.
     %
     %    Note: Setting this property adds a corresponding Bold 
     %    format object to this heading’s Style property. Unsetting this 
     %    property removes the object.
     %
     Bold;

     %Color Color of this heading
     %    Color of this heading. You may specify the color either as a color
     %    name (e.g., 'red') or a hexadecimal RGB value of the form
     %    '#rrggbb', e.g., 'FF0000'. If this property is empty and the 
     %    heading’s StyleName property specifies a style sheet style, the 
     %    color of this heading is determined by the specified style.
     %
     %    Note: Setting this property adds a corresponding Color 
     %    format object to this heading’s Style property. Unsetting this 
     %    property removes the object.
     %
     Color;

     %FirstLineIndent Amount to indent heading's first line.
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
     %   format object to this heading's Style property. Unsetting this
     %   property removes the object.
     FirstLineIndent;

     %FontFamilyName Name of font family to be used to render this heading.
     %    If you need to specify substitutions for this font, do not set 
     %    this property. Instead create and add a FontFamily object to 
     %    this heading's Style property.
     %
     %    Note: Setting this property adds a corresponding FontFamily 
     %    format object to this heading's Style property. Unsetting this 
     %    property removes the object.
     FontFamilyName;

     %FontSize Size of font to be used to render this heading.
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
     %    object to this heading's Style property. Unsetting this property
     %    removes the object.
     FontSize;

     %HAlign Horizontal alignment of this heading.  
     %     Valid values are:
     %                                                           Applies To
     %     Valid Value       Description 	                      DOCX HTML/PDF 	
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

     %Italic Whether this heading is italic
     %    If true, this property cause this heading to be rendered italic.
     %    If this property is false, the heading is rendered upright. 
     %    If this property is empty and the heading’s StyleName property
     %    specifies a stylesheet style, the slant of this heading is 
     %    determined by the specified style.
     %
     %    Note: Setting this property adds a corresponding Italic 
     %    format object to this heading’s Style property. Unsetting this 
     %    property removes the object.
     %
     Italic;

     %OuterLeftMargin Outer left margin (left indent) of heading
     %    This property specifies the space between the left outer 
     %    boundary of this heading and the left inner boundary of its 
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
     %    object to this heading's Style property. Unsetting this 
     %    property removes the object. If you want to indent a heading
     %    from both the left and right margin of a page, do not set this
     %    property. Instead, add an OuterMargin object specifying the left
     %    and right indents to the heading's Style property.
     %
     %    Example
     %
     %    The following lines indent a heading a half-inch from the left 
     %    margin of the page of a  Word document.
     %
     %    p = mlreportgen.dom.Paragraph('some text');
     %    p.OuterLeftMargin = '0.5in';
     %
     OuterLeftMargin;

     %OutlineLevel Outline level of this heading
     %    Setting this property causes this heading to be included in 
     %    outlines, for example, a table of contents, generated 
     %    automatically from a document.
     OutlineLevel;

     %Strike Type of strikethrough, if any, to draw through this heading.
     %    Valid types are:
     %
     %                                                  Applies To
     %    Valid Value      Description                  DOCX    HTML
     %    'double'         Double line                    X       
     %    'none'           Do not draw a strikethrough    X       X	 
     %    'single'         Single line                    X       X
     %
     %    Note: Setting this property adds a corresponding Strike format 
     %    object to this heading's Style property. Unsetting this property
     %    removes the object.
     Strike;

     %Underline Type of line, if any, to draw under this heading
     %    Type of line, if any, to draw under this heading. For HTML and PDF output, 
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
     %    If this property is empty and the heading’s StyleName property 
     %    specifies a style sheet style, the line drawn under this heading, 
     %    if any, is determined by the specified style. 
     %
     %    If you want to specify the color as well as the type of the
     %    underline, do not set this property, Instead, set this heading’s
     %    Style property to include an Underline format object that 
     %    specifies the desired type and color.
     %
     %    Note: Setting this property adds a corresponding Underline 
     %    format object to this heading’s Style property. Unsetting this 
     %    property removes the object.
     Underline;

     %Preserves white space and line breaks in heading.
     %
     %                                                    Applies To
     %    Valid Value   Description	                    DOCX/PDF HTML
	 %	
     %    'normal'      Do not preserve white space and      X    X
     %                  line breaks in heading	 	 
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
     %                  when necessary and on line breaks         X		 
     %    'preserve'    Same as pre.                          X	 	 
     %
     %     Note: Setting this property adds a corresponding WhiteSpace 
     %     format object to this heading’s Style property. Unsetting this 
     %     property removes the object.
     WhiteSpace;
end
%}