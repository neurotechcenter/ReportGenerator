%mlreportgen.dom.CSSProperties Set of CSS objects
%    props = CSSProperties(prop) creates a CSSProperties object from an
%    object of type mlreportgen.dom.CSSProperty that specifies a Cascading
%    Style Sheet (CSS) format.
%
%    props = CSSProperties(prop_objs) creates a CSSProperties object from 
%    an array of mlreportgen.dom.CSSProperty objects.
%
%    props = CSSProperties({prop1, prop2, ..}) creates a CSSProperties
%    object from a cell array of mlreportgen.dom.CSSProperty objects.
%
%    Note. Objects of this type apply only to HTML output. Use 
%    mlreportgen.dom.FOProperties to customize formatting of PDF output.
%
%    CSSProperties properties:
%        Properties - Array of CSS properties
%        Id         - Id of this raw text object
%        Parent     - Parent of this raw text object
%        Tag        - Tag of this raw text object
%
%    Example:
%
%    import mlreportgen.dom.*
%    
%    d = Document('list-style-pos', 'html');
%    
%    p = Paragraph('The following list has list-style-position: inside:');
%    append(d, p);
%    list = UnorderedList({'Earl Grey', 'Jasmine', 'Honeybush'});
%    list.Style = {CSSProperties(CSSProperty('list-style-position', 'inside'))};
%    append(d, list);
%       
%    p = Paragraph('The following list has list-style-position: outside:');
%    append(d, p);
%    list = clone(list);
%    list.Style = {CSSProperties(CSSProperty('list-style-position', 'outside'))};
%    append(d, list);
%    
%    close(d);
%    rptview(d.OutputPath);
%
%    See also mlreportgen.dom.CSSProperties
%
%    See also mlreportgen.dom.CSSProperty, mlreportgen.dom.FOProperties

%    Copyright 2015 MathWorks, Inc.
%    Built-in class

%{
properties
     %Properties CSS properties
     %      The value of this property is an array of
     %      mlreportgen.dom.CSSProperty objects
     %      
     Properties;

end
%}