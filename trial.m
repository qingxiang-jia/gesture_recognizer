% this procedure is used to generate binary image.
RGB = imread('006.jpg'); % this is an example.
for n = 1:10 % try different threshold
    BW = im2bw(RGB, n/10);
    pause(2);
    imwrite(BW, strcat(int2str(n), ' out.jpg')); % output image file
    disp(n/10);
end