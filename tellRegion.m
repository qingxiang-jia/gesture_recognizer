function [ location ] = tellRegion( x, y, sizeX, sizeY )
% Tells which part is the template in the sample
%   x, y = location of the template
%   sizeX, sizeY = dimensions of the sample
r = 0.25*(sizeX + sizeY)/2; % empirical radius for the center

if (x - 0.5*sizeX)^2 + (y - 0.5*sizeY)^2 < r^2 % if in the circle, it is in the center
    location = 'center';
else
    partial = '';
    if (0 < y) & (y < (sizeY/2))
        partial = strcat(partial, 'upper'); % upper..?
    end
    if sizeY/2 <= y
        partial = strcat(partial, 'lower'); % lower..?
    end
    if 0 < x & x < sizeX/2
        partial = strcat(partial, ' left'); % ..? left
    else
        partial = strcat(partial, ' right'); % ..? right
    end
    location = partial; % now, partial accumulates enough information
end
end

