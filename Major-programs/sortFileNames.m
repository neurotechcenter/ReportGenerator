%subfunction of SubjectReportGenerator
function sortedF = sortFileNames(F)
intermStr = cell(1,numel(F));
for fIndex = 1:numel(F)
    occur = strfind(F{fIndex},'_');
    if size(occur) == 0
        intermStr(fIndex) = {''};
    else
        intermStr(fIndex) = {extractBefore(F{fIndex},occur(1))};
    end  
end
[~, reindex] = sort(str2double(intermStr));
sortedF = F(reindex);
end