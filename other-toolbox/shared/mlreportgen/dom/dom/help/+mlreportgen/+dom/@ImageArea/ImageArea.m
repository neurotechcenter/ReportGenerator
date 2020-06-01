%mlreportgen.dom.ImageArea Defines an image area as a hyperlink
%    area = ImageArea() creates  an empty image area.
%
%    area = ImageArea(target, alternate, x1, y1, x2, y2) creates a
%    rectangular area whose coordinates are those specified relative to the
%    top, left corner of the image. When clicked, the area causes a
%    browser to display the page designated by target, which is the URL
%    of the page. If the image is not visible, the browser displays the
%    text specified by the alt argument.
%
%    area = ImageArea(target, alternate, x, y, radius) creates a
%    circular area whose center coordinate x,y are specified relative to 
%    the top, left corner of the image with a radius specified by radius. 
%    When clicked, the area causes a browser to display the page designated
%    by target, which is the URL of the page. If the image is not visible, 
%    the browser displays the text specified by the alt argument.
%
%    area = ImageArea(target, alternate, [x1, y1, x2, y2, ..., xN, yN]) 
%    creates a polygonal area whose coordinates are those specified 
%    relative to the top, left corner of the image. When clicked, the area 
%    causes a browser to display the page designated by target, which is 
%    the URL of the page. If the image is not visible, the browser displays
%    the text specified by the alt argument.
%
%    ImageArea properties:
%        Target        - URL of the image area hyperlink target
%        AlternateText - Text to be displayed if the image area is invisible
%        Shape         - Shape of area
%        Coords        - Coordinates of area
%        Id            - Id of this area
%        Tag           - Tag of this area
%
%    See also mlreportgen.dom.Image, mlreportgen.dom.ImageMap

%    Copyright 2014 Mathworks, Inc.
%    Built-in class

%{
properties
     %Target URL of the image area hyperlink target
     %      String that specified the URL of the page to be loaded when
     %      this area is clicked
     Target;

     %Text Text to be displayed if the image area is invisible
     %      String that specified text to be displayed if this area of
     %      the image is invisible or the user is using a screen reader
     Text;
     
     %Shape Shape of the area
     %      String that specified the shape. It could be 'rect'
     %      'circle' or 'poly'
     Shape;
     
     %Coords Coordinates of the area
     %       For rectangular and polygonal shapes, an array of coordinate
     %       pairs specified relative to the top, left corner of the image.
     %       For circular shape, a coordinate pair specifying the center of
     %       the circle follow by the radius of the circle.
     Coords;
end
%}