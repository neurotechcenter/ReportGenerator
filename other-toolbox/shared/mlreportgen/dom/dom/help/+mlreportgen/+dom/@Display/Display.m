%mlreportgen.dom.Display CSS Display property
%    disp = Display() displays element as an inline element.
%
%    disp = Display('value') displays element as specified by the 'value'.
%           
%    See http://www.w3schools.com/cssref/pr_class_display.asp for the list
%    of valid CSS Display property values
%
%    List of values supported by HTML and DOCX reports are given below:
%
%    VALUE                   Applies to
%                           HTML    DOCX/PDF
%    'none'                  X        X
%    'inline'                X        
%    'block'                 X        
%    'flex'                  X        
%    'inline-block'          X        
%    'inline-flex'           X        
%    'inline-table'          X        
%    'list-item'             X        
%    'run-in'                X        
%    'table'                 X        
%    'table-caption'         X        
%    'table-column-group'    X        
%    'table-header-group'    X        
%    'table-footer-group'    X        
%    'table-row-group'       X        
%    'table-cell'            X        
%    'table-column'          X        
%    'table-row'             X        
%    'initial'               X        
%
%    Display properties:
%        Id    - Id of this object
%        Tag   - Tag of this object
%        Value - Defines CSS Display property value
%

%    Copyright 2015 The MathWorks, Inc.
%    Built-in class

%{
properties
    %Value CSS Display property value
    %   See http://www.w3schools.com/cssref/pr_class_display.asp for
    %   the list of valid CSS Display property values
    Value;
end
%}