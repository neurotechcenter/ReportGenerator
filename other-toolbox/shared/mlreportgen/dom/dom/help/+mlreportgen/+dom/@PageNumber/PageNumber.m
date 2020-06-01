%mlreportgen.dom.PageNumber initial value and format of page numbers in a page layout
%    pnumber = PageNumber() specifies a numeric page number that continues
%    from previous page layout.
%
%    pnumber = PageNumber(1) specifies a numeric page number that starts
%    at 1 in this page layout.
%
%    pnumber = PageNumber(10,'I') specifies an upper roman page number that 
%    starts at 'X' in this page layout.
%
%
%    PageNumber properties:
%        ChapterSeparator  - Separator between chapter number and page number
%        ChapterStartStyle - Indicate level of Heading style used by chapters
%        Format            - Page number format
%        InitialValue      - Page number initial value
%        Id                - Id of this page number object
%        Tag               - Tag of this page number object
%
%    See also mlreportgen.dom.DOCXPageLayout, mlreportgen.dom.PDFPageLayout

%    Copyright 2015-2016 Mathworks, Inc.
%    Built-in class

%{
properties
     %ChapterSeparator separator between chapter number and page number
     %      This property specifies the type of character separator between the
     %      chapter number and page number. For example, X-33
     %      This only applies to DOCXPageLayout
     %
     %           VALUE      DESCRIPTION
     %         'colon'      colon character
     %           ':'        colon character
     %         'emdash'     em dash character
     %         'endash'     en dash character
     %         'hyphen'     hyphen character
     %           '-'        hyphen character
     %         'period'     period character
     %           '.'        period character
     %
     ChapterSeparator;

     %ChapterStartStyle Indicate level of Heading style used by chapters
     %      This property specifies which heading style is used to  calculate
     %      the chapter number
     %      This only applies to DOCXPageLayout
     %  
     %       Example:
     %
     %       % Steps to create a template with heading chapters
     &       %
     %       % 1.- Create the template HeadingChapters with
     %       %     >> Document.createTemplate('HeadingChapters','docx')
     %       % 2.- Open the template in Microsoft Word and apply chapter number to the
     %       %     headings automatically:
     %       %     2.1.- In the Multilevel List Library select the style "I. Heading 1"
     %       %        The first empty paragraph will be numbered like I.
     %       %        See, https://support.office.com/en-gb/article/Number-your-headings-ce24e028-4cb4-4d4a-bf25-fb2c61fc6585
     %       %     2.2.- Apply normal style to the empty numbered paragraph
     %       %     2.3.- Save and close the template
     % 
     %       import mlreportgen.dom.*
     % 
     %       rpt = Document('output','DOCX','HeadingChapters');
     %   
     %       open(rpt);
     %       playout = rpt.CurrentPageLayout;
     %   
     %       % Initial page number is 1 with arabic number format
     %       pagenumber = PageNumber(1,'n');
     %       % set DOCX chapter number properties in page number object
     %       % Consider Heading1 as style to number the chapter page number
     %       pagenumber.ChapterStartStyle = '1';
     %       % Use colon separator
     %       pagenumber.ChapterSeparator = ':';
     %       % Add page number object to page layout styles
     %       playout.Style = [playout.Style {pagenumber}];
     %       % Set the footer programmatically
     %       pfooter = DOCXPageFooter('default');
     %       para = append(pfooter,Paragraph());
     %       para.HAlign = 'center';
     %       append(para,Page());
     %       playout.PageFooters = pfooter;
     %   
     %       append(rpt,TOC());
     %   
     %       for i=1:5
     %           title = append(rpt,Heading1(['Title of chapter with i=' num2str(i)]));
     %           title.Style = {PageBreakBefore};
     %           for j=1:65
     %               append(rpt,'This is the body of the chapter');
     %           end
     %       end
     %       
     %       close(rpt);
     %       rptview(rpt.OutputPath);     
     %       
     ChapterStartStyle;
     
     %Format Page number format
     %      This property specifies the type of characters used to 
     %      represent the page number value.
     %
     %                                                        Applies To
     %        VALUE         DESCRIPTION                       DOCX    PDF
     %
     %         'a'          Lowercase alphabetic               X       X
     %                      (a, b, c, ...)
     %         'A'          Uppercase alphabetic               X       X
     %                      (A, B, C, ...)
     %         'i'          Lowercase Roman numerals           X       X
     %                      (i, ii, iii, ...)
     %         'I'          Uppercase Roman numerals           X       X
     %                      (I, II, III, ...)
     %     'n', 'N', '1'    Arabic numerals                    X       X
     %      or 'decimal'
     %     'numberInDash'   Number with dashes                 X
     %     'hebrew1'        Hebrew numerals                    X
     %     'hebrew2'        Hebrew alphabetic                  X
     %     'arabicAlpha'    Arabic alphabetic                  X
     %     'arabicAbjad'    Arabic abjad numerals              X
     %     'thaiLetters'    Thai letters                       X
     %     'thaiNumbers'    Thai numerals                      X
     %     'thaiCounting'   Thai counting system               X
     %
     Format

     %InitialValue Page number initial value
     %      This property specifies the numeric value of the first
     %      page. When its value is empty, numbering continues from
     %      the previous page layout section.
     %
     %      See also mlreportgen.dom.PageNumber
     %      
     InitialValue

 
end
%}