%mlreportgen.dom.FOProperties Array of FO format objects
%    props = FOProperties(prop) creates an FOProperties object from an
%    object of type mlreportgen.dom.FOProperty that specifies an XML Style
%    Sheet Language (XSL) Formatting Object (FO) format. The DOM API uses
%    FO objects to generate PDF output.
%
%    props = FOProperties(prop_objs) creates an FOProperties object from 
%    an array of mlreportgen.dom.FOProperty objects.
%
%    props = CSSProperties({prop1, prop2, ..}) creates an FOProperties
%    object from a cell array of mlreportgen.dom.FOProperty objects.
%
%    Note. Objects of this type apply only to PDF output. Use
%    mlreportgen.dom.FOProperties objects to customize formatting of HTML
%    output.
%
%    FOProperties properties:
%        Properties - array of FO properties
%        Id         - Id of this raw text object
%        Parent     - Parent of this raw text object
%        Tag        - Tag of this raw text object
%
%    Example:
%
%    import mlreportgen.dom.*
%    
%    d = Document('break-before-list', 'pdf');
%    
%    p = Paragraph('First Page');
%    p.Style = {PageBreakBefore};
%    append(d, p);
%    
%    % Start the following paragraph on a new page.
%    p = Paragraph('Second Page');
%    p.Style = {PageBreakBefore};
%    append(d, p);
%    
%    % We want the following list to start on a new page. The DOM
%    % PageBreakBefore format does not apply to lists. However, we can
%    % apply the FO break-before property to achieve the desired effect.
%    list = UnorderedList({'Earl Grey', 'Jasmine', 'Honeybush'});
%    list.Style = {FOProperties(FOProperty('break-before', 'page'))};
%    append(d, list);
%    
%    close(d);
%    rptview(d.OutputPath);
%
%    See also mlreportgen.dom.FOProperty, mlreportgen.dom.CSSProperties

%    Copyright 2015 MathWorks, Inc.
%    Built-in class

%{
properties
     %Properties FO properties
     %      The value of this property is an array of
     %      mlreportgen.dom.FOProperty objects
     %      
     Properties;

end
%}