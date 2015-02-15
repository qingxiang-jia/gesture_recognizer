

% load templates
fist = imtrim(im2bw(imresize(imread('template_f.jpg'), 0.1), 0.5));
pawn = imtrim(im2bw(imresize(imread('template_p.jpg'), 0.1), 0.5));


% recongnize all gestures
% recognize('f_c.jpg', fist, pawn);
% recognize('f_ll.jpg', fist, pawn);
% recognize('f_lr.jpg', fist, pawn);
% recognize('f_ul.jpg', fist, pawn);
% recognize('f_ur.jpg', fist, pawn);

recognize('p_c.jpg', fist, pawn);
% recognize('p_ll.jpg', fist, pawn);
% recognize('p_lr.jpg', fist, pawn);
% recognize('p_ul.jpg', fist, pawn);
% recognize('p_ur.jpg', fist, pawn);

