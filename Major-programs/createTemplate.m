%Need MATLAB report generater.
%This function is not involved in the SubjectReportGenerator pipeline. 
%This function creates the SubjectReport-template file just in case you
%loss it. 
import mlreportgen.ppt.*;

slidesFile = 'SubjectReport-template.pptx';
slides = Presentation('SubjectReport-template');

open(slides);

close(slides);

if ispc
    winopen(slidesFile);
end