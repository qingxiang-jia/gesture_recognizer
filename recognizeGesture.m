% take a gesture and a sequence of templates and return the
% recognized gestures
function [gesture, location] = recognizeGesture(fileName)
img = imread(fileName);
gestureImg = im2bw(imresize(img, 4160/size(img, 2)*0.1), 0.5);
[trimedGestureImg, t, b, l, r] = imtrim(gestureImg);
fingerCount = countFinger(trimedGestureImg);
if fingerCount <= 2
%     location = detectWhere(gestureImg, fist);
    location = tellRegion((l+r)/2, (t+b)/2, size(gestureImg, 2), size(gestureImg, 1));
    gesture = 'fist';
elseif fingerCount == 4
    location = tellRegion((l+r)/2, (t+b)/2, size(gestureImg, 2), size(gestureImg, 1));
    gesture = 'pawn';
else % three finger gesture
    location = 'any';
    gesture = 'three';
end

end