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
img = imresize(img, [size(img,1)-20, size(img,2)]); % reduce alternating pixel effect
% imshow(img); uncomment this to see the image to scan

prev = 0; % previous color value
curr = 0; % current color value
count = 0; % number of color changes
maxCount = 0; % track the maximum count ever encounter
for row=1:5:size(img, 1) % step size=5, reduce alternating pixel effect
    count = 0;
    for col=1:size(img, 2) % horizontal scan
        curr = img(row, col); % get color value for this [row, col]
        if ne(curr, prev) % if curr != prev
            count = count + 1;
            prev = curr;
        end
    end
    maxCount = max(maxCount, count); % update maxCount
end
maxCount = int8(maxCount/2); % round to integer
% fprintf('%d fingers\n', maxCount); uncomment this to see counts