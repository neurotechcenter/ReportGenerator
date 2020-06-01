// Javascript functions to support operations in MAT-file comparison reports

// Copyright 2012-2018 The MathWorks, Inc.

// Getting the root window is browser dependent.  On some platforms the
// parent of root is the window, and window.window is window.
// On other browsers, parent can be undefined.
function getRootWindow() {
  if (parent) {return parent.window;} else {return window;}
}

function comparevar(varname) {
  var rootWindow=getRootWindow();
  return rootWindow.MATLAB.feval(
      "slxmlcomp.internal.modelWorkspace.compareVariables",
      [
          LEFT_FILE,
          RIGHT_FILE,
          varname,
          varname
      ],
      0
  );
}
