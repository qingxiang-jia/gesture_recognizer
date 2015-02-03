passwords = {'1',        '2',        '3',        '4',        'Yes',     'A',        'B',        'C',        'D',        'No'};
filenames = {'p_lr.jpg', 'p_ur.jpg', 'p_ul.jpg', 'p_ll.jpg', 'p_c.jpg', 'f_lr.jpg', 'f_ur.jpg', 'f_ul.jpg', 'f_ll.jpg', 'f_c.jpg'};
pwd2fn = containers.Map(passwords, filenames);

template_p = im2bw(imresize(imread('template_p.jpg'), 0.1), 0.6);
template_f = im2bw(imresize(imread('template_f.jpg'), 0.1), 0.6);
% template_p = rgb2gray(imresize(imread('template_p.jpg'), 0.1));
% template_f = rgb2gray(imresize(imread('template_f.jpg'), 0.1));
% sample = rgb2gray(imresize(imread(pwd2fn('1')), 0.1));

samples = containers.Map();
samples('1') = imresize(imread(pwd2fn('1')), 0.1);
samples('2') = imresize(imread(pwd2fn('2')), 0.1);
samples('3') = imresize(imread(pwd2fn('3')), 0.1);
samples('4') = imresize(imread(pwd2fn('4')), 0.1);
samples('Yes') = imresize(imread(pwd2fn('Yes')), 0.1);
samples('A') = imresize(imread(pwd2fn('A')), 0.1);
samples('B') = imresize(imread(pwd2fn('B')), 0.1);
samples('C') = imresize(imread(pwd2fn('C')), 0.1);
samples('D') = imresize(imread(pwd2fn('D')), 0.1);
samples('No') = imresize(imread(pwd2fn('No')), 0.1);

% Check logic: 1) is it a fist or palm? 2) where is it?

for k = keys(samples)
    disp(pwd2fn(char(k)));
    sample = samples(char(k));
    [x_p, y_p, likelihood_p] = detect( sample, template_p );
    [x_f, y_f, likelihood_f] = detect( sample, template_f );
    if likelihood_p > likelihood_f
        disp('palm');
        disp(tellRegion(x_p, y_p, size(sample, 2), size(sample, 1)));
    else
        disp('fist');
        disp(tellRegion(x_f, y_f, size(sample, 2), size(sample, 1)));
    end
    disp(' ');
end

% [x, y, likelihood] = detect( sample, template_p );
% disp(x);
% disp(y);
% disp(likelihood);
% disp(tellRegion(x, y, size(sample, 2), size(sample, 1)));










