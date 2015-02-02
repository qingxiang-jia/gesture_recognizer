function [ location ] = tellRegion( x, y, sizeX, sizeY )
% Tells which part is the template in the sample
%   x, y = location of the template
%   sizeX, sizeY = dimensions of the sample
r = 0.25*(sizeX + sizeY)/2;

if (x - 0.5*sizeX)^2 + (y - 0.5*sizeY)^2 < r^2
    location = 'center';
else
    partial = '';
    if (0 < y) & (y < (sizeY/2))
        partial = strcat(partial, 'upper');
    end
    if sizeY/2 <= y
        partial = strcat(partial, 'lower');
    end
    if 0 < x & x < sizeX/2
        partial = strcat(partial, ' left');
    else
        partial = strcat(partial, ' right');
    end
    location = partial;
end

end

