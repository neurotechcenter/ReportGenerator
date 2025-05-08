classdef ReportPreviewer < handle
    % REPORTPREVIEWER Summary of this class goes here
    % Parent of SliceViewer3D.
    % This function creates a interactive GUI such that People can preview
    % the result of the SubjectReportGenerator.m
    properties (Access = public, SetObservable)
        StripInfo
        ImagingFile
        ContrastInfo
        
    end
    
    properties (Access = public)
        gui
        OutPath
    end
    
    properties (Access = protected)
        currPath
        
        previewer
        list
        sv3d
        minSlider
        maxSlider
        
        subj = ''
        subjPath
        currStrip
        currStripName
        electrodes
        electrodeNames
        counts
        reportName
        
        origContrast = []
        whichSlider
        isRunning = false
        pdfOff
        
        %variables for 3d grid modeling
        gridIndex
        chIndex
        buttonModelOn
        buttonModelOff
        TransparencyOn
        TransparencyOff
        % transSlider
        
        %variables for electrode type options
        eTypeScroll
        eTypeGrid
        eTypeButton
        butGroups
        tbg
    end
    
    
    methods
        function obj = ReportPreviewer(filePath)
            %% Create interface
            if(nargin < 1)
                fileStats = obj.loadSubjectPath();
            else
                fileStats = obj.loadSubjectPath([],[],filePath);
            end
            
            if(fileStats == 0)
                delete(obj)
                return
            end
            obj.OutPath=[];
            obj.currPath = pwd;
            obj.gui = figure('units','normalized','outerposition',[1/6 1/3 2/3 2/3],...
                'Name',['Report Previewer: ',obj.subj],'NumberTitle', 'off', ...
                'MenuBar', 'none', ...
                'Toolbar', 'none');
            uimenu(obj.gui,'Label','Load a Subject','Callback', @obj.loadSubjectPath);
            %uimenu(obj.gui,'Label','Load Settings','Callback', @obj.loadSubjectPath);
            %uimenu(obj.gui,'Label','Save Settings','Callback', @obj.loadSubjectPath);
            obj.previewer = uix.HBoxFlex('Parent',obj.gui,'Spacing',10,'Padding',15);
            wb = waitbar(0,'Creating interfaces');
          %% Create tab GUI
            waitbar(0.25,wb,'Name','Creating tabs');
            ctrlPanel = uix.BoxPanel('Parent',obj.previewer,'Title','Control Panel: ','Padding',10);
            buttonLayer = uix.VBox('Parent',ctrlPanel,'Spacing',5);
            tabsPanel = uix.TabPanel('Parent',buttonLayer);
            %Create list tab
            obj.list = uicontrol('Parent',tabsPanel,'Style','listbox','FontSize',13);
            addlistener(obj,'StripInfo','PostSet',@obj.stripInfoChanged);
            addlistener(obj.list,'Value','PostSet',@obj.onListSelection);
            %Create options tab with VBox
            optionBoxes = uix.VBox('Parent',tabsPanel,'Spacing',5);
            displayPanel = uix.Panel('Parent',optionBoxes,'Title','Display Options','Padding',5);
            displayGrid = uix.Grid('Parent',displayPanel,'Padding',5); %allow multiple elements under displayPanel
            %Create Cursor option grid (2X3)
            cursorGrid = uix.Grid('Parent',displayGrid,'Spacing',5,'Padding',5);
            
            uicontrol('Parent',cursorGrid,'Style','text','String','Cursor Color');
            uicontrol('Parent',cursorGrid,'Style','text','String','Cursor Style');
            uicontrol('Parent',cursorGrid,'Style','text','String','Cursor Size');
            uicontrol('Parent',cursorGrid,'Style','text','String','Show 3D Model');
            uicontrol('Parent',cursorGrid,'Style','text','String','3D Model Transparency');

            % Cursor Color
            bg1 = uibuttongroup('Parent',cursorGrid);
                buttonRed = uicontrol('Parent',bg1,'Style','radiobutton','String','Red',...
                                    'Position',[10,5,100,20]);
                addlistener(buttonRed,'Value','PostSet',@obj.redPressed);
                buttonGreen = uicontrol('Parent',bg1,'Style','radiobutton','String','Green',...
                                    'Position',[70,5,100,20]);
                addlistener(buttonGreen,'Value','PostSet',@obj.greenPressed);
                buttonYellow = uicontrol('Parent',bg1,'Style','radiobutton','String','Yellow',...
                                    'Position',[130,5,100,20]);
                addlistener(buttonYellow,'Value','PostSet',@obj.yellowPressed);

            % Cursor Size
            bg2 = uibuttongroup('Parent',cursorGrid);
                cursorSmall = uicontrol('Parent',bg2,'Style','radiobutton','String','Small',...
                                    'Position',[10,5,100,20]);
                addlistener(cursorSmall,'Value','PostSet',@obj.smallPressed);
                cursorMedium = uicontrol('Parent',bg2,'Style','radiobutton','String','Medium',...
                                    'Position',[70,5,100,20]);
                addlistener(cursorMedium,'Value','PostSet',@obj.mediumPressed);
                cursorLarge = uicontrol('Parent',bg2,'Style','radiobutton','String','Large',...
                                    'Position',[130,5,100,20]);
                addlistener(cursorLarge,'Value','PostSet',@obj.largePressed);

            % Cursor Style
            bg3 = uibuttongroup('Parent',cursorGrid);
                buttonCross = uicontrol('Parent',bg3,'Style','radiobutton','String','Cross',...
                                    'Position',[10,5,100,20]);
                addlistener(buttonCross,'Value','PostSet',@obj.crossPressed);
                buttonDot = uicontrol('Parent',bg3,'Style','radiobutton','String','Dot',...
                                    'Position',[110,5,100,20]);
                addlistener(buttonDot,'Value','PostSet',@obj.dotPressed);
            
            % Plot 3D model button
            bg4 = uibuttongroup('Parent',cursorGrid);
                obj.buttonModelOn = uicontrol('Parent',bg4,'Style','radiobutton','String','On',...
                                    'Position',[10,5,100,20]);
                addlistener(obj.buttonModelOn,'Value','PostSet',@obj.modelOnPressed);
                obj.buttonModelOff = uicontrol('Parent',bg4,'Style','radiobutton','String','Off',...
                                    'Position',[110,5,100,20]);
                set(bg4,'SelectedObject',obj.buttonModelOff); 

            % Transparency
            bg5 = uibuttongroup('Parent',cursorGrid);
                obj.TransparencyOn = uicontrol('Parent',bg5,'Style','radiobutton','String','On',...
                                    'Position',[10,5,100,20]);
                addlistener(obj.TransparencyOn,'Value','PostSet',@obj.TransparencyOnPressed);
                obj.TransparencyOff = uicontrol('Parent',bg5,'Style','radiobutton','String','Off',...
                                    'Position',[110,5,100,20]);
                set(bg5,'SelectedObject',obj.TransparencyOff); 



            set(cursorGrid,'Widths',[-1,-2],'Heights',[30,30,30,30,30]);
                
            outputPanel = uix.Panel('Parent',optionBoxes,'Title','Output Options','Padding',5);
                %Create output option grid (1X3)
                pdfGrid = uix.Grid('Parent',outputPanel,'Spacing',5,'Padding',5);  
                uicontrol('Parent',pdfGrid,'Style','text','String','Additional PDF report');
                bgPDF = uibuttongroup('Parent',pdfGrid);
                uicontrol('Parent',bgPDF,'Style','radiobutton','String','On',...
                                    'Position',[10,5,100,20]);
                obj.pdfOff = uicontrol('Parent',bgPDF,'Style','radiobutton','String','Off',...
                                    'Position',[110,5,100,20]);
                set(pdfGrid,'Widths',[-1,-2],'Heights',30);
                set(bgPDF,'SelectedObject',obj.pdfOff);
                
            set(optionBoxes,'Heights',[-1,-1]);
            %End options tab with VBox
            %Create Electrode type tab
            eTypePanel = uix.Panel('Parent',tabsPanel,'Title','Electrode Type Options for 3D model','Padding',5);
            eTypeVBox = uix.VBox('Parent',eTypePanel,'Spacing',5);
            obj.eTypeScroll = uix.ScrollingPanel('Parent',eTypeVBox); %allow rollable object under eTypePanel
            obj.eTypeGrid = uix.Grid('Parent',obj.eTypeScroll); %Scroll panel created first, contents added later
            obj.eTypeButton = uicontrol('Parent',eTypeVBox,'Style','PushButton',...
                'String','Apply Changes');
            addlistener(obj.eTypeButton,'Value','PostSet',@obj.eTypeApplyPressed);
            set(eTypeVBox,'Heights',[-1,25]);
            %End electrode type tab
            
            waitbar(0.5,wb,'Name','Creating panels');
            %Create Contrast Sliders
            minPanel = uix.Panel('Parent',buttonLayer,'Title','Imaging Minimum','Padding',5);
                obj.minSlider = uicontrol('Parent',minPanel,'Style','slider',...
                                            'Units','normalized','Min',1,'Max',2,'Value',1);
                addlistener(obj.minSlider,'Value','PostSet',@obj.sliderChanged);
            maxPanel = uix.Panel('Parent',buttonLayer,'Title','Imaging Maximum','Padding',5);
                obj.maxSlider = uicontrol('Parent',maxPanel,'Style','slider',...
                                            'Units','normalized','Min',1,'Max',2,'Value',2);
                addlistener(obj.maxSlider,'Value','PostSet',@obj.sliderChanged);
            %End Contrast Sliders
            activateButton = uicontrol('Parent',buttonLayer,'Style','PushButton',...
                'String','Proceed and Generate the Subject Report',...
                'BackgroundColor','g');
                addlistener(activateButton,'Value','PostSet',@obj.generateReport);
            set(buttonLayer,'Heights',[-1,45,45,30]);
            tabsPanel.TabTitles = {'Channel List', 'Imaging Options', 'Grid Options'};
            tabsPanel.TabWidth = 85;
            %End tab GUI
            waitbar(0.75,wb,'Name','Creating viewer');
          %% Create Imaging GUI
            svPanel = uix.BoxPanel('Parent',obj.previewer,'Title','Electrode Location View: ');
            obj.sv3d = SliceViewer3DReportGenerator('Parent',svPanel,'SliderVisible','off','BackgroundColor','k');
            addlistener(obj,'ImagingFile','PostSet',@obj.imagingFileChanged);
            addlistener(obj,'ImagingFile','PostSet',@obj.eTypeChanged);
          %% Finalize the ReportPreviewer GUI
            set(obj.previewer, 'Widths',[-1,-2.8]);
     
            if(~(isempty(obj.StripInfo)||isempty(obj.ImagingFile)))
                obj.stripInfoChanged();
                obj.imagingFileChanged();
                obj.eTypeChanged();
                %3D model initialization
                obj.sv3d.subjPath = obj.subjPath;
                obj.sv3d.ModelSettings = {'off',obj.StripInfo(1,:),0,0,1}; 
                obj.onListSelection();
            end
            waitbar(1,wb,'Name','Done');
            delete(wb)
        end
    end
    
    methods (Access = private)
        
        function stats = loadSubjectPath(obj,~,~,inPath)
            if(obj.isRunning)
                warndlg('Wait for the generation to complete','Warning');
                stats = 0;
                return
            end
            if(nargin < 4)
                isPath=uigetdir();
            else
                isPath=inPath;
            end
            
            if (isPath == 0)
                errordlg('No subject folder was selected','File Error');
                stats = 0;
                return
            end
            imgDir = dir(fullfile(isPath,'**/*.img'));
            errormessage = [];
            if (isempty(imgDir))
                errormessage = [errormessage,...
                    '\n--No Imaging file with (.img) format was found under the selected folder'];
            end
            dataDir = dir(fullfile(isPath,'**/*.dat'));
            if (isempty(dataDir))
                errormessage = [errormessage,...
                    '\n--No Electrode file with (.dat) format was found under the selected folder \n'];
            end
            if(isempty(imgDir)||isempty(dataDir))
                errordlg(sprintf([errormessage,'Please check your subject folder']),'File Missing');
                stats = 0;
                return
            end
            %import Electrodes
            isStripInfo = electrodesFetch(isPath);
            if(isempty(isStripInfo))
                stats = 0;
                return
            end
             %Read the MRI nifiti files
            isImagingFile = niiGene(isPath);
            if(isempty(fieldnames(isImagingFile)))
                stats = 0;
                return
            end
            
            
            %TILL THIS POINT, FILES ARE VALID
            stats = 1;
            obj.subjPath=isPath;
            [~,obj.subj]=fileparts(obj.subjPath);
            obj.StripInfo = isStripInfo;
            obj.ImagingFile = isImagingFile;
            %3D model change as well (initialized)
            obj.sv3d.subjPath = obj.subjPath;
            %delete(obj.sv3d.Children(4))
            obj.sv3d.ModelSettings = {'off',obj.StripInfo(1,:),0,0,1}; %3D model should be off at every change of subject
            obj.buttonModelOff.Value = 1;
            
            %Change the title of the gui
            obj.gui.Name = ['Report Previewer: ',obj.subj];
            
           
            obj.list.Value = 1;

        end
        
        function onListSelection(obj,~,~) 
            obj.sv3d.Cursor = obj.electrodes(obj.list.Value,:);
            drawnow
            obj.sv3d.ModelSettings(3:4) = {obj.gridIndex(obj.list.Value),obj.chIndex(obj.list.Value)};
            %fprintf('Hey %i \n',obj.list.Value);
        end
        
        function stripInfoChanged(obj,~,~)
            obj.unzipStripInfo();
            obj.list.String = obj.electrodeNames;
        end
        
        function imagingFileChanged(obj,~,~)
            obj.sv3d.Image = obj.ImagingFile;
            obj.sv3d.Cursor = [0,0,0];
            %Contrast sliders initialization
            obj.origContrast = [min(min(min(obj.ImagingFile.img))),...
                                max(max(max(obj.ImagingFile.img)))];
            obj.ContrastInfo = obj.origContrast;
            obj.minSlider.Min = obj.origContrast(1);
            obj.minSlider.Max = obj.origContrast(2)-1;
            obj.maxSlider.Min = obj.origContrast(1)+1;
            obj.maxSlider.Max = obj.origContrast(2);
            %set contrast sliders value
            obj.minSlider.Value = obj.minSlider.Min;
            obj.maxSlider.Value = obj.maxSlider.Max;
            obj.sliderChanged();
            %add into contrastslider
            % obj.sv3d.ContrastUpdate = [];
            
        end
        
        function sliderChanged(obj,~,~)
            %Making sure the location of sliders are correct
            if(obj.minSlider.Value > obj.ContrastInfo(2))
                obj.minSlider.Value = obj.ContrastInfo(2)-1;
            elseif (obj.maxSlider.Value < obj.ContrastInfo(1))
                obj.maxSlider.Value = obj.ContrastInfo(1)+1;
            end
            %Passing the slider value to sv3d
            obj.ContrastInfo(1) = obj.minSlider.Value;
            obj.ContrastInfo(2) = obj.maxSlider.Value;
            obj.sv3d.ContrastUpdate = obj.ContrastInfo;
        end
        
        function unzipStripInfo(obj)
            obj.electrodes = vertcat(obj.StripInfo{1,:});
            obj.electrodeNames = cell(size(obj.electrodes,1),1);
            obj.counts = 1;
            
            obj.gridIndex = zeros(size(obj.electrodeNames));
            obj.chIndex = zeros(size(obj.gridIndex));
            
            for sIndex = 1:size(obj.StripInfo,2)
                obj.currStrip = obj.StripInfo{1,sIndex};
                obj.currStripName = obj.StripInfo{2,sIndex};
                for eIndex = 1:size(obj.currStrip,1)
                    obj.electrodeNames(obj.counts,1) = {[obj.currStripName,' - Ch ',int2str(eIndex)]};
                    obj.gridIndex(obj.counts,1) = sIndex;
                    obj.chIndex(obj.counts,1) = eIndex;
                    obj.counts = obj.counts+1;
                end
            end
        end
        
        %% EtypeButton Group
        
        function eTypeChanged(obj,~,~)
            if(ishandle(obj.eTypeGrid))
                delete(obj.eTypeGrid)
                obj.sv3d.GridTypeOpts = [];
            end
            obj.eTypeGrid = uix.Grid('Parent',obj.eTypeScroll,'Padding',5,'Spacing',5);
            
            uicontrol('Parent',obj.eTypeGrid,'Style','text','String','Grid / Apply all',...
                'FontWeight','bold');
            for etIndex = 1:size(obj.StripInfo,2)
                uicontrol('Parent',obj.eTypeGrid,'Style','text','String',obj.StripInfo(2,etIndex));
            end 
            
            obj.tbg = uibuttongroup('Parent',obj.eTypeGrid);
                uicontrol('Parent',obj.tbg,'Style','radiobutton','String','ECoG',...
                                    'Position',[10,5,70,20]);
                uicontrol('Parent',obj.tbg,'Style','radiobutton','String','SEEG',...
                                    'Position',[80,5,70,20]);
                obj.tbg.SelectedObject = obj.tbg.Children(2);
                addlistener(obj.tbg,'SelectedObject','PostSet',@obj.tbutGroupsPressed);
                
            obj.butGroups = cell(1,size(obj.StripInfo,2));
            for etIndex = 1:size(obj.StripInfo,2)
                bg = uibuttongroup('Parent',obj.eTypeGrid);
                uicontrol('Parent',bg,'Style','radiobutton','String','ECoG',...
                                    'Position',[10,5,70,20]);
                uicontrol('Parent',bg,'Style','radiobutton','String','SEEG',...
                                    'Position',[80,5,70,20]);
                bg.SelectedObject = bg.Children(2);
                addlistener(bg,'SelectedObject','PostSet',@obj.butGroupsPressed);
                obj.butGroups(etIndex) = {bg};
            end
            
            set(obj.eTypeGrid,'Heights',30*ones(length(obj.eTypeGrid.Children),1),'Widths',[-1,140]);
            obj.eTypeScroll.MinimumHeights = (obj.eTypeGrid.Heights(1)+5)*length(obj.eTypeGrid.Children)/2;
            obj.butGroupsPressed();
        end
        
        function tbutGroupsPressed(obj,~,~)
            if(ishandle(obj.tbg.SelectedObject))%very strange....................
            else
                obj.tbg.SelectedObject = obj.tbg.Children(2);
            end
            if(isequal(obj.tbg.SelectedObject.String,'ECoG'))
                for etIndex = 1:size(obj.StripInfo,2)
                    obj.butGroups{etIndex}.SelectedObject = obj.butGroups{etIndex}.Children(2);
                    obj.sv3d.GridTypeOpts(etIndex) = 0;
                end
            else
                for etIndex = 1:size(obj.StripInfo,2)
                    obj.butGroups{etIndex}.SelectedObject = obj.butGroups{etIndex}.Children(1);
                    obj.sv3d.GridTypeOpts(etIndex) = 1;
                end
            end
        end
        
        function butGroupsPressed(obj,~,~)
            for etIndex = 1:size(obj.StripInfo,2)
                if(ishandle((obj.butGroups{etIndex}.SelectedObject)))
                else
                    obj.butGroups{etIndex}.SelectedObject = obj.butGroups{etIndex}.Children(2);
                end
                if(isequal(obj.butGroups{etIndex}.SelectedObject.String,'ECoG'))
                    obj.sv3d.GridTypeOpts(etIndex) = 0; % ECoG type
                else
                    obj.sv3d.GridTypeOpts(etIndex) = 1; % SEEG type
                end
            end
        end
        
        function eTypeApplyPressed(obj,~,~)
            set(obj.eTypeButton,'Enable','off');
            obj.buttonModelOff.Value = 1;
            obj.buttonModelOn.Value = 1;
            set(obj.eTypeButton,'Enable','on');
        end
        
        %% Create button group
        function redPressed(obj,~,~)
            obj.sv3d.CursorUpdate(1) = {'r'};
        end
        function greenPressed(obj,~,~)
            obj.sv3d.CursorUpdate(1) = {'g'};
        end
        function yellowPressed(obj,~,~)
            obj.sv3d.CursorUpdate(1) = {'y'};
        end
        function crossPressed(obj,~,~)
            obj.sv3d.CursorUpdate(2) = {'cross'};
        end
        function dotPressed(obj,~,~)
            obj.sv3d.CursorUpdate(2) = {'dot'};
        end
        function smallPressed(obj,~,~)
            obj.sv3d.CursorUpdate(3) = {20};
        end
        function mediumPressed(obj,~,~)
            obj.sv3d.CursorUpdate(3) = {50};
        end
        function largePressed(obj,~,~)
            obj.sv3d.CursorUpdate(3) = {80};
        end
        function modelOnPressed(obj,~,~)
            if(obj.buttonModelOn.Value == 1)
                obj.sv3d.ModelSettings(1) = {'on'};
                if(~isempty(obj.sv3d.Slice3DErrorMessage))
                    obj.sv3d.ModelSettings = {'off',obj.StripInfo(1,:),0,0,1};
                    obj.buttonModelOff.Value = 1;
                end
            else
                obj.sv3d.ModelSettings(1) = {'off'};
            end
        end
        function TransparencyOnPressed(obj,~,~)
            if obj.TransparencyOn.Value == 1
                obj.sv3d.ModelSettings(5) = {0.4};
            else
                obj.sv3d.ModelSettings(5) = {1};
            end

            % Flip off and on to reload model with correct transparency
            if(obj.buttonModelOn.Value == 1)
                obj.sv3d.ModelSettings(1) = {'off'};
                obj.sv3d.ModelSettings(1) = {'on'};
            end
        end

        %Button group end
        

        
        %% Generate Report
        function generateReport(obj,~,~)
            if(obj.isRunning)
                warndlg('Wait for the generation to completed','Warning');
                return
            end
            obj.isRunning = true;
           %% Creating Report from template
            %cd(fileparts(mfilename));
            if isdeployed
                makePPTCompilable();
            end
            import mlreportgen.ppt.*;
            
            
            opts.Interpreter = 'tex';
            obj.reportName = inputdlg({['\fontsize{12}' 'Please enter your report name (avoid repeating names with existed files)']},...
                            'Report Naming',[1,50],{[obj.subj '-summary']},opts);
            if(isempty(obj.reportName))
                warndlg('Please enter a valid report name','Empty Input');
                obj.isRunning = false;
                return
            end
            wb = waitbar(0,'Loading from template...');
            slidesFile =fullfile(obj.subjPath,[obj.reportName{1},'.pptx']);% *****
            obj.OutPath=slidesFile;
            slides = Presentation(slidesFile,fullfile(fileparts(mfilename('fullpath')),'SubjectReport-template'));
            
            % Title page and related page of the summary pdf
            try
                presentationTitleSlide = add(slides,'Title Slide');
            catch e
                delete(wb);
                % errordlg(sprintf(['Check if [ %s ] is open, \n',...
                %     'if so, close it and try again.'],[obj.reportName{1},'.pptx']));
                errordlg(sprintf(e.message));
                obj.isRunning = false;
                return
            end
            replace(presentationTitleSlide,'Title',obj.subj);% *****
            
            subtitleText = Paragraph(sprintf('Generated at %s', datestr(now,'HH:MM')));% *****
            replace(presentationTitleSlide,'Subtitle',subtitleText);
            
            f=figure('units','normalized','outerposition',[1/3 0 2/3 1],'color','k','visible','on');

            f.InvertHardcopy = 'off';
            
            % Imaging portion
            Slice=SliceViewer3DReportGenerator('Parent',f,'SliderVisible','off','BackgroundColor','k');
            Slice.Image = obj.ImagingFile;
            Slice.ContrastUpdate = obj.ContrastInfo;
            Slice.CursorUpdate = obj.sv3d.CursorUpdate;
            
            %3D portion
            Slice.subjPath = obj.sv3d.subjPath;
            SliceGridIndex = obj.gridIndex;
            SliceChIndex = obj.chIndex;
            Slice.GridTypeOpts = obj.sv3d.GridTypeOpts;
            Slice.rotate3D = 'off';
            
            waitbar(1,wb,'Name','Saving settings...');
            delete(wb)
            
            %% Creating output folder and initializing Slice
            str = fullfile(obj.subjPath,'ReportFigures_raw');
            if(exist(str,'dir')==7)
                for trail=1:4
                    status=rmdir(str, 's');
                    if status==1
                        break
                    end
                    pause(.1*trail);
                end
                if status==0
                    delete(wb)
                    errordlg(sprintf(['Check if [ ReportFigures_raw ] is open, \n',...
                        'if so, close it and try again.']));
                    obj.isRunning = false;
                    return
                end
            end
            mkdir(fullfile(obj.subjPath,'ReportFigures_raw'));
            %Create progress waitbar
            wb = waitbar(0,'Generating report...','Name','Progress',...
                'CreateCancelBtn','setappdata(gcbf,''canceling'',1)');
            setappdata(wb,'canceling',0);
            nosave = false;
            
            count = 1;
            %Add a slide
            Slice.Cursor = [0 0 0];
            Slice.ModelSettings = [obj.sv3d.ModelSettings(1:2),{0},{0},obj.sv3d.ModelSettings(5)];
            export_fig(f,fullfile(obj.subjPath,'ReportFigures_raw','Origin'),'-png');
            %% Adding 3d model info into the beginning of the report
            v = figure('units','normalized','outerposition',[1/3 0 2/3 1],'color','k','visible','off');
            axModel=axes(v,'Color','k');
            [axModel,axErrMsg] = brainModeler(obj.subjPath,axModel);           
            if(isequal(Slice.ModelSettings{1},'on')&&isempty(axErrMsg))
                waitbar(0,wb,'Name','Creating 3D model face view...')
                
                v.InvertHardcopy = 'off';

                %zoom(0.9)
                drawnow
                cmap = colormap(axModel);
                stIndex = size(cmap,1);
                addcmap = colormap(hsv(size(obj.StripInfo,2)));
                lcmap = size(addcmap,1);
                newcmap = zeros(lcmap,3);
                for i = 1:floor(lcmap/2)
                    newcmap(2*i-1,:) = addcmap(i,:);
                    newcmap(2*i,:) = addcmap(i+ceil(lcmap/2),:);
                end
                if(rem(lcmap,2)~=0)
                    newcmap(end,:) = addcmap(median([1:1:lcmap]),:);
                end
                
                cmap = [cmap;newcmap];
                colormap(axModel,cmap);
                plotBallsOn3DImage(axModel,[0,0,0],stIndex,0.1);
                
                for gridIdx = 1:size(obj.StripInfo,2)
                    electrodesOnG = obj.StripInfo{1,gridIdx};
                    if(Slice.GridTypeOpts(gridIdx))
                        r0 = mean(electrodesOnG);
                        [~,~,V]=svd(bsxfun(@minus,electrodesOnG,r0),0);
                        t=linspace(-50,50,50);
                        xfit=r0(1)+t*V(1,1);
                        yfit=r0(2)+t*V(2,1);
                        zfit=r0(3)+t*V(3,1);
                        Mx = max(electrodesOnG);
                        Mi = min(electrodesOnG);
                        hlength = 100;
                        trimIndex{1} = find(xfit<Mx(1)+hlength & xfit>Mi(1)-hlength);
                        trimIndex{2} = find(yfit<Mx(2)+hlength & yfit>Mi(2)-hlength);
                        trimIndex{3} = find(zfit<Mx(3)+hlength & zfit>Mi(3)-hlength);
                        [~,tIndex] = min([length(trimIndex{1}),...
                            length(trimIndex{2}),length(trimIndex{3})]);
                        trim = trimIndex{tIndex};
                        xfit = xfit(trim);
                        yfit = yfit(trim);
                        zfit = zfit(trim);
                        plotBallsOn3DImage(axModel,[xfit',yfit',zfit'],stIndex+gridIdx,2);
                    else
                        plotBallsOn3DImage(axModel,electrodesOnG,stIndex+gridIdx,2);
                    end
                end
                
                cEnd = length(cmap);
                correctedStart = cEnd -(cEnd-stIndex)*49/50;
                cb = colorbar(axModel,'Limits',[correctedStart cEnd],'Color',[1,1,1],'TickLabelInterpreter','none'); 
                cb.Ticks = [correctedStart+49/100:49/50:cEnd-49/100];
                cb.TickLabels = obj.StripInfo(2,:)';
                %cb.FontWeight = 'bold';
                resolu = get(0,'screensize');
                windowSize = resolu .* v.Position;
                cb.FontSize = 12*windowSize(4)/1080;
                
                
                
                %alpha(axModel,0.75);
                
                export_fig(v,fullfile(obj.subjPath,'ReportFigures_raw','Overview'),'-png','-nocrop');
                faceName = {'Posterior','Right','Anterior','Left','Superior','Inferior'};
                for faceIndex = 1:6
                    waitbar(faceIndex/6,wb,'Name','Creating 3D model face view...');
                    view(axModel,(faceIndex-1)*90,0)
                    if(faceIndex>4)
                        view(axModel,0,(2*(faceIndex-4)-1)*90)
                    end
                    try
                    export_fig(v,fullfile(obj.subjPath,'ReportFigures_raw',faceName{faceIndex}),'-png','-nocrop');
                    catch e
                        delete(v);
                        delete(wb);
                        errordlg('Fail to create the face slice','generateReport error');
                        obj.isRunning = false;
                        return
                    end
                    plot2 = Picture(fullfile(obj.subjPath,'ReportFigures_raw',...
                                                [faceName{faceIndex},'.png']));
                    pictureSlide = add(slides,'Title and Content');
                    replace(pictureSlide, 'Title', faceName{faceIndex});
                    contents = find(pictureSlide,'Content');
                    replace(contents(1),plot2);
                end
            end
            delete(v);
          %% Adding Slice info into the report
            waitbar(0,wb,'Name','Creating electrode slices...');
            for sIndex = 1:size(obj.StripInfo,2)
                cStrip = obj.StripInfo{1,sIndex};
                cStripName = obj.StripInfo{2,sIndex};
       
                for eIndex = 1:size(cStrip,1)
                    if getappdata(wb,'canceling')
                        nosave = true;
                        break
                    end
                    
                    try
                    waitbar(count/size(obj.electrodes,1),wb,'Name',...
                    sprintf(['Strip %i/',int2str(size(obj.StripInfo,2)),': ',...
                                    cStripName,' (Ch. %i)'],sIndex,eIndex));
                    wb.Children(2).Title.Interpreter = 'none';
                    catch e
                        %delete(wb);
                        %obj.isRunning = false;
                        %return
                    end
                
                    electrodeName = [cStripName,' - Ch ',int2str(eIndex)];
                    elec_fileName=replace(electrodeName,' ','_');
                    electrodeCursor = cStrip(eIndex,:);
                    
                    try
                    Slice.Cursor = electrodeCursor;
                    drawnow
                    Slice.ModelSettings(3:4) = {SliceGridIndex(count),SliceChIndex(count)};
                    
                    export_fig(f,fullfile(obj.subjPath,'ReportFigures_raw',elec_fileName),'-png');
                    catch e
                        delete(f);
                        delete(wb);
                        errordlg('Fail to create the next slice','generateReport error');
                        obj.isRunning = false;
                        return
                    end
                    
                    plot1 = Picture(fullfile(obj.subjPath,'ReportFigures_raw',[elec_fileName  '.png']));
                    
                    pictureSlide = add(slides,'Title and Content');
                    replace(pictureSlide, 'Title', electrodeName);
                    contents = find(pictureSlide,'Content');
                    replace(contents(1),plot1);
                    
                    count = count+1;
                end
            end
            close(f);
            delete(wb);
            
            if(nosave)
                obj.isRunning = false;
                return
            end
            
            wb = waitbar(1,...
                sprintf('Generating the subject report powerpoint for this subject,\n it might take a few minutes...'));
            close(slides);
            delete(wb);
            if ispc
                winopen(slidesFile);
            end
           
            msgbox(sprintf('[ %s ] report generation completed',[obj.reportName{1},'.pptx']));
            if(obj.pdfOff.Value == 0)
                obj.pdfConvertPressed();
            end
            obj.isRunning = false;
        end

        function pdfConvertPressed(obj,~,~)
            % Additionaly generate a PDF
            [~,obj.subj]=fileparts(obj.subjPath);
            %{
            if(exist(fullfile(obj.subjPath,[obj.subj,'-summary.pptx']),'file')~=2)
                errordlg(sprintf(['[ %s ] does not exist, \n',...
                    'generate the subject report first and try again.'],[obj.subj '-summary.pptx']));
                return
            end
            %}
            wb = waitbar(0,sprintf('Generating PDF,\n it might take a few minutes...'));
            
            try
                pptview(fullfile(obj.subjPath,[obj.reportName{1},'.pptx']),'converttopdf')
            catch e
                if(exist(fullfile(obj.subjPath,[obj.reportName{1},'.pdf']),'file')~=2)
                    delete(wb);
                    errordlg(sprintf(['Unable to convert [ %s ] to PDF, \n',...
                        'Convert to PDF is only available on PC and requires a valid Microsoft PowerPoint to be installed.'],[obj.reportName{1},'.pptx']));
                    return
                end
            end
            waitbar(1,wb,'Name','Opening PDF...');
            rptview(fullfile(obj.subjPath,[obj.reportName{1},'.pdf']),'pdf')
            delete(wb);
        end
        
    end
end