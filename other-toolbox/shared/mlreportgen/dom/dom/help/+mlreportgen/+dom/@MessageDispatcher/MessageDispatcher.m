%mlreportgen.dom.MessageDispatcher DOM message dispatcher
%    
%
%    MessageDispatcher methods:
%        dispatch         - Dispatch a document generation status message
%        getTheDispatcher - Get the message dispatcher
%
%    MessageDispatcher properties:
%        Filter - Message filter (read-only)
%        Id     - Id of this object
%        Tag    - Tag of this object

%    Copyright 2014 Mathworks, Inc.
%    Built-in class

%{
properties
     %Filter Message filter 
     %      The value of this property is a filter that determines
     %      which types of messages the dispatcher dispatches. You 
     %      can control which types of messages are dispatched by 
     %      setting the properties of the filter.
     %
     %      See also mlreportgen.dom.MessageFilter
     Filter;
end
%}