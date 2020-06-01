%% Resolve Conflicts with Simulink Three-Way Merge
% This example shows you how to use Simulink(R) Three-Way Merge to
% resolve conflicts in Simulink models. You can view and merge the
% Simulink model differences in the resulting report.

%   Copyright 2015-2017 The MathWorks, Inc.


%% Simulink Model Changes in This Example
% This example shows you how to use Three-Way Merge to understand and
% resolve the differences between two conflicting Simulink design changes.
% The example Simulink project is under source control (Git in this
% example) and contains changes which conflict with another user's. You
% will use the Three-Way Model Merge tool to resolve the conflicts. You
% will examine your local file ("Mine"), the conflicting revision
% ("Theirs") and the common ancestor of these two files ("Base").
%
% The conflict in this example was caused by the current user trying to
% merge the changes of another user on the master Git branch (the 'Theirs'
% changes) into their Task1 branch (containing the "Mine" changes).
%
% *Theirs*: The pilot model subsystem was updated to use an explicit gain
% block for the amplitude of the pilot's input commands. The Simulation
% stop time was also updated.
%
% *Mine*: The current user changed some configuration settings for the
% model.
%
% The Merge tool automatically merges nonconflicted differences. Follow the
% steps below to review the automerge choices, edit if desired, and decide
% how to resolve any remaining differences. This will then allow you to
% commit the resolved model to source control.


%% Set Up Example Simulink Project
% Run the following commands to create and open the project.
slxmlcomp.internal.examples.setupThreeWayMergeExample();

%% Open Simulink Three-Way Merge
% Look for conflicted files in the Simulink Project files view. The
% slproject_f14 file shows a red warning symbol in the Git column, which
% indicates a conflict. 
%
% 1. To see a detailed report of the conflicts,
% right-click the slproject_f14 file and select 'View Conflicts'.
%

%% View Changes
% The Three-Way Merge tool shows the changes to the two Simulink
% designs that have caused this file conflict.
%
% <<threeWayMergeExample.png>>
%
% * At the top, Theirs, Base and Mine trees show the differences between
% the conflicting revision, your revision, and the base ancestor of these
% files.
% * Underneath, the Target area shows the file that you will merge changes
% into. This is a temporary file and will be copied into the Simulink
% project when you choose to accept the merge result.
%
% 2. Examine a difference by clicking a row in one of the trees. The merge
% tool displays the change for each model in an editor, for example the
% Simulink Editor or Configuration Parameters dialog box, to the right of
% the Three-Way Merge window.
% 
% 3. Choose the models to display with the toolstrip buttons on the Merge
% tab, in the Highlight section: Top Model or Bottom Model.


%% Review Automatic Merges 
%
% The merge tool automatically merges most nonconflicted differences.
%
% 4. Examine the first change at the top of the 'Theirs' tree by clicking
% the row called 'PilotGain'.  This node has been merged
% automatically and you can adjust the automatic choices using the radio
% buttons in the target pane. If you want, review the other automatic merge
% choices.
%
%
%% Resolve Conflicts
% 
% There are two types of difference that require user action.
% 
% *Conflict*: The merge tool cannot automatically resolve these differences
% and you need to choose which design you want in the target file. Look for
% warnings in the Conflicts column.
%
% *Manual merge*: Some differences must be merged manually in Simulink or
% ignored. In the Target pane, these items are indicated by an icon with a
% pencil in the Conflicts column.
%
% 5. Select the 'StickCommand_rad' row. This difference requires a manual
% merge, indicated by a pencil on the icon in the Conflicts column.
%
% Resolve the line change difference in the target file by renaming the
% line connected to the output of the block named 'Pilot' in the Simulink
% Editor from 'StickCommand_rad' to 'Pilot Output'.
% 
% After resolving the difference save the changes in the Editor, and mark
% the change resolved using the manual merge control in the Conflicts
% column.
% 
% Note - the merge report does not update to show any changes you make in
% the Editor.
%
% 6. Use the 'Next' toolstrip button to review and resolve the changes
% until you reach a conflict. This StopTime parameter has been changed by
% both users and is conflicted. Resolve the conflict using the 'Mine'
% change. Select the 'Mine' radio button next to StopTime in the Target
% pane.
% 

%% Change Filters
% By default the report hides all nonfunctional changes, such as the
% repositioning of items.
%
% 7. Turn off filters using the Filters toolstrip section to explore all
% the differences between these designs.

%% Accept Changes
% 8. After you resolve all filtered and unfiltered changes, click 'Accept &
% Close'.
% The merge tool closes the report and the models, accepts the merge result
% in the target file, and marks the conflict as resolved in the source
% control tool (Git in this example). Resolved conflicts make it possible
% to commit changes to source control and continue your work.


displayEndOfDemoMessage(mfilename)