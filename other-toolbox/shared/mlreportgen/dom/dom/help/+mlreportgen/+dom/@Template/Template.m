%mlreportgen.dom.Template Create a template for a document
%    template = Template(outtemplpath, type, intemplpath) creates a 
%    a template at outtemplpath having the specified type and using the 
%    Word or HTML template (depending on the type) at the location 
%    specified by intemplpath.
%
%    Valid template types:
%
%      'docx' - Microsoft Word document
%      'html' - HTML document
%      'html-file' - single-file HTML document
%
%    templ = Template() creates an HTML template named 'Untitled.htmtx' in 
%    the current directory, using the DOM API's default HTML template.
%
%    templ = Template(templpath) creates an HTML template at the specified 
%    location, using the DOM API's default HTML template.
%
%    templ = Template(templpath, type) creates a template of the specified 
%    type at the specified location
%
%    Template methods:
%        append            - Append a MATLAB or DOM object to this document
%        addHTML           - Appends an HTML markup string to this document
%        addHTMLFile       - Appends the contents of an HTML file to this document
%        close             - Close this document
%        createTemplate    - Create a template
%        fill              - Fill holes in this document's template
%        getCoreProperties - Get the OPC core properties of this document
%        getImageDirectory - Get a document's image directory
%        getImagePrefix    - Get a document's generated image name prefix
%        getMainPartPath   - Get the full path of this document's main part
%        getOPCMainPart    - Get the main part (file) of a document package
%        moveToNextHole    - Move to next hole in this document
%        open              - Open this document    
%        package           - Add a file to the document's OPC package
%        setCoreProperties - Set the OPC core properties of this document
%
%    Template properties:
%        Children           - Content of this document
%        CurrentHoleId      - Id of current hole
%        CurrentHoleType    - Type of current hole (inline or block)
%        CurrentDOCXSection - Current DOCX section 
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
%
%     import mlreportgen.dom.*;
%     t = Template('mytemplate');
%
%     % Company Logo
%     p = Paragraph('My Company');
%     p.FontSize = '24';
%     p.Color = 'DeepSkyBlue';
%     p.Bold = true;
%     p.HAlign = 'center';
%     append(t, p);
%
%     % Report Title
%     p = Paragraph;
%     p.FontFamilyName = 'Arial';
%     p.FontSize = '18pt';
%     p.Bold = true;
%     p.HAlign = 'center';
%     append(p, TemplateHole('ReportTitle', 'Report Title'));
%     append(t, p);
%     close(t);
%     rptview('mytemplate.htmtx');
%
%     See also mlreportgen.dom.TemplateHole, rptview

%    Copyright 2014 Mathworks, Inc.
%    Built-in class