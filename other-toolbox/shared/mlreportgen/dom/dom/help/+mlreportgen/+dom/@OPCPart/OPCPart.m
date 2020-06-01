%mlreportgen.dom.OPCPart Part to be included in an OPC package
%    partObj = OPCPart() creates an empty OPC part.
%
%    partObj = OPCPart('name', 'sourcePath') creates a part having the
%    specified name whose source file is located at the specified path.
%    Appending the part to a document via its package method causes 
%    a copy of the source file to be inserted in the document package 
%    at the location specified by the part's name.
%
%    See http://en.wikipedia.org/wiki/Open_Packaging_Conventions
%    for more information.
%
%    Example:
%
%    import mlreportgen.dom.*
% 
%    % Assume that data.json is a json file located in the current 
%    % directory. The following inserts a copy of data.json in the
%    % data subdirectory of the mydoc package.
%    d = Document('mydoc', 'html');
%    package(d, OPCPart('/data/data.json', 'data.json'));
%    close(d);
%
%    OPCPart properties:
%        ContentType      - Content type of this part
%        Id               - Id of this part
%        Name             - Name of this part
%        RelatedPart      - Part to which this part is related
%        RelationshipId   - Relationship id of this part
%        RelationshipType - Relationship 
%        SourceFilePath   - Path of the source file for this part
%        Tag              - Tag of this part
%
%    See also mlreportgen.dom.Document.package

%    Copyright 2014 Mathworks, Inc.
%    Built-in class

%{
properties
     %ContentType Content type of this part
     %       
     %       Specifies the content type of this part. See
     %       http://en.wikipedia.org/wiki/Open_Packaging_Conventions
     %
     %       If this property is not set and the part is one of 
     %       the types listed below, the DOM API sets the content type
     %       when you append the part to a document.
     %
     %       File Type                     File Extension
     %
     %       * Windows bitmap              (.bmp)
     %       * Cascading Style Sheet       (.css)
     %       * Plain text                  (.txt)
     %       * Icon                        (.cur)
     %       * Windows metafile            (.emf)
     %       * Encapsulated PostScript     (.eps)
     %       * GIF Image                   (.gif)
     %       * HTML                        (.html)
     %       * JPEG Image                  (.jpe)
     %       * JPEG Image                  (.jpeg)
     %       * JPEG                        (.jpg)
     %       * JavaScript                  (.js)
     %       * JavaScript Object Notation  (.json)
     %       * PNG Image                   (.png)
     %       * PSD                         (.psd)
     %       * Rich Text Format            (.rtf)
     %       * Scalable Vector Graphics    (.svg)
     %       * TIFF Image                  (.tif)
     %       * TIFF Image                  (.tiff)
     %       * TrueType Font               (.ttf)
     ContentType;

     %Name Path name of this part
     %       
     %     Path of this part relative to the root of the package.
     %     For example, to add an image named myimage.jpg to a 
     %     document's images directory, specify the path as
     %     '/images/myimage.jpg'.
     %
     %     See http://en.wikipedia.org/wiki/Open_Packaging_Conventions
     %     for information on OPC part names.
     Name;

     %RelatedPart Path name of part to which this part is related
     %     See http://en.wikipedia.org/wiki/Open_Packaging_Conventions
     %     for information on OPC part names.
     RelatedPart;

     %RelationshipId Relationship ID of this part
     %     See http://en.wikipedia.org/wiki/Open_Packaging_Conventions
     %     for information on OPC relationship IDs.
     RelationshipId;

     %RelationshipType Relationship type of this part
     %
     %       See http://en.wikipedia.org/wiki/Open_Packaging_Conventions
     %       for information on OPC relationship types.
     %
     %       When you append this part to a document, if this property is 
     %       not set and the document is an HTML document and the part 
     %       is one of  the types listed below, the DOM API sets the 
     %       content type for you. In other words, if you plan to append
     %       this part to an HTML document and the part is one of the types
     %       below, you do not need to set this property.
     %
     %       File Type                     File Extension
     %
     %       * Windows bitmap              (.bmp)
     %       * Cascading Style Sheet       (.css)
     %       * Plain text                  (.txt)
     %       * Icon                        (.cur)
     %       * Windows metafile            (.emf)
     %       * Encapsulated PostScript     (.eps)
     %       * GIF Image                   (.gif)
     %       * HTML                        (.html)
     %       * JPEG Image                  (.jpe)
     %       * JPEG Image                  (.jpeg)
     %       * JPEG                        (.jpg)
     %       * JavaScript                  (.js)
     %       * JavaScript Object Notation  (.json)
     %       * PNG Image                   (.png)
     %       * PSD                         (.psd)
     %       * Rich Text Format            (.rtf)
     %       * Scalable Vector Graphics    (.svg)
     %       * TIFF Image                  (.tif)
     %       * TIFF Image                  (.tiff)
     %       * TrueType Font               (.ttf)
     RelationshipType;

     %SourceFilePath Path of the source file for this part
     SourceFilePath;

end
%}