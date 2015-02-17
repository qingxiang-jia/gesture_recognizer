function [] = testT(fileName)
gestureImg = im2bw(imresize(imread(fileName), 0.1), 0.5);
trimedGestureImg = imtrim(gestureImg);
count = countFinger(trimedGestureImg);
fprintf('%s count=%d\n', fileName, count);
end