% take an image file and return the recognized gestures
function [gesture, location] = recognizeGesture(fileName) % fileName: the image file
img = imread(fileName); % read in the file, must be in the same directory
gestureImg = im2bw(imresize(img, 4160/size(img, 2)*0.1), 0.5); % reduce to binary, "4160" part just make sure that the video can also be reduced properly (not too small).
[trimedGestureImg, t, b, l, r] = imtrim(gestureImg); % call imtrim to get the trimmed gesture, and centroid
fingerCount = countFinger(trimedGestureImg); % now count the number of fingers
if fingerCount <= 2 % consider it as fist
    location = tellRegion((l+r)/2, (t+b)/2, size(gestureImg, 2), size(gestureImg, 1));
    gesture = 'fist';
elseif fingerCount == 4 % consider it as palm
    location = tellRegion((l+r)/2, (t+b)/2, size(gestureImg, 2), size(gestureImg, 1));
    gesture = 'pawn';
else % three finger gesture
    location = 'any'; % as mentioned in report, for three, location does not matter.
    gesture = 'three';
end
end