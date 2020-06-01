function editTemplate(id)
    %EDITTEMPLATE Opens template in an editor
    % editTemplate(id) opens template in an editor if it is not a builtin
    % template.
    
    % Copyright 2014-2018 MathWorks, Inc.
    
    cache = rptgen.db2dom.TemplateCache.getTheCache;
    
    templatePath = getHTMLTemplate(cache, id);
    if ~isempty(templatePath)
        openHTMLBasedTemplate(templatePath);
    else
        templatePath = getDOCXTemplate(cache, id);
        if ~isempty(templatePath)
            openDOCXTemplate(templatePath);
        else
            templatePath = getPDFTemplate(cache, id);
            if ~isempty(templatePath)    
                openHTMLBasedTemplate(templatePath);
            else
            errordlg(getString(message('rptgen:r_coutline:templateNotFoundError', id)), ...
                getString(message('rptgen:r_coutline:editTemplateDialogTitle')));
            end
        end
    end
end

function openHTMLBasedTemplate(templatePath)
    if ~rptgen.db2dom.TemplateCache.isTemplateBuiltin(templatePath)
        [tParentDir, tName] = fileparts(templatePath);
        tDir = fullfile(tParentDir, tName);
        
        if ~exist(tDir, 'dir')
            unzip(templatePath, tDir);
        end
        
        mainPart = mlreportgen.dom.Document.getOPCMainPart(templatePath, 'html');
        tDocPath = fullfile(tDir, mainPart);
        editCmd = char(javaMethod('getEditHTMLCommand',...
            'com.mathworks.toolbox.rptgencore.tools.RptgenPrefsPanel',...
            tDocPath));
        
        % Launch the viewer
        evalin('base',editCmd);
    else
        errordlg(getString(message('rptgen:r_coutline:builtinTemplateError')), ...
            getString(message('rptgen:r_coutline:editTemplateDialogTitle')));
    end
end

function openDOCXTemplate(templatePath)
    if ~rptgen.db2dom.TemplateCache.isTemplateBuiltin(templatePath)
        mlreportgen.utils.word.open(templatePath);
    else
        errordlg(getString(message('rptgen:r_coutline:builtinTemplateError')), ...
            getString(message('rptgen:r_coutline:editTemplateDialogTitle')));
    end
end

