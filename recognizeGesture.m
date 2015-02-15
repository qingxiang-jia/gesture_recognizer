% take a gesture and a sequence of templates and return the
% recognized gestures
function [gesture, location] = recognizeGesture(fileName)
gestureImg = im2bw(imresize(imread(fileName), 0.1), 0.5);
[trimedGestureImg, t, b, l, r] = imtrim(gestureImg);
fingerCount = countFinger(trimedGestureImg);
if fingerCount <= 2
%     location = detectWhere(gestureImg, fist);
    location = tellRegion((l+r)/2, (t+b)/2, size(gestureImg, 2), size(gestureImg, 1));
    gesture = 'fist';
else
    location = tellRegion((l+r)/2, (t+b)/2, size(gestureImg, 2), size(gestureImg, 1));
    gesture = 'pawn';
end

end