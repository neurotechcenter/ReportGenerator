%subfunction of SubjectReportGenerator.m
%This function reads the imaging file (.img) from the subject, and align
%the 3D image into the RAS coordinate. 
%The output nii file will then be fed into the Sliceviewer3D. 
function nii = niiGene(folder)
%% Transforming nifti
nifti = dir(fullfile(folder,'/IMAGING/NIfTI/MRI/*.img')); %*****

% remove . files from list
iter = 1;
for i = 1:size(nifti,1)
    if contains(nifti(i).name,'._')
        remidx(iter) = i;
        iter = iter + 1;
    end
end
nifti(remidx) = [];
clear iter i remidx

%Error check: is the electrode file in the right directory
if (isempty(nifti))
    [~,subj] = fileparts(folder);
    errordlg(sprintf(['***Please double check if [ %s ] is your subject folder (ex. AMC092), and if so, \n',...
        'We found valid nifti files under your subject directory: \n\n\t%s\n\n',...
        'Please reorganize the nifti files into the following directory : \n\n\t%s\n\n'],...
        subj,folder,...
        fullfile(subj,'/IMAGING/NIfTI/MRI/your_imaging_file.img')),'Could not find nifti file');
    nii = struct();
    return
end

folderPath = nifti.folder;
niftiName = nifti.name;
if(size(nifti,1)~=1)
    niftiName = uigetfile('*.img','Please select the desired nifti file',folderPath);
    if(~ischar(niftiName))
        errordlg('No nifti (.img) file was selected.');
        nii = struct();
        return
    end
end

niftifile=fullfile(folderPath,niftiName);
try
    nii=load_nii(niftifile,[],[],[],[],[],0);
   % [nii.img,nii.XYZ ]=spm_read_vols(nii);
catch e
    %warning 'Input image transformation is not orthogonal; reslicing image'
    reslice_nii(niftifile,fullfile(folderPath,'buff.nii'));
    nii=load_nii(fullfile(folderPath,'buff.nii'));
end
end