
% recongnize all gestures
% recognize('f_c.jpg');
% recognize('f_ll.jpg');
% recognize('f_lr.jpg');
% recognize('f_ul.jpg');
% recognize('f_ur.jpg');
% 
% recognize('p_c.jpg');
% recognize('p_ll.jpg');
% recognize('p_lr.jpg');
% recognize('p_ul.jpg');
% recognize('p_ur.jpg');


% 7 successful sequences

% #1 f_ll f_ul f_ur f_lr f_ll (create password)
% recognize('f_ll.jpg');
% recognize('f_ul.jpg');
% recognize('f_ur.jpg');
% recognize('f_lr.jpg');
% recognize('f_ll.jpg');

% #2 p_ll p_ul p_ur p_lr p_ll
% recognize('p_ll.jpg');
% recognize('p_ul.jpg');
% recognize('p_ur.jpg');
% recognize('p_lr.jpg');
% recognize('p_ll.jpg');

% #3 f_ul f_c f_ur f_ll (yes)
% recognize('f_ul.jpg');
% recognize('f_c.jpg');
% recognize('f_ur.jpg');
% recognize('f_ll.jpg');

% #4 p_ul p_c p_ur p_ll
% recognize('p_ul.jpg');
% recognize('p_c.jpg');
% recognize('p_ur.jpg');
% recognize('p_ll.jpg');

% #5 f_ll f_ul f_lr f_lr f_ur (no)
% recognize('f_ll.jpg');
% recognize('f_ul.jpg');
% recognize('f_lr.jpg');
% recognize('f_lr.jpg');
% recognize('f_ur.jpg');

% #6 p_ll p_ul p_lr p_lr p_ur
% recognize('p_ll.jpg');
% recognize('p_ul.jpg');
% recognize('p_lr.jpg');
% recognize('p_lr.jpg');
% recognize('p_ur.jpg');

% #7 p_ll p_ul p_c p_lr p_ur p_c p_ll
% recognize('p_ll.jpg');
% recognize('p_ul.jpg');
% recognize('p_c.jpg');
% recognize('p_lr.jpg');
% recognize('p_ur.jpg');
% recognize('p_c.jpg');
% recognize('p_ll.jpg');

% source of failure
% recognize('p_fail_1.jpg'); % false negative
% recognize('p_fail_2.jpg'); % false negative
% recognize('p_fail_3.jpg'); % false negative
% 
% recognize('t_fail_1.jpg'); % false negative
% recognize('t_fail_2.jpg'); % false negative
% recognize('t_fail_3.jpg'); % false positive

% recognize('f_fail_1.jpg'); % false positive

