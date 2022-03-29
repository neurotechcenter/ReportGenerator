%subfunction of SubjectReportGenerator.m
%This function takes a .dat file's electrode coordinates in RAS system with
%its file name and store them in a 2 by 1 cell.
%The function will then scan throught the entire Electrodes folder and
%concatenate all the electrode cell to a 2 by n cell -- elecCell. 
function elecCell = electrodesFetch(folder)
electrodesDir = dir(fullfile(folder,'/IMAGING/Electrodes/*.dat'));%*****
%Error check: is the electrode file in the right directory
if (isempty(electrodesDir))
    [~,subj] = fileparts(folder);
    errordlg(sprintf(['***Please double check if [ %s ] is your subject folder (ex. AMC092), and if so, \n',...
        'we found valid electrode files in one or more subfolders of your subject directory: \n\n\t%s\n\n',...
        'In order to fetch correct electodes, ',...
        'please reorganize your subfolders into the following format : \n\n\t%s\n\n'],...
        subj,folder,...
        fullfile(subj,'/IMAGING/Electrodes/your_electrode.dat')),'Could not find electrode file');
    elecCell = {};
    return
end
fileNamesUnsorted = {electrodesDir.name};
fileNames = sortFileNames(fileNamesUnsorted);
idx=strcmp(fileNames,'elecPointSet.dat'); %ignore pointSet file
fileNames(idx)=[];
elecCell = cell(2,length(fileNames));

for fileIndex = 1:length(fileNames)
    
% dat to mat

    electrodesFileName = [fullfile(folder,'/IMAGING/Electrodes/'),fileNames{fileIndex}];%*****
    [~,file_Name] = fileparts(electrodesFileName);

    justName = strrep(file_Name,'_',' ');
    electrodesFileID = fopen(electrodesFileName);

    % Skip to number of electrodes and store it
    fscanf(electrodesFileID, '%f');
    numberOfElectrodes = fscanf(electrodesFileID, '%*s \n %*s %u');

    elecMatrix = zeros(numberOfElectrodes, 3);

    fclose(electrodesFileID);
    electrodesFileID = fopen(electrodesFileName);

    for electrodeNumber = 1:numberOfElectrodes
        elecMatrix(electrodeNumber, :) = transpose(fscanf(electrodesFileID, '%f', 3));
    end
    if(~isempty(elecMatrix))
    elecCell(1,fileIndex) = {elecMatrix};
    elecCell(2,fileIndex) = {justName};
    end
    fclose(electrodesFileID);
end
remain = ~cellfun('isempty',elecCell);
top = elecCell(1,:);
bot = elecCell(2,:);
elecCell = [top(remain(1,:));bot(remain(2,:))];
end