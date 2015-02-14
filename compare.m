% demonstrates how iamge is compared

clc;
f_lr = imtrim(im2bw(imresize(imread('f_ll.jpg'), 0.1), 0.5), 'NorthWest');
p_lr = imtrim(im2bw(imresize(imread('p_c.jpg'), 0.1), 0.5), 'NorthWest');
t_f = imtrim(im2bw(imresize(imread('template_f.jpg'), 0.1), 0.5), 'NorthWest');

% imshow(t_f);


C1 = normxcorr2(f_lr, t_f);
a1 = max(C1(:));
C2 = normxcorr2(p_lr, t_f);
a2 = max(C2(:));

% a1 > a2 should be
disp('a1');
disp(a1);

disp('a2');
disp(a2);

