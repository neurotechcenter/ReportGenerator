%mlreportgen.dom.ImageMap Map of hyperlinkable areas in an image
%    map = ImageMap() creates an empty image map. Use the map's
%    append method to add image areas to the map.
%
%    ImageMap methods:
%        append         - Append an image area to this map
%        clone          - Clone this map
%
%    ImageMap properties:
%        Id    - Id of this map
%        Tag   - Tag of this map
%
%    Note: to draw a border around all the areas in an image map, set the
%    map's Style property to an mlreportgen.dom.Border object that 
%    specifies the border's width, style, and color. You can also
%    draw borders around selected areas by setting the Style property of
%    the areas.
%
%    Example:
%
%    import mlreportgen.dom.*;
%    d = Document('test');
%    img = Image(which('ngc6543a.jpg'));
%    area = ImageArea('https://www.google.com', 'Google', 0, 0, 100, 100);
%    map = ImageMap;
%    map.Style = {Border('solid', 'red', '2px')};
%    append(map, area);
%    img.Map = map;
%    append(d, img);
%    close(d);
%    rptview(d.OutputPath);
%
%    See also mlreportgen.dom.Image, mlreportgen.dom.ImageMap,
%    mlreportgen.dom.ImageArea, mlreportgen.dom.Border

%    Copyright 2014-2018 Mathworks, Inc.
%    Built-in class
