function [ ] = plotBallsOn3DImage(ax,electrodes, color, radius)
%PLOTBALLS  Plots electrodes in assigned color

ELS = size(electrodes, 1);
for els = 1 : ELS,    
    %original electrode locations:
    xe = electrodes(els, 1);
    ye = electrodes(els, 2);
    ze = electrodes(els, 3);
    %generate sphere coordinates (radius 1, 20-by-20 faces)
    [X, Y, Z] = sphere(100);

    %place the sphere into the spot:
    R = radius; %sphere radius
    X = R * X + xe;
    Y = R * Y + ye;
    Z = R * Z + ze;

    hold(ax,'on');
    surf(ax,X, Y, Z, ones(size(Z))*color, 'EdgeColor', 'none','FaceLighting','none');
end

  hold(ax,'off');