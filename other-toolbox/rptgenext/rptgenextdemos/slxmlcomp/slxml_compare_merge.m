%% Compare and Merge Simulink Models
% This example shows how to view and merge the changes between two
% Simulink(R) models from the comparison report.

% Copyright 2017-2019 The MathWorks, Inc.

%%
% This example shows you how to use the comparison report in MATLAB
% to understand what has changed between two different designs.
% An engineer has made some changes to the model slxml_aircraft1 and the
% resulting model is slxml_aircraft2.  The Simulink Model Comparison report
% will show you what these changes are and enable you to create another
% model containing changes from each of the two source models.

%% Compare The Models
% Setup the example files by running the following command.
slxmlcomp.internal.examples.setupCompareMergeExample();
% Then use visdiff to compare the models.
visdiff('slxml_aircraft1', 'slxml_aircraft2');

%% Understand The Results
% The Comparison Tool shows a report that only includes the differences
% between the two models, not the complete model hierarchies.
% 
% Colors indicate if items have been modified (purple items), inserted (blue items), 
% or deleted (yellow items).

%% Stepping Through Differences
% Use the "Next" and "Previous" navigation buttons on the Comparison tab
% to step through groups of changes in the report. When you do this to 
% select an item:
% 
% * The report highlights the corresponding item in the other tree (if it
%   exists)
% 
% * Both models display next to the report. The report highlights the 
%   corresponding item in the Simulink model, if possible.
% 
% You can control highlighting in the highlight toolstrip section.

%% Filtering Results
% You can control the type of changes displayed in the comparison report by 
% applying filters. To see the available filters, and whether or
% not they are applied to the current report, on the Comparison tab, in the
% Filter section, click the down arrow to expand the filter gallery. Click 
% filter names to toggle whether they are applied. In the Filter section, 
% click Show or Hide to control how the filters are applied.
%
% For example, some information in the Simulink model file is defined as
% being "nonfunctional". These are changes that are unlikely to change the
% behavior of the design. Nonfunctional items are hidden by default but you
% can show them by deselecting the 'Nonfunctional Changes' item in
% the list of 'Built-In Filters' when the 'Hide' filter toolstrip button is 
% selected.

%% Publish Results
% It is possible to create a document containing a record of the changes
% made to a Simulink model using the "Publish" toolstrip option.  Select
% the 'HTML' publish menu item to create an HTML report.  Microsoft Word(R)
% reports can also be created by using the 'Word' menu item.

%% Merge Changes in Simulink Models
% You can merge the changes between the two Simulink models by clicking the
% 'Merge' button in the toolstrip.  This creates a third file,
% 'targetFile', which can contain the changes from either the left model
% (slxml_aircraft1) or right model (slxml_aircraft2).  To select which
% changes you would like in the target file use the radio buttons in the
% right of the report.
% 
% Once you have selected the changes you want in the target model you can
% save these changes over the right model (slxml_aircraft2) using the 
% 'Save File' toolstrip button.
%
% Note that in order for the tool to automatically connect merged lines,
% you must merge blocks before lines.

%% Further Information
%
% <matlab:helpview(fullfile(docroot,'toolbox','simulink','helptargets.map'),'compareslxmlfiles') Compare Simulink Models>


displayEndOfDemoMessage(mfilename)
