%moveToNextHole Moves document append point to the next hole.
%
%   holeId = moveToNextHole(docObj) copies any text between the current 
%   hole and the next hole in the document's template to the output 
%   document as a RawText object. This method then makes the next hole the
%   current hole and returns that hole's id. 
%   This method allows you to generate documents by filling in holes in a 
%   form's template, i.e., by moving successively through the holes 
%   designated by the template. The first time you execute this method, 
%   you effectively copy all the text up to the first hole in the template
%   to the output document. At this point, you can start adding content to
%   the output document, using this form's append method, i.e., you can 
%   start  "filling in" the first hole. The next time you execute  this 
%   method, you effectively copy all the text between the first and 
%   second hole in the template to the output document. You can then 
%   "fill in" the second hole by appending content to the output document.
%   In this way, you generate the  output document by copying the content 
%   from the template and filling in all its holes.
%
%   Example
%  
%   The following function generates a report from a Word template that 
%   has three holes named Title, Author, and Content, respectively. The 
%   arguments title, author, and content are assumed to be strings.
%
%   function makerpt(title, author, content, rptname, rpttemplate)
%     import mlreportgen.dom.*
%     rpt = Document(rptname, 'docx', rpttemplate);
% 
%     while ~strcmp(rpt.CurrentHoleId, '#end#')
%         switch rpt.CurrentHoleId
%              case 'Title'
%                  append(rpt, title);
%              case 'Author'               
%                  append(rpt, author);
%              case 'Content'               
%                  append(rpt, content);
%              end
%          end
%          moveToNextHole(rpt);
%      end
%      
%     close(rpt);

%    Copyright 2013 MathWorks, Inc.
%    Built-in function.
