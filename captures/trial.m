RGB = imread('t_ul.jpg');
for n = 1:10
    BW = im2bw(RGB, n/10);
    pause(2);
    imwrite(BW, strcat(int2str(n), ' out.jpg'));
    disp(n/10);
end