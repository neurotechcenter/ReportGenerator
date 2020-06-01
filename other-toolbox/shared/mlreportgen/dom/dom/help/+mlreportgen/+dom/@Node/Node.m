%mlreportgen.dom.Node Defines a document node
%     A document node is an object that a document can contain and that
%     itself contain other objects.
%
%     Node properties:
%         Children - Children of this node
%         Parent   - Parent of this node

%     Copyright 2013-2014 Mathworks, Inc.
%     Built-in class

%{
properties
     %Children Children of this node
     %      A cell array of the document objects that this node contains. 
     %      This property is read-only.
     Children;

     %Parent Parent of this node
     %      The node that contains this node. A node may have only one
     %      parent. This property is read-only.
     Parent;

end
%}