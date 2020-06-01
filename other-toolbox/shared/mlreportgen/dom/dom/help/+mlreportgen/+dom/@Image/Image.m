%mlreportgen.dom.Image Create an image to be included in a report.
%     imgObj = Image('imagePath') creates an image object containing the 
%     image file specified by the 'imagePath' argument.
%
%     Note. The contents of the image file specified by imagePath is 
%     copied into the output document either when the Image object is 
%     appended to the document (in document streaming mode) or when the 
%     document is closed. You should not delete the original file 
%     before it has been copied into the document.
%
%    Image methods:
%        append - Append a custom element to this image
%        clone  - Clone this image
%
%    Image properties:
%        CustomAttributes  - Custom element attributes
%        Height            - Height of this image
%        Id                - Id of this image
%        Map               - Map of hyperlink areas in image (HTML and PDF only)
%        Path              - Path of the image file
%        Style             - Formats that define this image's style
%        StyleName         - Name of images's stylesheet-defined style
%        Tag               - Tag of this image
%        Width             - Width of this image
%
%    See also mlreportgen.dom.ImageMap

%    Copyright 2013-2017 Mathworks, Inc.
%    Built-in class

%{
properties
     %Height Height of this image
     %    The value of this property is a string having the 
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
     Height;

     %Map Map of hyperlink areas in image (HTML and PDF only)
     %
     %    See also mlreportgen.dom.ImageMap
     Map;

     %Path Path of the file containing this image's data
     Path;
      
     %Width Width of this image
     %    The value of this property is a string having the 
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
     Width;
end
%}

