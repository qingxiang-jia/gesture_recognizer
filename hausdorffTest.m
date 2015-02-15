function [] = hausdorffTest(sample, template1, template2)
s_img = imtrim(im2bw(imresize(imread(sample), 0.1), 0.5));

tp_img = imtrim(im2bw(imresize(imread(template1), 0.1), 0.5));
tf_img = imtrim(im2bw(imresize(imread(template2), 0.1), 0.5));

s_img = imresize(s_img, [size(tp_img, 1), size(tp_img, 2)]);
tf_img = imresize(tf_img, [size(tp_img, 1), size(tp_img, 2)]);

disp(ModHausdorffDist(s_img, tp_img));
disp(ModHausdorffDist(s_img, tf_img));
end

