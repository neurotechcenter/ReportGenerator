%subfunction of SubjectReportGenerator.m
%This function reads the imaging file from the subject, and align
%the 3D image into the RAS coordinate.
%The output nii file will then be fed into the Sliceviewer3D.
%
%Two subject layouts are supported:
%  1. Legacy: a ready-made Analyze/NIfTI file under IMAGING/NIfTI/MRI/*.img
%  2. FreeSurfer recon-all output: IMAGING/segmentation/mri/orig.mgz
%The FreeSurfer volume is converted to a temporary NIfTI file (via
%MRIread/MRIwrite from the freesurfer-toolbox) and then run through the
%same load_nii/reslice_nii path already used for the legacy .img files,
%so the resulting struct's geometry (hdr.hist.originator, hdr.dime.pixdim)
%is derived the same way for both layouts.
function nii = niiGene(folder)
%% Locate the subject's structural MRI
niftiFile = findLegacyNifti(folder);
mgzFile = '';
if isempty(niftiFile)
    mgzFile = fullfile(folder,'IMAGING','segmentation','mri','orig.mgz');
    if ~(exist(mgzFile,'file')==2)
        mgzFile = '';
    end
end

if isempty(niftiFile) && isempty(mgzFile)
    [~,subj] = fileparts(folder);
    errordlg(sprintf(['***Please double check if [ %s ] is your subject folder (ex. AMC092), and if so, \n',...
        'we did not find a valid imaging file under your subject directory: \n\n\t%s\n\n',...
        'Please reorganize your imaging files into one of the following : \n\n\t%s\n\t%s\n\n'],...
        subj,folder,...
        fullfile(subj,'IMAGING','NIfTI','MRI','your_imaging_file.img'),...
        fullfile(subj,'IMAGING','segmentation','mri','orig.mgz')),'Could not find imaging file');
    nii = struct();
    return
end

%% Convert a FreeSurfer volume to NIfTI so it can share the loading path below
if isempty(niftiFile)
    mri = MRIread(mgzFile);
    if isempty(mri)
        errordlg(sprintf('Failed to read the FreeSurfer volume:\n\n\t%s',mgzFile),...
            'Could not read imaging file');
        nii = struct();
        return
    end
    niftiFile = [tempname,'.nii'];
    writeErr = MRIwrite(mri,niftiFile);
    if writeErr
        errordlg(sprintf('Failed to convert the FreeSurfer volume to NIfTI:\n\n\t%s',mgzFile),...
            'Could not read imaging file');
        nii = struct();
        return
    end
end

try
    nii=load_nii(niftiFile,[],[],[],[],[],0);
   % [nii.img,nii.XYZ ]=spm_read_vols(nii);
catch e
    %warning 'Input image transformation is not orthogonal; reslicing image'
    reslice_nii(niftiFile,fullfile(fileparts(niftiFile),'buff.nii'));
    nii=load_nii(fullfile(fileparts(niftiFile),'buff.nii'));
end
end

function niftiFile = findLegacyNifti(folder)
niftiFile = '';
nifti = dir(fullfile(folder,'IMAGING','NIfTI','MRI','*.img')); %*****

% remove . files from list
remidx = [];
iter = 1;
for i = 1:size(nifti,1)
    if contains(nifti(i).name,'._')
        remidx(iter) = i;
        iter = iter + 1;
    end
end
nifti(remidx) = [];
clear iter i remidx

if isempty(nifti)
    return
end

folderPath = nifti(1).folder;
niftiName = nifti(1).name;
if(size(nifti,1)~=1)
    niftiName = uigetfile('*.img','Please select the desired nifti file',folderPath);
    if(~ischar(niftiName))
        errordlg('No nifti (.img) file was selected.');
        return
    end
end

niftiFile = fullfile(folderPath,niftiName);
end
