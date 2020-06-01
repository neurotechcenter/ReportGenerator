%mlreportgen.dom.DOCXSubDoc Reference to an external Word document
%    obj = DOCXSubDoc creates an empty document reference.
%
%    obj = DOCXSubDoc('path') creates a reference to a Word document
%    at the specified path. Appending this reference to a Word document
%    (the master document) inserts a link to the subdocument at the point 
%    at which the reference is appended.
%
%    Note: opening a master document in Word causes the link to the 
%    subdocument to be displayed rather than its content. To replace
%    the link with the content requires selecting the Expand Subdocuments
%    option on the Outlining tab of the View tab on Word's tool strip.
%    The rptview command expands subdocuments automatically when it opens 
%    a Word document.
%
%
%    DOCXSubDoc methods:
%        clone          - Clone this document reference
%
%    DOCXSubDoc properties:
%        Id     - Id of this element
%        Tag    - Tag of this element
%        Target - Path of document targeted by this reference
%
%    Example:
%
%    import mlreportgen.dom.*
%    
%    info = Document('CompanyInfo', 'docx');
%    append(info, 'XYZ, Inc., makes widgets.');
%    close(info);
%    
%    infoPath = info.OutputPath;
%    
%    rpt = Document('Report', 'docx');
%    open(rpt);
%    
%    para = append(rpt, Paragraph('About XYZ, Inc.'));
%    
%    append(rpt, DOCXSubDoc(infoPath));
%    
%    close(rpt);
%    rptview(rpt.OutputPath);

%    Copyright 2014 Mathworks, Inc.
%    Built-in class

%{
properties

     %Target Path of document targeted by this reference
     %
     Target;
end
%}