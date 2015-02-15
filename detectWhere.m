% detect where the given gesture is on the screen
function location = detectWhere( sample, template )
%DETECTOR useless
% sample=reduced sample gray image
% template=reduced binary image
% x, y represent the center of the template found
% likelihood=how likely it is template
c = normxcorr2(template,sample);

[ypeak, xpeak] = find(c==max(c(:)));
ypeak = ypeak(1);
xpeak = xpeak(1);

yoffSet = ypeak-size(template,1);
xoffSet = xpeak-size(template,2);

x = xoffSet + 0.5*size(template,2);
y = yoffSet + 0.5*size(template,1);

location = tellRegion(x, y, size(sample, 2), size(sample, 1));

end
