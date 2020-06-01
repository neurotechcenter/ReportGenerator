%mlreportgen.dom.CustomAttribute Custom element attribute
%     attr = CustomAttribute() creates an empty attribute.
%
%     attr = CustomAttribute('name') creates an attribute having the
%     specified name.
%
%     attr = CustomAttribute('name', 'value') creates an attribute having 
%     the specified name and value.
%
%    CustomAttribute properties:
%        Id       - Id of this attribute
%        Name     - Name of this attribute
%        Tag      - Tag of this attribue
%        Value    - Value of this attribute
%
%
%     Example:
%
%     import mlreportgen.dom.*;
%     d = Document('test');
%     ul = UnorderedList();
%     li = ListItem('Owl');
%     li.CustomAttributes = {CustomAttribute('data-animal-type', 'bird')};
%     append(ul, li);
%     li = ListItem('Salmon');
%     li.CustomAttributes = {CustomAttribute('data-animal-type', 'fish')};
%     append(ul, li);
%     li = ListItem('Tarantula');
%     li.CustomAttributes = {CustomAttribute('data-animal-type', 'spider')};
%     append(ul, li);
%     append(d, ul);
%     close(d);
%     rptview('test', 'html');
%
%     See also mlreportgen.dom.CustomElement

%    Copyright 2014 Mathworks, Inc.
%    Built-in class

%{
properties

     %Name Name of this attribute
     Name;

     %Value Value of this attribute
     Value;

end
%}