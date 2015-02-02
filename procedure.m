
template = im2bw(imresize(imread('template.jpg'), 0.1), 0.6);
 sample = rgb2gray(imresize(imread('p_ul.jpg'), 0.1));
% sample = rgb2gray(imresize(imread('p_ur.jpg'), 0.1));
% sample = rgb2gray(imresize(imread('p_ll.jpg'), 0.1)); 
% sample = rgb2gray(imresize(imread('p_lr.jpg'), 0.1));
% sample = rgb2gray(imresize(imread('p_c.jpg'), 0.1));

c = normxcorr2(template,sample);
figure, surf(c), shading flat

[ypeak, xpeak] = find(c==max(c(:)));

yoffSet = ypeak-size(template,1);
xoffSet = xpeak-size(template,2);

xPos = xoffSet + 0.5*size(template,2);
yPos = yoffSet + 0.5*size(template,1);

hAx = axes;
imshow(sample,'Parent', hAx);
imrect(hAx, [xoffSet, yoffSet, size(template,2), size(template,1)]);
imrect(hAx, [xPos, yPos, 10, 10]);
imrect(hAx, [5, 5, 10, 10]);

r = 0.25*(size(template, 2) + size(template, 1))/2;

% center region
imellipse(hAx, [0.5*size(sample, 2) - r, 0.5*size(sample, 1) - r, 2*r, 2*r]);

if (xPos - 0.5*size(sample, 2))^2 + (yPos - 0.5*size(sample, 1))^2 < r^2
    disp('center');
else
    if (0 < yPos) & (yPos < (size(sample, 1)/2))
        disp('upper');
    end
    if size(sample, 1)/2 <= yPos
        disp('lower');
    end
    if 0 < xPos & xPos < size(sample, 2)/2
        disp('left');
    else
        disp('right');
    end
end


