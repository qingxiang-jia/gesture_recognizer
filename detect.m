function [ x, y, likelihood ] = detect( sample, template )
%DETECTOR
% sample=reduced sample gray image
% template=reduced binary image
% x, y represent the center of the template found
% likelihood=how likely it is template
c = normxcorr2(template,sample);

likelihood = max(max(c));
[ypeak, xpeak] = find(c==max(c(:)));

yoffSet = ypeak-size(template,1);
xoffSet = xpeak-size(template,2);

x = xoffSet + 0.5*size(template,2);
y = yoffSet + 0.5*size(template,1);

end

