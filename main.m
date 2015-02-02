template = im2bw(imresize(imread('template.jpg'), 0.1), 0.6);
sample = rgb2gray(imresize(imread('p_lr.jpg'), 0.1));
[x, y, likelihood] = detect( sample, template );
disp(x);
disp(y);
disp(likelihood);
disp(tellRegion(x, y, size(sample, 2), size(sample, 1)));