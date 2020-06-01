function varargout=rptconvert(varargin)
%RPTCONVERT  Convert report from XML to a formatted document
%   RPTCONVERT opens the Convert Source File dialog in the Report 
%   Explorer.
%
%   RPTNAME=RPTCONVERT(SOURCE) converts a DocBook XML file generated
%   from a Report Explorer setup (rpt) file to an HTML document. SOURCE
%   is a string or character array that specifies the path of the XML file.
%   RPTNAME returns the name of the resulting HTML document.
%
%   RPTNAME=RPTCONVERT(SOURCE,FORMAT) converts the XML file to a document
%   type specified by FORMAT. Enter rptconvert("-domformatlist") at the 
%   MATLAB command line to display a list of supported document formats for
%   reports based on templates. To display a list of legacy format IDs,
%   enter rptconvert("-domformatlist"). Note you should use these formats
%   only for converting XML files that use XSL or DSSSL style sheets to
%   specify formatting.
%
%   RPTNAME=RPTCONVERT(SOURCE,FORMAT,TEMPLATE) uses the specified template
%   to format the converted document. To display a list of templates
%   available to format documents of type FORMAT, enter
%   rptconvert("-templatelist", FORMAT) at the MATLAB command line. You
%   should specify a template compatible with the specified document
%   format, for example, a PDF template for a converted PDF document. If
%   the template is newly created or is not located on the MATLAB path, you
%   may need to add the template's directory to the MATLAB path, using
%   addpath,  and rebuild the template cache before running this command.
%   Enter rptrebuildcache at the MATLAB command line to rebuild the cache.
%
%   RPTNAME=RPTCONVERT(SOURCE,FORMAT,STYLESHEET) uses the specified style
%   sheet to format the converted document. To display a list of style
%   sheets available to format documents of type FORMAT, enter
%   rptconvert("-stylesheetlist", FORMAT) at the MATLAB command line. Use a
%   style sheet only for XML documents that specify a style sheet and
%   FORMAT specifies a legacy output type, such as "Adobe Acrobat". If the
%   style sheet is not located on the MATLAB path, you may need to rebuild
%   the Report Generator's style sheet registry before running this
%   command. Enter rptrebuildregistry at the MATLAB command
%   line to do rebuild the style sheet registry. If you convert a report
%   and change its style sheet, you should clear the Report Generator's
%   style sheet cache before rerunning the report with the same style
%   sheet. Enter rptconvert('-clearcache') to do this.
%
%   Appended the following flags to the end of the argument list to
%   specify conversion options:
%
%   Flag           Option
%   -------        --------------------------------------------------------
%   -view          Open the converted document in a viewer
%   -quiet         Suppress command line status messages
%   -verbose       Show all status messages
%
%   Examples
%
%   Determine the available converted document types:
%   >> rptconvert("-domformatlist")
%
%   Determine the template types available for direct PDF reports:
%   >> rptconvert("-templatelist", "dom-pdf-direct")
%
%   Convert a DocBook magic square report to PDF and display it in a
%   PDF viewer:
%
%   report("magic-square", "-fdb")
%   rptconvert("magic-square", "dom-pdf-direct", "default-rg-pdf", ...
%   "-view", "-quiet");
%
%   See also SETEDIT, REPORT, RPTLIST, RPTREBUILDCACHE, RPTREBUILDREGISTRY

%   Copyright 1997-2017 The MathWorks, Inc.

if nargin==0
    r = RptgenML.Root;
    refreshAction = r.refreshReportList('-deferred');
    r.getEditor;
    fc = RptgenML.FileConverter(r);
    r.refreshReportList(refreshAction);
    if nargout>0
        varargout{1} = fc;
    end
else
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Convert string arguments to character array arguments
    stringOutput = isstring(varargin{1});
    n = numel(varargin);
    for i = 1:n
        if isstring(varargin{i})
            varargin{i} = char(varargin{i});
        end
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    if isa(varargin{1},'RptgenML.StylesheetEditor')
        fc = rptconvert;
        fc.setStylesheetIDAbsolute(varargin{1});
        if nargout>0
            varargout{1} = fc;
        end
    elseif strncmp(varargin{1},'?',1)
        rptconvertFigure=gcbf;
        c=get(rptconvertFigure,'UserData');
        c=feval(varargin{1}(2:end),c,varargin{2:end});
        if ishandle(rptconvertFigure)
            set(rptconvertFigure,'UserData',c);
        end
    elseif strcmpi(varargin{1}(2:end),'stylesheetlist')
        fc = RptgenML.FileConverter;
        if length(varargin)>1
            set(fc,'Format',varargin{2});
            ssType = fc.getStylesheetProperty;
            %do this instead of fc.getStylesheetProperty(varargin{2}) to
            %allow "set" to do its work with rtf->rtf97 and pdf->pdf-fop
        else
            ssType = '-all';
        end
        varargout{1} = fc.getStylesheetList(ssType);
    elseif strcmpi(varargin{1}(2:end),'templatelist')
            fc = RptgenML.FileConverter;
            if length(varargin)>1
                set(fc,'Format',varargin{2});
                tType = fc.getStylesheetProperty;
            else
                tType = '-all';
            end
            varargout{1} = fc.getTemplateList(tType);
    elseif strcmpi(varargin{1}(2:end),'formatlist')
        theEnum = findtype('rptgen_docbook_target');
        if isempty(theEnum)
            %The enum type hasn't been built yet.  Create it.
            findclass(findpackage('rpt_xml'),'db_output');
            theEnum = findtype('rptgen_docbook_target');
        end
        % filter out template-based formats (i.e., dom-docx, etc.)
        ids = theEnum.Strings(:);
        names = theEnum.DisplayNames(:);
        index = cellfun(@(x) isempty(regexp(x, 'dom-', 'ONCE')), ids);
        allFormat = [ids(index),names(index)];
        varargout{1} = allFormat;
    elseif strcmpi(varargin{1}(2:end),'domformatlist')
        theEnum = findtype('rptgen_docbook_target');
        if isempty(theEnum)
            %The enum type hasn't been built yet.  Create it.
            findclass(findpackage('rpt_xml'),'db_output');
            theEnum = findtype('rptgen_docbook_target');
        end
        % filter out stylesheet-based formats
        ids = theEnum.Strings(:);
        names = theEnum.DisplayNames(:);
        index = cellfun(@(x) ~isempty(regexp(x, 'dom-', 'ONCE')), ids);
        allFormat = [ids(index),names(index)];
        varargout{1} = allFormat;       
    elseif strcmpi(varargin{1},'-clearcache')
        try
            com.mathworks.toolbox.rptgencore.output.StylesheetCache.clearCachedStylesheet(varargin{2:end});
        catch
            warning(message('rptgen:rptgenrptgen:cannotRemoveStyleSheetCache'));
        end
    else
        fc = RptgenML.FileConverter;
        if nargin>0 && ~strncmp(varargin{1},'-',1)
            fc.SrcFileName = rptgen.findFile(varargin{1},true,...
                char(com.mathworks.toolbox.rptgencore.output.OutputFormat.getExtension('db')),...
                'xml','db','sgml');
            if nargin>1 && ~strncmp(varargin{2},'-',1)
                fc.Format = varargin{2};
                if nargin>2 && ~strncmp(varargin{3},'-',1)
                    fc.setStylesheetID(varargin{3})
                end
            end
        end
        if any(strcmpi(varargin,'-view'))
            fc.View = true;
        else %if any(strcmp(varargin,'-noview'))
            fc.View = false;
        end
        
        oldFilterLevel = [];
        if any(strcmpi(varargin,'-quiet'))
            oldFilterLevel = javaMethod('staticGetPriorityFilter',...
                'com.mathworks.toolbox.rptgencore.GenerationDisplayClient');
            javaMethod('staticSetPriorityFilter',...
                'com.mathworks.toolbox.rptgencore.GenerationDisplayClient',...
                0);
        elseif any(strcmpi(varargin,'-verbose'))
            oldFilterLevel = javaMethod('staticGetPriorityFilter',...
                'com.mathworks.toolbox.rptgencore.GenerationDisplayClient');
            javaMethod('staticSetPriorityFilter',...
                'com.mathworks.toolbox.rptgencore.GenerationDisplayClient',...
                6);
        end
        
        if (any(strcmpi(varargin, '-cleanfonts')))
            fc.cleanupFontDirectory = true;
        end
        
        varargout{1} = fc.cbkConvert;
        if stringOutput
            varargout{1} = string(varargout{1});
        end
        
        if nargout>1          
            if stringOutput
                varargout{2}={""};
            else
                 varargout{2}={''};
            end
        end
        
        if ~isempty(oldFilterLevel)
            javaMethod('staticSetPriorityFilter',...
                'com.mathworks.toolbox.rptgencore.GenerationDisplayClient',...
                oldFilterLevel);
        end
    end
end
