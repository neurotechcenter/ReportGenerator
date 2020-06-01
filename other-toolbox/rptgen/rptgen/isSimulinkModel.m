function isSystem = isSimulinkModel(sysName, rptgenRoot)
% ISSIMULINKMODEL Returns whether or not the given sysName indicates a simulink model

%   Copyright 1997-2015 The MathWorks, Inc.

    isSystem = false;
    
    if (rptgen.isSimulinkLoaded)

        try %#ok<TRYNC> 
            if (nargin > 1)
                editor = rptgenRoot.Editor;
                
                editor.setDispatcherEvents({});
            end

    		isSystem = ~isempty(find_system(sysName,'flat'));
        end
        
        if (nargin > 1)
            rptgenRoot.resetDispatcherEvents();
        end
    end

