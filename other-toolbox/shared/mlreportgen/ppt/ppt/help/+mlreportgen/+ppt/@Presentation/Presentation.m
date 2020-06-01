%mlreportgen.ppt.Presentation Create a PPT presentation
%
%    doc = Presentation() creates a presentation named 'Untitled.pptx' in 
%    the current directory.
%
%    doc = Presentation(docpath) creates a presentation at the specified 
%    location.
%
%    doc = Presentation(docpath, templatepath) creates a presentation at 
%    docpath, using the PowerPoint template at templatepath location.
%    If docpath and templatepath specify the same presentation, the PPT
%    API will use the presentation as a template for itself, thereby
%    allowing you to update the presentation. The updated presentation
%    replaces the original.
%
%    Presentation methods:
%        add                    - Add new Slide to this presentation
%        close                  - Close this presentation
%        find                   - find objects by property Name value    
%        open                   - Open this presentation    
%
%    Presentation properties:
%        Children           - Content of this presentation
%        Id                 - Id of this presentation
%        OutputPath         - Path of presentation's output directory
%        Tag                - Tag of this presentation
%        TemplatePath       - Path of this presentation's template

%    Copyright 2015 Mathworks, Inc.

%{
properties

     %OutputPath Path of presentation's output file
     %     You do not specify the file's extension
     %     You cannot set this property once the
     %     presentation has been opened.
     OutputPath;

     %TemplatePath Path of this presentation's template
     %     Path of the PowerPoint template for this presentation. If this 
     %     property is empty, a default template is used to generate the
     %     document. This property cannot be changed after a presentation
     %     has been opened for output.
     TemplatePath;

end
%}