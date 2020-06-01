%mlreportgen.dom.Watermark Watermark for a PDF page section
%    wm = Watermark(imagePath) creates a watermark based on the 
%    specified image. Valid watermark image types include:
%
%    bmp
%    jpg
%    png
%    svg
%    tiff
%
%    Watermark properties:
%        CustomAttributes  - Custom element attributes
%        Height            - Height of this watermark
%        Id                - Id of this watermark
%        Path              - Path of the watermark iamge file
%        Style             - Formats that define this watermark's style
%        StyleName         - Name of watermark's stylesheet-defined style
%        Tag               - Tag of this watermark
%        Width             - Width of this watermark
%
%    Example:
%
%    import mlreportgen.dom.*;
%    
%    wmname = 'wm';
%    wmtype =  'svg';
%    wmfilename = [wmname '.' wmtype];
%    
%    subplot('Position',[0, 0, 1, 1]);
%    axis('off');
%    text(0.25, 0.25, 'Confidential', ...
%        'Rotation', 45, ...
%        'Color', [0.85, 0.85, 0.85], ...
%        'FontSize', 56);
%    
%    print(wmfilename, ['-d' wmtype]);
%    delete(gcf);
%    
%    d = Document('myreport', 'pdf');
%    open(d);
%    
%    wm = Watermark(wmfilename);
%    wm.Width = '12in';
%    wm.Height = [];
%    
%    d.CurrentPageLayout.Watermark = wm;
%    
%    append(d, 'Hello');
%    append(d, PageBreak);
%    append(d, 'World');
%    
%    close(d);
%    rptview(d.OutputPath);
%    delete(wmfilename);

%    Copyright 2016 Mathworks, Inc.
%    Built-in class
