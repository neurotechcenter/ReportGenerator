%mlreportgen.dom.RawText XML markup to be inserted in a document
%    text = RawText() creates an empty RawText object.
%
%    text = RawText('html markup') creates a RawText object containing
%    HTML markup.
%
%    text = RawText('markup', 'doctype') creates a RawText object 
%    containing XML markup of the specified document type: 'html', 'docx',
%    'pdf'.
%
%    Note: the DOM API inserts the value of this object's DOCXText, 
%    HTMLText, and PDFText properties in Word, HTML, and PDF documents,
%    respectively. You can create a RawText object that works for all
%    output types by setting these properties accordingly. The raw text
%    values of these properties must be markup that is valid for the 
%    document type, i.e., Word XML for Word documents, HTML for HTML 
%    documents, and Formatting Objects (FO) for PDF documents. The content
%    must also be valid for the document context into which the RawText
%    object is inserted. The DOM API appends the markup to the document
%    without checking its validity. Thus, it is possible to create 
%    invalid documents using this object.
%
%    RawText properties:
%        DOCXText - Word XML markup to output to a DOCX document
%        HTMLText - HTML markup to output to an HTML document
%        PDFText  - Formatting Objects markup to output to a PDF document
%        Id       - Id of this raw text object
%        Parent   - Parent of this raw text object
%        Tag      - Tag of this raw text object
%
%    Example:
%
%    This example uses a RawText object to create a Word report containing
%    a list of figures and a list of tables.
%
%    function gentof
%        import mlreportgen.report.*
%        import mlreportgen.dom.*
%        r = Report('myreport', 'docx');
%        add(r, TitlePage('Title', 'My Report'));
%        add(r, TableOfContents);
%        ch = Chapter('Figures and Tables');
%        sec = Section('List of Figures');
%        add(sec, mkto_t_f('figure'));
%        add(ch, sec);
%        sec = Section('List of Tables');
%        add(sec, mkto_t_f('table'));
%        add(ch, sec);
%        add(r, ch);
%        ch = Chapter('Peppers');
%        for i = 1:5
%            img = FormalImage(which('peppers.png'));
%            img.Caption = 'Peppers';
%            add(ch, img);
%            table = BaseTable(magic(5));
%            table.Title = 'Magic Square';
%            add(ch, table);
%        end
%        add(r, ch);
%        close(r);
%        rptview(r);
%    end
%    
%    function obj = mkto_t_f(t_f)
%        import mlreportgen.dom.*
%        tof = [
%            '<w:p>' ...
%              '<w:fldSimple w:instr=" TOC \\h \\z \\c &quot;%s&quot; ">' ...
%               '<w:r>' ...
%                 '<w:rPr>' ...
%                   '<w:b/>' ...
%                   '<w:bCs/>' ...
%                   '<w:noProof/>' ...
%                 '</w:rPr>' ...
%                 '<w:t>No table of figures entries found.</w:t>' ...
%               '</w:r>' ...
%             '</w:fldSimple>' ...
%           '</w:p>' ...
%           ];
%       
%       obj =  RawText(sprintf(tof, t_f), 'docx');
%    end

%    Copyright 2014-2017 Mathworks, Inc.
%    Built-in class

%{
properties
     %DOCXText Word XML markup to output to a DOCX document
     %      The value of this property is included in a document if its
     %      type is 'docx'. The text must be valid Word XML markup
     %      that can be inserted into the w:body, w:p, or w:tc element of a
     %      Word document
     DOCXText;

     %HTMLText HTML markup to output to an HTML document
     %      The value of this property is included in a document if its
     %      type is 'html'. The value of this property must be valid 
     %      HTML markup that can be inserted into a body, p, or td
     %      element of an HTML document.
     HTMLText;

     %PDFText Formatting Objects markup to output to an PDF document
     %      The value of this property is included in a document if its
     %      type is 'pdf'. The value of this property must be valid 
     %      Formatting Objects (FO) markup that can be inserted into a
     %      fo:flow, fo:block, or fo:table-cell element of the FO
     %      representation of PDF document content.
     HTMLText;

end
%}