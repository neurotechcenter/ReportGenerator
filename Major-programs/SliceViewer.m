classdef SliceViewer < uix.Grid
    %SLICEVIEWERCOMPONENT Summary of this class goes here
    %   Detailed explanation goes here
    properties (Access = public,SetObservable)
        Image
        ImageAlpha = 1
        Image2 = []
        Image2Alpha = 0.5
        
        ViewRotation = 0;
        SliderOrientation = 'west'  %north, west, south, east
        CursorPosition = [];
        Slice =1
        CursorChangedFcn = [];
        SliceChangedFcn = [];
        ViewAxis = [1 2 3];
        SliderVisible= 'on'
        ClimUpdate = [];
        Marker = {'r','cross'}
    end
    properties (Access = protected)
        slider
        imageView
        currCursor = []
        posText=[]
        silentChange = false
        imageObj
        image2Obj
        displayUpdated = true
        
    end
    
    methods
        
        function obj=SliceViewer(varargin)
            obj.slider=uicontrol('Parent', obj,'Style', 'slider','Units','normalized','Min',1,'Max',2,'Value',1);
            addlistener(obj.slider, 'Value', 'PreSet',@obj.sliderChanged);
            obj.imageView=axes('Parent',obj,'Units','normalized','Color','k');
            axis(obj.imageView,'fill')
            addlistener(obj,'Image','PostSet',@obj.imageChanged);
            addlistener(obj,'Image2','PostSet',@obj.imageChanged);
            
            addlistener(obj,'ImageAlpha','PostSet',@obj.alphaChanged);
            addlistener(obj,'Image2Alpha','PostSet',@obj.alphaChanged);
            addlistener(obj,'SliderVisible','PostSet',@obj.sliderVisibilityChanged);
            
            addlistener(obj,'CursorPosition','PostSet',@obj.cursorPosChanged);
            addlistener(obj,'SliderOrientation','PostSet',@obj.SliderOrientationChanged);
            addlistener(obj,'Slice','PostSet',@obj.SliceChanged);
            addlistener(obj,'ClimUpdate','PostSet',@obj.DisplayChanged);
            addlistener(obj,'Marker','PostSet',@obj.DisplayChanged);
            obj.SliderOrientationChanged();
            obj.slider.Value=obj.Slice;
            %remove borders from axis
            set(obj.imageView,'units','pixels'); % set the axes units to pixels
            x = get(obj.imageView,'position'); % get the position of the axes
            set(obj.imageView,'units','pixels'); % set the figure units to pixels
            y = get(obj.imageView,'position'); % get the figure position
            set(obj.imageView,'position',[y(1) y(2) x(3) x(4)]);% set the position of the figure to the length and width of the axes
            set(obj.imageView,'units','normalized','position',[0 0 1 1]); % set the axes units to pixels
            
            axis(obj.imageView,'square');
            try
                uix.set( obj, varargin{:} )
            catch e
                delete( obj )
                e.throwAsCaller()
            end
            
            
        end
        
    end
    methods (Access = protected)
        
        function alphaChanged(obj,~,~)
            if(~isempty(obj.imageObj) && isvalid(obj.imageObj))
                alpha(obj.imageObj,obj.ImageAlpha);
            end
            if(~isempty(obj.image2Obj) && isvalid(obj.image2Obj))
                alpha(obj.image2Obj,obj.Image2Alpha);
            end
        end
        
        function redrawImage(obj,redrawType)
            %%
            %redaw type= 0 -> redraw everything
            %redraw type= 1 -> only refresh and keep axis the same (faster, but doesnt resize)
            if(obj.silentChange)
                return;
            end
            if(~exist('redrawType','var'))
                redrawType=0;
            end

            %  disp(['redraw type ' num2str(redrawType)]);
            switch redrawType
                
                case 0
                    % cla(obj.imageView,'reset');
                    % hold(obj.imageView,'off');
                    if(~isempty(obj.Image))
                        origin=(obj.Image.hdr.hist.originator(1:3));
                        voxel_size = abs(obj.Image.hdr.dime.pixdim(2:4));
                        z=round(obj.Slice/voxel_size(obj.ViewAxis(3)) +origin(obj.ViewAxis(3)));
                        i=permute(obj.Image.img,obj.ViewAxis);
                        X=((1:size(i,1))-origin(obj.ViewAxis(1))).*voxel_size(obj.ViewAxis(1));
                        Y=((1:size(i,2))-origin(obj.ViewAxis(2))).*voxel_size(obj.ViewAxis(2));
                        
                        if(z < 1 || z > size(i,3)) %if there is nothing to show, show black
                            obj.imageObj=imagesc(obj.imageView,'XData',X,'YData',Y,'CDATA',zeros(length(X),length(Y)),'ButtonDownFcn',@obj.click,'Clipping','off',[0 1]);
                        else
                            obj.imageObj=imagesc(obj.imageView,'XData',X,'YData',Y,'CDATA',squeeze(i(:,:,z,:))','ButtonDownFcn',@obj.click,'Clipping','off');
                        end
                        alpha(obj.imageObj,obj.ImageAlpha);
                        
                        colormap(obj.imageView,gray);
                        hold(obj.imageView,'on');
                    else
                        obj.imageObj=[];
                    end
                    
                    if(~isempty(obj.Image2))
                        origin=(obj.Image2.hdr.hist.originator(1:3));
                        voxel_size = abs(obj.Image2.hdr.dime.pixdim(2:4));
                        z=round(obj.Slice/voxel_size(obj.ViewAxis(3)) +origin(obj.ViewAxis(3)));
                        i=permute(obj.Image.img,obj.ViewAxis);
                        X=((1:size(i,1))-origin(obj.ViewAxis(1))).*voxel_size(obj.ViewAxis(1));
                        Y=((1:size(i,2))-origin(obj.ViewAxis(2))).*voxel_size(obj.ViewAxis(2)); 
                        if(z < 1 || z > size(i,3)) %if there is nothing to show, show black
                            obj.image2Obj=imagesc(obj.imageView,'XData',X,'YData',Y,'CDATA',zeros(length(X),length(Y)),'ButtonDownFcn',@obj.click,'Clipping','off',[0 1]);
                        else
                            obj.image2Obj=imagesc(obj.imageView,'XData',X,'YData',Y,'CDATA',squeeze(i(:,:,z,:))','ButtonDownFcn',@obj.click,'Clipping','off');
                        end
                        alpha(obj.image2Obj,obj.Image2Alpha);
                        hold(obj.imageView,'on');
                        
                    else
                        obj.image2Obj=[];
                    end
                    
                case 1
                    if(~isempty(obj.Image) && ~isempty(obj.imageObj))
                        origin=(obj.Image.hdr.hist.originator(1:3));
                        voxel_size = abs(obj.Image.hdr.dime.pixdim(2:4));
                        z=round(obj.Slice/voxel_size(obj.ViewAxis(3)) +origin(obj.ViewAxis(3)));
                        i=permute(obj.Image.img,obj.ViewAxis);
                        if(~(z < 1 || z > size(i,3)))
                            set(obj.imageObj,'CData',squeeze(i(:,:,z,:))');
                        end
                    end
                    if(~isempty(obj.Image2)  && ~isempty(obj.image2Obj))
                        origin=(obj.Image2.hdr.hist.originator(1:3));
                        voxel_size = abs(obj.Image2.hdr.dime.pixdim(2:4));
                        z=round(obj.Slice/voxel_size(obj.ViewAxis(3)) +origin(obj.ViewAxis(3)));
                        i=permute(obj.Image2.img,obj.ViewAxis);
                        if(~(z < 1 || z > size(i,3)))
                            set(obj.image2Obj,'CData',squeeze(i(:,:,z,:))');
                        end
                    end
                    
                otherwise
                    error('unknown refresh type');
            end
            l='XYZ';
            %xlabel(obj.imageView,l(obj.ViewAxis(1)));
            %ylabel(obj.imageView,l(obj.ViewAxis(2)));
            set(obj.imageView,'YDir','normal');
            if(obj.ViewAxis(1) == 1)
                set(obj.imageView,'XDir','reverse');
            end
            set(obj.imageView,'xtick',[])
           set(obj.imageView,'ytick',[])
            axis(obj.imageView,'equal');
            xlim(obj.imageView,'auto')
            ylim(obj.imageView,'auto')
            set(obj.imageView,'Color','k')
            %Change the contrast of image.
            if(~obj.displayUpdated)
                obj.imageView.CLim = obj.ClimUpdate;
            end
            
            if(~isempty(obj.CursorPosition))
                if(~isempty(obj.currCursor))
                    delete(obj.currCursor);
                    
                    obj.currCursor=[];
                end
                if(~isempty(obj.posText))
                    delete(obj.posText)
                    obj.posText=[];
                end
                
                if(obj.CursorPosition(obj.ViewAxis(3)) == obj.Slice)
                    hold(obj.imageView,'on')
                    if(isequal(obj.Marker{2},'cross')) 
                        obj.currCursor=scatter(obj.imageView,obj.CursorPosition(obj.ViewAxis(1)),obj.CursorPosition(obj.ViewAxis(2)),200,...
                            ['+',obj.Marker{1}],'LineWidth',1.5);
                    else
                        obj.currCursor=scatter(obj.imageView,obj.CursorPosition(obj.ViewAxis(1)),obj.CursorPosition(obj.ViewAxis(2)),[],...
                            obj.Marker{1},'filled');
                    end
                    obj.posText=text(obj.imageView,0,...
                        0.05,...
                        ['  X: ' num2str(obj.CursorPosition(1),'%4.1f') '     Y: '...
                        num2str(obj.CursorPosition(2),'%4.1f') '      Z: '...
                        num2str(obj.CursorPosition(3),'%4.1f')],...
                        'Color','white','Units','normalized','FontSize',13);
                    hold(obj.imageView,'off');
                end
            end
            
            % disp('Redraw');
        end
        
        function SliceChanged(obj,~,~)
            if(~isempty(obj.SliceChangedFcn) && ~obj.silentChange)
                obj.SliceChangedFcn(obj,obj.Slice);
            end
            if(obj.slider.Value ~=obj.Slice)
                if(obj.Slice > obj.slider.Max)
                    obj.slider.Value=obj.slider.Max;
                elseif(obj.Slice < obj.slider.Min)
                    obj.slider.Value=obj.slider.Min;
                else
                    obj.slider.Value=obj.Slice;
                end
            end
            obj.redrawImage(1);
        end
        
        function cursorPosChanged(obj,~,~)
            obj.silentChange=true;
            obj.Slice=obj.CursorPosition(obj.ViewAxis(3));
            obj.silentChange=false;
            obj.redrawImage(1);
        end
        
        
        function click(obj,~,eventdata)
            cp=([(eventdata.IntersectionPoint([1 2])) obj.Slice]);
            [~,o_order]=sort(obj.ViewAxis);
            obj.CursorPosition=cp(o_order);
            %disp(obj.CursorPosition);
            if(~isempty(obj.CursorChangedFcn))
                obj.CursorChangedFcn(obj, obj.CursorPosition);
            end
            
        end
        
        function sliderChanged(obj,~,~)
            
            if(~obj.silentChange)
                obj.Slice=obj.slider.Value;
            end
        end
        
        function imageChanged(obj,~,~)
            delete(obj.imageView.Children);
            obj.silentChange = true;
            z_axis=obj.ViewAxis(3);
            z_min=[];
            z_max=[];
            if(~isempty(obj.Image))
                img_size=size(obj.Image.img);
                img_size=permute(img_size,[2 1 3]); %swap to X Y Z
                z_min=(1-obj.Image.hdr.hist.originator(z_axis)).*obj.Image.hdr.dime.pixdim(z_axis+1);
                z_max=(img_size(z_axis)-obj.Image.hdr.hist.originator(z_axis)).*obj.Image.hdr.dime.pixdim(z_axis+1);
            end
            z_min2=[];
            z_max2=[];
            if(~isempty(obj.Image2))
                img_size=size(obj.Image2.img);
                img_size=permute(img_size,[2 1 3]); %swap to X Y Z
                z_min2=(1-obj.Image2.hdr.hist.originator(z_axis)).*obj.Image2.hdr.dime.pixdim(z_axis+1);
                z_max2=(img_size(z_axis)-obj.Image2.hdr.hist.originator(z_axis)).*obj.Image2.hdr.dime.pixdim(z_axis+1);
            end
            warning off
            obj.slider.Min=min([z_min z_min2]);
            obj.slider.Max=max([z_max z_max2]);
            
            obj.slider.SliderStep=[1/(obj.slider.Max-obj.slider.Min) , 10/(obj.slider.Max-obj.slider.Min) ];
            if(obj.Slice >= obj.slider.Max )
                obj.Slice = obj.slider.Max;
                obj.slider.Value = obj.slider.Max;
            end
            if(obj.Slice <= obj.slider.Min )
                obj.Slice = obj.slider.Min;
                obj.slider.Value = obj.slider.Min;
            end
            warning on
            obj.silentChange = false;
            obj.redrawImage(0);
        end
        
        function sliderVisibilityChanged(obj,~,~)
            obj.slider.Visible=obj.SliderVisible;
        end
        
        function SliderOrientationChanged(obj,~,~)
            
            switch(validatestring(obj.SliderOrientation,{'north','west','south','east'}))
                
                case {'north'}
                    if(obj.Children == [obj.imageView; obj.slider])
                        obj.reorder([2 1]);
                    end
                    obj.Widths=[-1];
                    obj.Heights=[20 -1];
                case {'east'}
                    if(obj.Children == [obj.slider; obj.imageView])
                        obj.reorder([2 1]);
                    end
                    obj.Widths=[-1 20];
                    obj.Heights=[-1];
                case {'south'}
                    if(obj.Children == [obj.slider; obj.imageView])
                        obj.reorder([2 1]);
                    end
                    obj.Widths=[-1];
                    obj.Heights=[-1 20];
                case {'west'}
                    if(obj.Children == [obj.imageView; obj.slider])
                        obj.reorder([2 1]);
                    end
                    obj.Widths=[20 -1];
                    obj.Heights=[-1];
                otherwise
                    error('Unknown orientation');
                    
            end
            
        end
        
        function DisplayChanged(obj,~,~)
            obj.displayUpdated = false;
            obj.redrawImage(0);
            obj.displayUpdated = true;
        end
        
        
    end
    
end

