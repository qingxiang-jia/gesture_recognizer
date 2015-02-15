function maxCount = countFinger(img)
% 1) img is already trimmed 2) img is binary
% img = imtrim(im2bw(imresize(imread('f_ur.jpg'), 0.1), 0.5), 'NorthWest');
img = imrotate(img, -30);

img = imclose(img,strel('disk',5)); % denoise
img = imfill(img, 'holes'); % remove "space" in fist
% img = edge(img,'prewitt'); % get a edged image
img = imclose(img,strel('disk',5)); % smooth
img = imclose(img,strel('disk',5)); % smooth again
img = imclose(img,strel('disk',5)); % smooth again and again
img = imresize(img, [size(img,1)-20, size(img,2)]);
imshow(img);

prev = 0;
curr = 0;
count = 0;
maxCount = 0;
for row=1:5:size(img, 1)
    count = 0;
    for col=1:size(img, 2)
        curr = img(row, col);
        if ne(curr, prev)
            count = count + 1;
            prev = curr;
        end
    end
    maxCount = max(maxCount, count);
end
maxCount = int8(maxCount/2);
% fprintf('%d fingers\n', maxCount);