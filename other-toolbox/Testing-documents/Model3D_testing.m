%Testing presets for 3d modeling
addpath(genpath('./Major-programs'));
addpath(genpath('./Nifti-toolbox'));
addpath(genpath('./GUI Layout Toolbox'));
addpath(genpath('./other-toolbox/export_fig'));
addpath(genpath('./freesurfer-toolbox'));

subjPath= 'D:\NCAN_research\MRI_MATLAB\AMC097';
elecCell = electrodesFetch(subjPath);
v = figure('units','normalized','outerposition',[1/3 0 2/3 1],'color','k');
v.InvertHardcopy = 'off';
[axModel,axErrMsg] = brainModeler(subjPath);
if(isempty(axErrMsg))
drawnow
set(axModel,'Parent',v);
end
%{
for gridIndex = 1:size(elecCell,2)
    plotBallsOn3DImage(axModel,elecCell{1,gridIndex},[0,1,0],0.5);
end
%}

%input text annoation
x = [];
y = [];
z = [];
str = [];
t = [];
modelYLim = [axModel.YLim(1),axModel.YLim(2)];
ygap = (modelYLim(2)-modelYLim(1))/50;
    
hold(axModel,'on')
for gridIndex = 1:size(elecCell,2)
    electrodes = elecCell{1,gridIndex};
    x1 = electrodes(1,1);
    y1 = electrodes(1,2);
    z1 = electrodes(1,3);
    str1 = ["1"];
    
    %Connect all elcctrodes
    if (y1>0)
        ytag = modelYLim(2) + ygap;
        hAlign = 'right';
    else
        ytag = modelYLim(1) - ygap;
        hAlign = 'left';
    end
    plot3([x1;electrodes(:,1)],[ytag;electrodes(:,2)],[z1;electrodes(:,3)],'LineWidth',1.5);
    
    t = text(axModel,x1,y1,z1,str1,'HorizontalAlignment','center',...
        'FontWeight','bold','color','k','FontSize',12,'BackGroundColor','w');
    
    
    tt = text(axModel,x1,ytag,z1,elecCell{2,gridIndex},'BackGroundColor','w',...
                'HorizontalAlignment',hAlign);
    ygap = ygap + 1.5*length(elecCell{2,gridIndex});
    
    x = [x;electrodes(2:end,1)];
    y = [y;electrodes(2:end,2)];
    z = [z;electrodes(2:end,3)];
    str = [str;string(2:size(electrodes,1))'];
    t = text(axModel,x,y,z,str,'HorizontalAlignment','center',...
        'FontWeight','normal','color','k','FontSize',10,'BackgroundColor','w');
    
    %Connect all elcctrodes
    plot3([x1;electrodes(:,1)],[ytag;electrodes(:,2)],[z1;electrodes(:,3)],'LineWidth',1.5);
end
hold(axModel,'off')


alpha(axModel,0.75);
view(270,0)