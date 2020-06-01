%mlreportgen.dom.CoreProperties OPC core properties of a document or template
%    props =  CoreProperties() creates an empty core properties object.
%    Core properties are metadata stored in a document's OPC package that
%    describe various properties of the document. The Windows Explorer
%    displays some of the core properties when you select a document.
%
%    CoreProperties properties:
%        Category        - Category of a document
%        ContentStatus   - Content status of a document
%        Created         - Date/time of creation of a document
%        Creator         - Creator of a document
%        Description     - Description of a document
%        Id              - Id of this core property object
%        Identifier      - Identifier of a document
%        Keywords        - Keywords associated with this document
%        Language        - Language of this document
%        LastModifiedBy  - Agent that last modified this document
%        LastPrinted     - Date/time of last printing of a document
%        Modified        - Date/time of last modification of a document
%        Revision        - Revision represented by this document
%        Subject         - Subject of this document
%        Tag             - Tag of this core property object
%        Title           - Title of this document
%        Version         - Version of this document
%
%    See also mlreportgen.dom.Document.setCoreProperties

%    Copyright 2014-2016 Mathworks, Inc.
%    Built-in class

%{
properties
     %Category Category of this document
     Category;

     % ContentStatus Content status of this document
     ContentStatus;

     %Created Date/time of creation of this document
     %  The format of this property is 'yyyy-mmm-dd hh:mm:ss'
     Created;

     %Creator Creator of this document
     Creator;

     %Description Description of this document
     Description;

     %Identifier Identifier of this document
     Identifier;

     %Keywords Keywords associated with this document
     Keywords;

     %Language Language of this document
     Language;

     %LastModifiedBy Agent that last modified this document
     LastModifiedBy;

     %LastPrinted Date/time of last printing of this document
     %  The format of this property is 'yyyy-mmm-dd hh:mm:ss'
     LastPrinted;

     %Modified Date/time of last modification of this document
     %  The format of this property is 'yyyy-mmm-dd hh:mm:ss'
     Modified;

     %Revision Revision represented by this document
     Revision;

     %Subject Subject of this document
     Subject;

     %Title Title of this document
     Title;

     %Version Version of this document
     Version;
 
end
%}