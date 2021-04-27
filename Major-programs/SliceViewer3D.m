classdef SliceViewer3D < uix.Grid
    %SLICEVIEWER3D Summary of this class goes here
    %Parent of SliceViewer.
    %This function creates three SliceViewer object in which each
    %represents a face of the 3d imaging file. 
    %---------------------------------------------------------------------
    %   Detailed explanation goes here
    
   properties (Access = public,SetObservable)
        Image
        ImageAlpha = 1
        Image2
        Image2Alpha = 0.5
        ImageCoordinates={}
        Image2Coordinates={}
        Cursor =[]
        SliderVisible= 'on'
        ContrastUpdate = []
        CursorUpdate = {'r','cross'}
        
        subjPath
        ModelSettings = {'off',{},0,0}
        GridOnPlot = []
        ChOnPlot = []
        Slice3DErrorMessage = []
        GridTypeOpts = []
        rotate3D = 'on'
    end
    
    properties (Access = protected)
        SliceViewX
        SliceViewY
        SliceViewZ
        Slice3D
        ignoreSliceChange = false
        
    end
    
    methods
        function obj = SliceViewer3D(varargin)
            %SLICEVIEWER3D Construct an instance of this class
            %   Detailed explanation goes here
            obj.SliceViewX=SliceViewer('Parent',obj,'SliderOrientation','north',...
                'CursorChangedFcn',@obj.setCursor,'SliceChangedFcn',@obj.sliceChanged,'ViewAxis',[2 3 1],'BackgroundColor','k'); %RAS system [left to right; posterior to anterior, inferior to sup] 
             obj.SliceViewZ=SliceViewer('Parent',obj,'SliderOrientation','north',...
                 'CursorChangedFcn',@obj.setCursor,'SliceChangedFcn',@obj.sliceChanged,'ViewAxis',[1 2 3],'BackgroundColor','k');
             obj.SliceViewY=SliceViewer('Parent',obj,'SliderOrientation','north',...
                 'CursorChangedFcn',@obj.setCursor,'SliceChangedFcn',@obj.sliceChanged,'ViewAxis',[1 3 2],'BackgroundColor','k');
             obj.Slice3D = gobjects;
                %set(obj.Slice3D,'visible','off')
            addlistener(obj,'Image','PostSet',@obj.imageChanged);
            addlistener(obj,'Cursor','PostSet',@obj.setCursorOutside);
            addlistener(obj,'SliderVisible','PostSet',@obj.sliderVisibilityChanged);
            addlistener(obj,'ContrastUpdate','PostSet',@obj.contrastChanged);
            addlistener(obj,'CursorUpdate','PostSet',@obj.cursorChanged);
            %addlistener(obj,'subjPath','PostSet',@obj.plot3DModel);
            addlistener(obj,'ModelSettings','PostSet',@obj.update3DModel);
            obj.Padding=0;
            obj.Widths=[-1 -1];
            obj.Heights=[-1 -1];
             try
              uix.set( obj, varargin{:} )
             catch e
              delete( obj )
              e.throwAsCaller()
            end
            
        end

    end
    
    methods (Access = private)
        
        function sliceChanged(obj,src,~)
            if(obj.ignoreSliceChange)
                return
            end
%              switch(src)
%                 case obj.SliceViewZ
%                       if(~isempty(obj.SliceViewX.CursorPosition))
%                           obj.SliceViewX.CursorPosition=src.CursorPosition;
%                       end
%                       if(~isempty(obj.SliceViewY.CursorPosition))
%                           obj.SliceViewY.CursorPosition=src.CursorPosition;
%                       end
%                 case obj.SliceViewY
%                       if(~isempty(obj.SliceViewX.CursorPosition))
%                           obj.SliceViewX.CursorPosition=src.CursorPosition;
%                       end
%                        if(~isempty(obj.SliceViewZ.CursorPosition))
%                            obj.SliceViewZ.CursorPosition=src.CursorPosition;
%                       end
%                 case obj.SliceViewX
%                       if(~isempty(obj.SliceViewY.CursorPosition))
%                           obj.SliceViewY.CursorPosition=src.CursorPosition;
%                       end
%                       if(~isempty(obj.SliceViewZ.CursorPosition))
%                           obj.SliceViewZ.CursorPosition=src.CursorPosition;
%                       end
%              end
            
        end
        function setCursorOutside(obj,~,~)
            if(obj.ignoreSliceChange) %avoid multiple changes
                return
            end
            obj.ignoreSliceChange=true;
            obj.SliceViewX.CursorPosition=    obj.Cursor;
            obj.SliceViewY.CursorPosition=    obj.Cursor;
            obj.SliceViewZ.CursorPosition=    obj.Cursor;
            obj.ignoreSliceChange=false;
            
            
        end
        
        function setCursor(obj,src,cursordata)
            if(obj.ignoreSliceChange) %avoid multiple changes
                return
            end
            obj.ignoreSliceChange=true;
            obj.Cursor=cursordata;
            obj.SliceViewX.CursorPosition=cursordata;
            obj.SliceViewY.CursorPosition=cursordata;
            obj.SliceViewZ.CursorPosition=cursordata;
            obj.ignoreSliceChange=false;
            
            
        end
        
        function imageChanged(obj,~,~)
            if(isempty(obj.Image))
                obj.SliceViewX.Image=[];
                obj.SliceViewY.Image=[];
                obj.SliceViewZ.Image=[];
                return
            end
           
            
            obj.SliceViewX.Image=obj.Image;
            obj.SliceViewY.Image=obj.Image;
            obj.SliceViewZ.Image=obj.Image;
            
            obj.SliceViewX.ImageAlpha=obj.ImageAlpha;
            obj.SliceViewY.ImageAlpha=obj.ImageAlpha;
            obj.SliceViewZ.ImageAlpha=obj.ImageAlpha;
            
            obj.SliceViewX.Image2Alpha=obj.Image2Alpha;
            obj.SliceViewY.Image2Alpha=obj.Image2Alpha;
            obj.SliceViewZ.Image2Alpha=obj.Image2Alpha;
            
            
            
            obj.SliceViewX.Image2=obj.Image2;
            obj.SliceViewY.Image2=obj.Image2;
            obj.SliceViewZ.Image2=obj.Image2;
            
        end
        
        function sliderVisibilityChanged(obj,~,~)
            obj.SliceViewX.SliderVisible=obj.SliderVisible;
            obj.SliceViewY.SliderVisible=obj.SliderVisible;
            obj.SliceViewZ.SliderVisible=obj.SliderVisible;
        end
        
        function contrastChanged(obj,~,~)
            obj.SliceViewX.ClimUpdate=obj.ContrastUpdate;
            obj.SliceViewY.ClimUpdate=obj.ContrastUpdate;
            obj.SliceViewZ.ClimUpdate=obj.ContrastUpdate;
        end
        
        function cursorChanged(obj,~,~)
            obj.SliceViewX.Marker=obj.CursorUpdate;
            obj.SliceViewY.Marker=obj.CursorUpdate;
            obj.SliceViewZ.Marker=obj.CursorUpdate;
        end 
        
        function update3DModel(obj,~,~)
            %% part 1 if button is off, delete model and clear variable
            if(isequal(obj.ModelSettings{1},'off'))
                if ishandle(obj.Slice3D)
                    delete(obj.Slice3D)
                end
                obj.GridOnPlot = [];
                obj.ChOnPlot = [];
                return
            end
            %% part 2 button on case 1
            % model doesn't exist, create inital model
            if(~ishandle(obj.Slice3D))
                wb = waitbar(0,'Loading the 3D Brain Model...');
                obj.plot3DModel(); % obj.Slice3D is created
                
                if(~isempty(obj.Slice3DErrorMessage))
                    if(ishandle(wb))
                        delete(wb)
                    end
                    errordlg(obj.Slice3DErrorMessage,'Missing files');
                    return
                end
                
                waitbar(1,wb,'Complete');
                delete(wb)
            end
            allGrid = obj.ModelSettings{2};
            % if nothing needs to be ploted then leave the model blank
            if(obj.ModelSettings{3} == 0)
                set(obj.Slice3D,'Parent',obj);
                if(isequal(obj.rotate3D,'on'))
                    %fix the rotate3d bug
                    box = obj.Parent;
                    hbox = box.Parent;
                    rotate3d off
                    rotate3d(obj.Slice3D)
                    hManager = uigetmodemanager(hbox.Parent);
                    hManager.CurrentMode.ModeStateData.textState = 0;
                    %fix end
                end
                return
            end
            %% part 3 button on
            % need to plot electrode #$4 on grid #$3
            currGrid = allGrid{obj.ModelSettings{3}};
            currCh = currGrid(obj.ModelSettings{4},:);
            if(size(allGrid,2) ~= size(obj.GridTypeOpts,2))
                delete(wb)
                errordlg('Try Restarting the Program','Grid number error');
                return
            end
     
            if(obj.GridTypeOpts(obj.ModelSettings{3})) %SEEG case
            %% button on case 2
            % this grid is a SEEG grid
            % no need to plot electrodes, only trajectory.
                if(~isequal(obj.GridOnPlot,currGrid)||isempty(obj.GridOnPlot))
                    wb = waitbar(0,'Updating the 3D Brain Model...');
                    if(~isempty(obj.GridOnPlot))
                        if ishandle(obj.Slice3D)
                            delete(obj.Slice3D)
                        end
                        obj.plot3DModel();
                    end 
                    r0 = mean(currGrid);
                    [~,~,V]=svd(bsxfun(@minus,currGrid,r0),0);
                    t=linspace(-50,50,50);
                    xfit=r0(1)+t*V(1,1);
                    yfit=r0(2)+t*V(2,1);
                    zfit=r0(3)+t*V(3,1);
                    Mx = max(currGrid);
                    Mi = min(currGrid);
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
                    %line(xfit,yfit,zfit,'LineWidth',3,'Color','w')
                    cmap = colormap(obj.Slice3D);
%                     plotBallsOn3DImage(obj.Slice3D,[xfit',yfit',zfit'],length(cmap)-1,2); %length - 1 is yellow  
%                     plotBallsOn3DImage(obj.Slice3D,[xfit(end)',yfit(end)',zfit(end)'],length(cmap)-2,2); %length - 2 is black
                    plotBallsOn3DImage(obj.Slice3D,[xfit',yfit',zfit'],length(cmap),2); %length is base color 
                    plotBallsOn3DImage(obj.Slice3D,[xfit(end)',yfit(end)',zfit(end)'],length(cmap)-1,2); %length - 1 is current color
                    %auto 3D model Rotate
                    centerGrid = mean(currGrid,1);
                    [azimuth,elevation] = cart2sph(centerGrid(1),centerGrid(2),centerGrid(3));
                    view(obj.Slice3D,azimuth*180/pi()+90,elevation*180/pi())
                    %camlight('headlight');
                    
                    set(obj.Slice3D,'Parent',obj);
                    if(isequal(obj.rotate3D,'on'))
                        %fix the rotate3d bug
                        box = obj.Parent;
                        hbox = box.Parent;
                        rotate3d off
                        rotate3d(obj.Slice3D)
                        hManager = uigetmodemanager(hbox.Parent);
                        hManager.CurrentMode.ModeStateData.textState = 0;
                        %fix end
                    end
                    waitbar(1,wb,'Complete');
                    delete(wb)
                end

            else %ECoG case
            %% button on case 3
            % this grid is a ECoG grid
                if(~isequal(obj.GridOnPlot,currGrid)||isempty(obj.GridOnPlot))
                    wb = waitbar(0,'Updating the 3D Brain Model...');
                    if(~isempty(obj.GridOnPlot))
                        if ishandle(obj.Slice3D)
                            delete(obj.Slice3D)
                        end
                        obj.plot3DModel();
                    end
                    
                    cmap = colormap(obj.Slice3D);
                    if strcmp(obj.CursorUpdate{1},'r')
                        cmap(end+1,:) = [0 1 0]; % Current Color
                        cmap(end+1,:) = [1 0 0];
                    elseif strcmp(obj.CursorUpdate{1},'g')
                        cmap(end+1,:) = [1 0 0]; % Current Color
                        cmap(end+1,:) = [0 1 0]; 
                    elseif strcmp(obj.CursorUpdate{1},'y')
                        cmap(end+1,:) = [0 1 0]; % Current Color
                        cmap(end+1,:) = [1 1 0];
                    end
                    
%                     plotBallsOn3DImage(obj.Slice3D,currGrid,length(cmap)-3,2); %length(cmap)-3 is red
                    plotBallsOn3DImage(obj.Slice3D,currGrid,length(cmap),2); 
                    obj.ChOnPlot = 0;
                    
                    %auto 3D model Rotate
                    centerGrid = mean(currGrid,1);
                    [azimuth,elevation] = cart2sph(centerGrid(1),centerGrid(2),centerGrid(3));
                    view(obj.Slice3D,azimuth*180/pi()+90,elevation*180/pi())
                    %camlight('headlight');
                    
                    set(obj.Slice3D,'Parent',obj);
                    if(isequal(obj.rotate3D,'on'))
                        %fix the rotate3d bug
                        box = obj.Parent;
                        hbox = box.Parent;
                        rotate3d off
                        rotate3d(obj.Slice3D)
                        hManager = uigetmodemanager(hbox.Parent);
                        hManager.CurrentMode.ModeStateData.textState = 0;
                        %fix end
                    end
                    waitbar(1,wb,'Complete');
                    delete(wb)
                else
                    cmap = colormap(obj.Slice3D);
                    if strcmp(obj.CursorUpdate{1},'r')
                        cmap(end+1,:) = [0 1 0]; % Current Color
                        cmap(end+1,:) = [1 0 0];
                    elseif strcmp(obj.CursorUpdate{1},'g')
                        cmap(end+1,:) = [1 0 0]; % Current Color
                        cmap(end+1,:) = [0 1 0];
                    elseif strcmp(obj.CursorUpdate{1},'y')
                        cmap(end+1,:) = [0 1 0]; % Current Color
                        cmap(end+1,:) = [1 1 0];
                    end
                    
%                     plotBallsOn3DImage(obj.Slice3D,obj.ChOnPlot,length(cmap)-3,2); %length(cmap)-3 is red
                    plotBallsOn3DImage(obj.Slice3D,obj.ChOnPlot,length(cmap),2);
                end
                
                cmap = colormap(obj.Slice3D);
                if strcmp(obj.CursorUpdate{1},'r')
                    cmap(end+1,:) = [0 1 0]; % Current Color
                    cmap(end+1,:) = [1 0 0]; 
                elseif strcmp(obj.CursorUpdate{1},'g')
                    cmap(end+1,:) = [1 0 0]; % Current Color
                    cmap(end+1,:) = [0 1 0]; 
                elseif strcmp(obj.CursorUpdate{1},'y')
                    cmap(end+1,:) = [0 1 0]; % Current Color
                    cmap(end+1,:) = [1 1 0];
                end
                colormap(obj.Slice3D,cmap);

%                 plotBallsOn3DImage(obj.Slice3D,currCh,length(cmap),2); %length(cmap) is green
                plotBallsOn3DImage(obj.Slice3D,currCh,length(cmap)-1,2); 
            end
            obj.GridOnPlot = currGrid;
            obj.ChOnPlot = currCh;
        end
        
        function plot3DModel(obj,~,~)
            [obj.Slice3D,obj.Slice3DErrorMessage] = brainModeler(obj.subjPath);
            if(isempty(obj.Slice3DErrorMessage))
                zoom(2)
                drawnow
                %set(obj.Slice3D,'Parent',obj);
                %zoom(2)
                % a very strange solution to color
%                 cmap = colormap(obj.Slice3D);
%                 cmap(end+1,:) = [0,0,0];
%                 cmap(end+1,:) = [1,1,0];
%                 cmap(end+1,:) = [0,1,0];
%                 colormap(obj.Slice3D,cmap);
                
                cmap = colormap(obj.Slice3D);
                if strcmp(obj.CursorUpdate{1},'r')
                    cmap(end+1,:) = [0 1 0]; % Current Color
                    cmap(end+1,:) = [1 0 0]; 
                elseif strcmp(obj.CursorUpdate{1},'g')
                    cmap(end+1,:) = [1 0 0]; % Current Color
                    cmap(end+1,:) = [0 1 0]; 
                elseif strcmp(obj.CursorUpdate{1},'y')
                    cmap(end+1,:) = [0 1 0]; % Current Color
                    cmap(end+1,:) = [1 1 0];
                end
                colormap(obj.Slice3D,cmap);
                plotBallsOn3DImage(obj.Slice3D,[0,0,0],length(cmap),0.1);
            end
        end
       
    end
end

