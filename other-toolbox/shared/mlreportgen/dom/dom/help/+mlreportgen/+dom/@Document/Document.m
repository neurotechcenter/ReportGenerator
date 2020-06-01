%mlreportgen.dom.Document Create a DOM document
%    doc = Document(docpath, type, templatepath) creates a document at 
%    docpath having the specified type and using the Word, PDF, or HTML template
%    (depending on the type) at the specified location.
%
%    Valid document types:
%
%      'docx'      - Microsoft Word document
%      'html'      - HTML document
%      'html-file' - single-file HTML document
%      'pdf'       - PDF document
%
%    By default, the DOM API packages HTML documents and their associated 
%    files (images, stylesheets, Javascripts) in a zipped file that 
%    conforms to the Open Packaging Convention (OPC). The zipped file has
%    the extension 'htmx'.
%
%    doc = Document() creates an HTML document named 'Untitled.htmx' in 
%    the current directory, using the DOM API's default HTML template.
%
%    doc = Document(docpath) creates an HTML document at the specified 
%    location, using the DOM API's default HTML template.
%
%    doc = Document(docpath, type) creates a document of the specified 
%    type at the specified location
%
%    Document methods:
%        append                 - Append a MATLAB or DOM object to this document
%        addHTML                - Appends an HTML markup string to this document
%        addHTMLFile            - Appends the contents of an HTML file to this document
%        close                  - Close this document
%        createAutoNumberStream - Create an auto number stream for this document
%        createTemplate         - Create a template
%        fill                   - Fill holes in this document's template
%        getAutoNumberStream    - Get one of this document's auto number streams
%        getCoreProperties      - Get the OPC core properties of this document
%        getImageDirectory      - Get a document's image directory
%        getImagePrefix         - Get a document's generated image name prefix
%        getMainPartPath        - Get the full path of this document's main part
%        getOPCMainPart         - Get the main part (file) of a document package
%        moveToNextHole         - Move to next hole in this document
%        open                   - Open this document    
%        package                - Add a file to the document's OPC package
%        setCoreProperties      - Set the OPC core properties of this document
%
%    Document properties:
%        Children           - Content of this document
%        CurrentHoleId      - Id of current hole
%        CurrentHoleType    - Type of current hole (inline or block)
%        CurrentPageLayout  - Current page layout
%        ForceOverwrite     - Whether to overwrite existing file
%        HTMLHeadExt        - HTML head element content
%        Id                 - Id of this document
%        OutputPath         - Path of document's output directory
%        PackageType        - How to package document output
%        StreamOutput       - Whether to stream this document's output
%        Tag                - Tag of this document
%        TemplatePath       - Path of this document's template
%        TitleBarText       - Text to put in title bar of HTML output
%        Type               - Type of document (e.g., docx, html, html-file, pdf)'

%    Copyright 2013-2015 Mathworks, Inc.

%{
properties

     %ForceOverwrite Whether to overwrite an existing output file
     %     If true, this property causes an existing file of the same
     %     name to be overwritten by this document's output file. If this
     %     property is false or the existing file is read-only, an error
     %     occurs.
     ForceOverwrite;

     %HTMLHeadExt HTML head element content
     %    HTML markup to be appended to an HTML document's head element.
     %
     %    Note: this property must be set before a document is opened.
     %
     %    Example:
     %
     %    % Include myscript.js in output document.
     %    d = Document('mydoc', 'html');
     %    d.HTMLHeadExt = '<script src="./scripts/myscript.js"></script>';
     %    package(d, OPCPart('/scripts', 'myscript.js'));   
     %
     HTMLHeadExt;

     %OutputPath Path of document's output file
     %     Path of this document's output file. If you do not specify
     %     the file's extension, an extension based on the document's
     %     output type is added. You cannot set this property once the
     %     document has been opened.
     OutputPath;

     % PackageType Specifies how to package a document's output files
     %
     %      Valid Value     Description
     %      'zipped'        The document output consists of an OPC zip file
     %                      located at the value of the document's 
     %                      OutputPath property with the extension docx
     %                      (for Word output) or htmx (for multi-file HTML output). 
     %                      For example, if the document type is 'docx' 
     %                      and  Output Path is 's:\docs\MyDoc', 
     %                      the output is packaged in a zip file named
     %                      's:\docs\MyDoc,docx'.
     %
     %      'unzipped'      The document output is stored in a directory
     %                      having the root file name of the document's 
     %                      OutputPath property. For example, if the 
     %                      Output Path is 's:\docs\MyDoc', 
     %                      the output directory is 's:\docs\MyDoc'.
     %             
     %      'both'          Produces both zipped and unzipped output.
     %
     %      'single-file'   Produces output as a single file. This
     %                      package type is valid for PDF and HTML-FIle
     %                      output only.
     PackageType

     %StreamOutput Whether to output document content as it is added
     %     If true, this property causes objects appended to the document
     %     to be output as they are appended. Otherwise, document content
     %     is output when the document is closed. This property cannot be
     %     change after a document is opened.
     StreamOutput;

     %TitleBarText Title of HTML document page
     %     For HTML documents, this property specifies the text to be 
     %     displayed in the title bar of the browser displaying the 
     %     document. This property is ignored for Word documents.
     %
     %     Note: This property must be set before the document is opened
     %     for output. Setting this property afterwards has no effect.
     TitleBarText;

end
%}