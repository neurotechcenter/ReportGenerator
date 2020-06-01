classdef Report < mlreportgen.dom.Document
    %REPORT Main class for the magic square report. An instance of this
    %  class reproduces the MATLAB Report Generator's magic-square.rpt
    %  report example. It produces a report on a user-specifiable set of
    %  magic squares, i.e., square arrays whose rows and columns and 
    %  diagonals add up to the same value. This report consists of an
    %  introduction to magic squares and a chapter for each square
    %  specifiedby the user. Each chapter displays a 
    %  magic square as a table or a color-coded image, depending on the
    %  size of the square.
    %
    %  This class relies on a template to generate a report. The 
    %  template contains the following sections
    %
    %      * Title page with a hole for today's date
    %      * A table of contents page that automatically generates a
    %        TOC for the report
    %      * An introduction to magic squares followed by a hole for
    %        magic square chapters
    %      
    %  This class specifies methods for filling in the holes in the
    %  template. It inherits a fill method from Document class that 
    %  invokes the hole-filling methods to generate a report. 
    %
    %  The method that fills the chapters hole in the master template
    %  relies on another class, mlreportgen.examples.magic.MagicSquare,
    %  to create the chapters that it appends to the chapters hole.
    %
    %  To create a report with this class, create an instance of it and
    %  invoke its fill method.
    %
    %  Example:
    %
    %  rpt = mlreportgen.examples.magic.Report('MyReport', ...
    %        'docx', [10, 20, 90]);
    %  fill(rpt);
    %  close(rpt);
    %  rptview(rpt.OutputPath, 'docx');
    
    properties
        
        % Ranks of the magic squares to be included in report
        Ranks
    end

    
    methods
        
        function rpt = Report(path, type, ranks)
            %REPORT(PATH, TYPE, RANKS) constructs a report object that
            % generates a report at the specified path in the specified
            % document type ('docx' or 'html') on the 
            % magic squares specified by RANKS, a 1xN array of 
            % square ranks.
            %
            % Note: to generate PDF, first generate docx output and then
            % use rptview or docview to convert the docx to PDF.
            
            % Get location of magic square chapter template
            m_file_dir = mfilename('fullpath');
            % mfilename('fullpath') returns a concatenation of current m-file
            % directory, file separator and current m-file name without extention. As
            % path to template starts 3 levels up from the current m-file directory, we have to
            % call fileparts() 4 times to first get rid of the file separator and current m-file
            % name and then go 3 levels up in directories structure. This is a workaround for
            % the fact that fullfile no longer resolves dots (e.g., ../) in paths.
            for i = 1 : 4;
                [m_file_dir, ~, ~] = fileparts(m_file_dir);
            end
            template =  fullfile(m_file_dir, ...
                'resources/templates/magic/magic_squares_main_template');            
            
            % Construct report object.
            rpt@mlreportgen.dom.Document(path, type, template);
            
            % Set ranks property
            rpt.Ranks = ranks;
        end
        
        function fillReportDate(rpt)
            % This report's fill method (inherited from Document class)
            % invokes this method when it encounters the template's 
            % 'ReportDate' hole. It appends today's date to the hole.
            % 
            % Note that the method naming convention fillHOLE_ID
            % causes a method to be invoked when the specified HOLE_ID
            % is encountered.
            append(rpt, date);
        end
        
        function fillSquareChapters(rpt)
            % Fill the chapters hole in the master template, creating
            % one chapter for each magic square specified by rpt.Ranks.
            for i = 1:length(rpt.Ranks)
                % Construct a chapter object for the current magic square.
                chapter = mlreportgen.examples.magic.MagicSquare(rpt, rpt.Ranks(i));
                
                % Fill the holes in the chapter.
                fill(chapter);
                
                % Append the chapter to the report.
                append(rpt, chapter);
            end
        end
        
    end
    
end