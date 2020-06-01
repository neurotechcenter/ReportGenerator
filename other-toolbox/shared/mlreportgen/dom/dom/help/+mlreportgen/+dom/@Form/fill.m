% fill Fill the holes in a DOM-based form
%    fill(form) fills the holes in a DOM-based form with generated content. This
%    method works only with user-defined classes derived from any of the following
%    DOM classes
%
%        * mlreportgen.dom.Document
%        * mlreportgen.dom.DocumentPart
%        * mlreportgen.dom.DOCXPageHeader
%        * mlreportgen.dom.DOCXPageFooter
%        * mlreportgen.dom.PDFPageHeader
%        * mlreportgen.dom.PDFPageFooter
%        * mlreportgen.dom.Template
%
%    Note: this method does not work for the DOM classes
%    themselves. Invoking the method on an instance of a DOM class
%    causes an error.
%
%    This method assumes that the derived class defines for each hole 
%    in an instance's template a method having the following signature
%
%    fillHoleId(d)
%
%    where HoleId is the id of a hole defined by the document's
%    template and d is an instance of the derived class. Based on this
%    assumption, the fill method moves from the first hole in the document
%    to the last, invoking the corresponding fillHoleId method at each
%    hole. This method eliminates the need for a client to loop through the
%    holes in a document's template. The client need only define methods
%    that fill in the holes. The fill method handles the task of moving
%    from hole to hole to fill in the template.
