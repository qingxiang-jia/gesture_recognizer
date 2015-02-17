img = im2bw(imresize(imread('006.jpg'), 0.289), 0.5); % 0.289, decided by img resolution
img = imtrim(img);
imshow(img);
disp(countFinger(img));