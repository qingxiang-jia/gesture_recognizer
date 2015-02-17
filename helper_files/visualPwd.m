% preparation 
% load templates
fist = im2bw(imresize(imread('template_f.jpg'), 0.1), 0.5);
pawn = im2bw(imresize(imread('template_p.jpg'), 0.1), 0.5);

% initialize operational patterns
createNewPwd = {'D', 'A', 'B', 'C', 'D'};
yes = {'A', 'E', 'B', 'D'};
no = {'D', 'A', 'C', 'B'};
pwd = {};

% initial state
state = '';

% ready
while (2 > 1)
    prompt = 'draw a pattern: ';
    pattern = strsplit(input(prompt,'s'));
    
    % analyze pattern: is it operational? is it pwd?
    isCreateNewPwd = cellfun(@strcmp, pattern, createNewPwd);
    isYes = cellfun(@strcmp, pattern, isYes);
    isNo = cellfun(@strcmp, pattern, isNo);
    isPwd = cellfun(@strcmp, pattern, isPwd);
    
    % check state
    if state == '' % initial state
        while isCreateNewPwd == 0
            disp('You need to create a password first.');
            prompt = 'Draw a password: ';
        end
            
    elseif 
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        