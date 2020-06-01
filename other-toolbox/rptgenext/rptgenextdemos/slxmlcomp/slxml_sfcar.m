%% Compare and Merge Simulink Models Containing Stateflow
% This example shows how to view and merge the changes between two
% Simulink(R) models from the comparison report. You can view and merge the
% Simulink and Stateflow(R) differences in the resulting report. A 
% Stateflow(R) license is required to run this example.

% Copyright 2008-2019 The MathWorks, Inc.

%%
% This example shows you how to use the comparison report in MATLAB to
% understand what has changed between two different designs. Some
% development work has added a new "kickdown" mode to the shift logic. You
% can use the Simulink Model Comparison to compare the two models and
% produce a report for exploring and merging the differences.

%% Compare The Models
% Setup the example files by running the following command.
slxmlcomp.internal.examples.setupStateflowExample();
% Then use visdiff to compare the models.
visdiff('slxml_sfcar_1', 'slxml_sfcar_2');

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

%% Highlight Differences in the Simulink Models
% Click to select the tree node "Out1" in the right hand side tree.
% Observe the report highlights "Out1" in the report, and the corresponding 
% block in the model "slxml_sfcar_2".

%% Highlight Differences in a Stateflow Chart
% Now browse down the tree to locate the Stateflow charts in the report.
% Observe the Stateflow chart icon next to the "shift_logic" node. 
% Click "kickdown" in the right tree. The report displays both "shift_logic" 
% Stateflow charts.  Observe where the new "kickdown" functionality has 
% been added to one of the charts.

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

%% Merge Changes in Models Containing Stateflow 
% You can merge the changes between the two Simulink & Stateflow models 
% by clicking the 'Merge' button in the toolstrip.  This creates a third file,
% 'targetFile', which can contain the changes from either the left model or 
% right model.  To select which changes you would like in the target file 
% use the radio buttons in the right of the report.
% 
% Once you have selected the changes you want in the target model you can
% save these changes over the right model (slxml_sfcar_2) using the 
% 'Save File' toolstrip button.
%
% Note that in order for the tool to automatically connect merged transitions,
% you must merge states and junctions before transitions.

%% Further Information
%
% <matlab:helpview(fullfile(docroot,'toolbox','simulink','helptargets.map'),'compareslxmlfiles') Compare Simulink Models>


displayEndOfDemoMessage(mfilename)
