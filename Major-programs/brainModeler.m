function [axModel,errormessage] = brainModeler(subjPath,axIn)
addpath(genpath('./freesurfer-toolbox'));
pathToLhPial=fullfile(subjPath,'/IMAGING/segmentation/surf/lh.pial');
pathToRhPial=fullfile(subjPath,'/IMAGING/segmentation/surf/rh.pial');
%% error fetching
errormessage = [];
try
    xfrm_matrices=importdata(fullfile(subjPath,'/IMAGING/MATLAB/xfrm_matrices'));
catch e
    errormessage = [errormessage,...
        sprintf('---Missing transformation matrices [xfrm_matrices] in path: \n\t%s\n\n',...
        fullfile(subjPath,'/IMAGING/MATLAB/'))];
end
try
    [LHtempvert, LHtemptri] = read_surf(pathToLhPial);
    [RHtempvert, RHtemptri] = read_surf(pathToRhPial);
catch e
    errormessage = [errormessage,...
        sprintf('---Missing 3d model file [lh/rh.pial] in path: \n\t%s\n\n',...
        fullfile(subjPath,'/IMAGING/segmentation/surf/'))];
end
try
    [~,llabel,lct]=read_annotation(fullfile(subjPath,'/IMAGING/segmentation/label/lh.aparc.annot'));
    [~,rlabel,rct]=read_annotation(fullfile(subjPath,'/IMAGING/segmentation/label/rh.aparc.annot'));
catch e
    errormessage = [errormessage,...
        sprintf('---Missing annotation file [lh/rh.aparc.annot] in path: \n\t%s\n\n',...
        fullfile(subjPath,'/IMAGING/segmentation/label/'))];
end   


if(isempty(errormessage))
     %% 3D modeling
    vox2ras = xfrm_matrices(1:4, :);
    vox2rastkr = xfrm_matrices(5:8, :);

    % [~,vox2ras]=system(['mri_info --vox2ras ' fullfile(segmentationFolder,'SUBJECT','')] );
    % [~,vox2rastkr]=system(['mri_info --vox2ras-tkr ' fullfile(segmentationFolder,'SUBJECT','')] );%3d model is in ras-tkr format, we want RAS coordinates

    tkr2ras=vox2ras*inv(vox2rastkr);
    %[LHtempvert, LHtemptri] = read_surf(pathToLhPial);
    %[RHtempvert, RHtemptri] = read_surf(pathToRhPial);

    cortex.vert=[LHtempvert; RHtempvert];
    cortex.vert=(tkr2ras*[cortex.vert(:,1), cortex.vert(:,2), cortex.vert(:,3), ones(size(cortex.vert, 1), 1)]')';
    cortex.vert=cortex.vert(:,1:3);
    LHtemptri = LHtemptri + 1;
    RHtemptri = RHtemptri + 1; %Freesurfer indexing from 0, mat from 1.

    adjustedRHtemptri = RHtemptri + size(LHtempvert, 1);
    cortex.tri = [LHtemptri; adjustedRHtemptri];

    Project.Model=cortex;
    %[~,llabel,lct]=read_annotation(fullfile(subjPath,'/IMAGING/segmentation/label/lh.aparc.annot'));
    %[~,rlabel,rct]=read_annotation(fullfile(subjPath,'/IMAGING/segmentation/label/rh.aparc.annot'));
    %lhtri=lhtri+1;
    %rhtri=rhtri+1+size(lhtri,1);
    names=[lct.struct_names(:)' rct.struct_names(:)'];
    identifiers=[lct.table(:,5); rct.table(:,5)];
    u_identifiers=unique(identifiers);
    colortable=[lct.table(:,1:3); rct.table(:,1:3)]/255;
    u_colortable=zeros(numel(u_identifiers),3);
    for i=1:length(u_identifiers)
        u_colortable(i,:)=colortable(find(identifiers == u_identifiers(i),1),:);
    end

    Project.Annotation=[llabel; rlabel];
    Project.AnnotationLabel=struct('Name',uniqueStrCell(names)','Identifier',num2cell(u_identifiers),'PreferredColor',num2cell(u_colortable,2));

    
end



if(~isempty(errormessage))
    matfile=fullfile(subjPath,'/IMAGING/brain.mat');
    if(exist(matfile,'file'))
        load(matfile,'cortex','annotation','annotationlabel');
        Project.Model=cortex;
        Project.Annotation=annotation;
        Project.AnnotationLabel=annotationlabel;
        errormessage=[];
    else
        errormessage = [errormessage,'Please check and reorganize your subject folder'];
        axModel = gobjects;
        return;
    end
end
cmap=zeros(numel(Project.AnnotationLabel)+2,3);
annotation_remap=zeros(size(Project.Annotation));
for i=1:length(cmap)-2
    cmap(i,:)=Project.AnnotationLabel(i).PreferredColor;
    annotation_remap(Project.Annotation == Project.AnnotationLabel(i).Identifier)=i;

end
%making no annotation part grey
annotation_remap(Project.Annotation == 0)=length(cmap)-1; %grey
cmap(end-1,:)=[75 75 75]/255;

cmap(end,:)=[1 0 0]'; %electrode color
if(nargin < 2)
    axModel = axes('Color','k');
else
    axModel=axIn;
end
axis(axModel,'fill')
settings={'CDataMapping', 'direct','linestyle', 'none','FaceLighting','gouraud','BackFaceLighting','unlit','AmbientStrength',1};

trisurf(Project.Model.tri, Project.Model.vert(:, 1), Project.Model.vert(:, 2), Project.Model.vert(:, 3),annotation_remap,'Parent',axModel,settings{:});

colormap(axModel,cmap);
light(axModel,'Position',[1 0 0],'Style','local');
%light(axModel,'Position',[-1 0 0]);

%camlight('headlight');
material(axModel,'dull');
%{
StripInfo = electrodesFetch(subjPath);
Project.ElectrodePositions = StripInfo{1,gridNumber};
if(~isempty(Project.ElectrodePositions))
    plotBallsOn3DImage(axModel,Project.ElectrodePositions,length(cmap),2);
end
%}
set(axModel,'AmbientLightColor',[1 1 1])
%zoom(axModel,'on');
%customRotate3d(axModel,'on');
%rotate3d(axModel);

%%%%%%%%%%% James added to answer questions for Harsh... not working yet
% alpha(axModel,0.5);
% for i = 1:size(Project.AnnotationLabel,1)
%     labels{i} = getfield(Project.AnnotationLabel,{i},'Name');
% end
% cbar = colorbar(axModel,'Ticks',(1:size(labels,2))+0.5,'TickLabels',labels,'FontSize',12,'Color','w');
% cbar.TickLabelInterpreter = 'none';
%%%%%%%%%%%

set(axModel,'xtick',[]);
set(axModel,'ytick',[]);
axis(axModel,'equal');
axis(axModel,'off');
%axis(axModel,'on');
xlim(axModel,'auto');
ylim(axModel,'auto');
set(axModel,'Color','k');
set(axModel,'clipping','off');
set(axModel,'XColor', 'none','YColor','none','ZColor','none')
%{
%examination mode
axis(axModel,'on');
xlabel('x axis')
ylabel('y axis')
zlabel('z axis')
%}
end
