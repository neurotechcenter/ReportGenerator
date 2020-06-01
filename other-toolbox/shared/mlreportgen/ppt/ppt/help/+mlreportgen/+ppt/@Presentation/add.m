%add Add a new slide to a presentation
%     slideObj = add(presentation, layoutName) creates and adds a slide
%     to the presentation, based on the layout, layoutName, defined in
%     the presentation's template. If the template specifies more than
%     one layout having the specified name, the PPT API uses the first
%     layout of that name that it finds in the template.
%
%     slideObj = add(presentation, layoutName, masterName) creates 
%     and adds a slide to the presentation, based on the layout,
%     layoutName, specified by the layout master, masterName, defined
%     by the presentation. Use this method to select a layout from
%     multiple layouts having the same name.
%
%     slideObj = add(presentation, layoutName, otherSlide) creates a 
%     slide based on the layout, layoutName, and inserts the new slide
%     before otherSlide.
%
%     slideObj = add(presentation, layoutName, masterName, otherSlide)
%     creates a slide based on the specified layout inserts the new slide
%     before otherSlide.
%
%     slideObj = add(presentation, layoutName, index) creates a 
%     slide based on the specified layout and inserts the new slide
%     at the specified position. For example, if index = 1, the
%     new slide becomes the first slide in the presentation and the
%     slide that was previously first becomes the second slide in
%     the presentations.
%
%     slideObj = add(presentation, layoutName, masterName index) creates a
%     slide based on the specified layout and inserts the new slide at
%     the specified position.

