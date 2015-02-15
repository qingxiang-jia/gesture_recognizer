
% load templates
fist = imtrim(im2bw(imresize(imread('template_f.jpg'), 0.1), 0.5));
pawn = imtrim(im2bw(imresize(imread('template_p.jpg'), 0.1), 0.5));

% recongnize all gestures
recognize('f_c.jpg');
recognize('f_ll.jpg');
recognize('f_lr.jpg');
recognize('f_ul.jpg');
recognize('f_ur.jpg');

recognize('p_c.jpg');
recognize('p_ll.jpg');
recognize('p_lr.jpg');
recognize('p_ul.jpg');
recognize('p_ur.jpg');

