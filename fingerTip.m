imgURL = 'https://encrypted-tbn2.gstatic.com/imgs?q=tbn:ANd9GcRQsqJtlrOnSbJNTnj35Z0uG9BXsecX2AXn1vV0YDKodq-zSuqnnQ';

imgIn=imread(imgURL);

gaussfilt = fspecial('gaussian', 3, .5); % Blur starting image
blurImg = imfilter(double(img(:,:,1)), gaussfilt); 

edgeImg = edge(blurImg, 'sobel'); % Use Sobel edge filter to pick out contours of hand + fingers
% Clean up contours
edgeImg = bwmorph(edgeImg, 'close', 1); 
edgeImg = bwmorph(edgeImg, 'thin', Inf);

% Clean up rogue spots in corners
edgeImg([2 end-1], 2) = 0;
edgeImg([2 end-1], end-1) = 0;

% Extend lines to edge of image (correct for 'close' operation above
edgeImg([1 end],:) = edgeImg([2 end-1],:);
edgeImg(:, [1 end]) = edgeImg(:, [2 end-1]);

% Remove all but the longest line
regs = regionprops(edgeImg, 'Area', 'PixelIdxList');
regs(vertcat(regs.Area) ~= max(vertcat(regs.Area))) = [];

lineImg = false(size(edgeImg, 1), size(edgeImg, 2));
lineImg(regs.PixelIdxList) = 1;

fillImg = edgeImg;

% Close in wrist

if any(fillImg(1,:))
    fillImg(1,:) = 1;
end

if any(fillImg(end,:))
    fillImg(end,:) = 1;
end

if any(fillImg(:,1))
    fillImg(:,1) = 1;
end

if any(fillImg(:,end))
    fillImg(:,end) = 1;
end

fillImg = imfill(fillImg, 'holes');

fillImg([1 end], :) = 0;
fillImg(:, [1 end]) = 0;

fillImg([1 end],:) = fillImg([2 end-1],:);
fillImg(:, [1 end]) = fillImg(:, [2 end-1]);

% Start segmenting out hand + fingers
handBin = fillImg;
% Set lines in above image to 0 to separate closely-spaced fingers
handBin(lineImg) = 0;
% Erode these lines to make fingers a bit more separate
handBin = bwmorph(handBin, 'erode', 1);

% Segment out just hand (remove wrist)
distImg = bwdist(~handBin);

[cDx, cDy] = find(distImg == max(distImg(:)));

midWrist = distImg;
midWrist = max(midWrist(:)) - midWrist;
midWrist(distImg == 0) = Inf;
wristWatershed = watershed(imerode(midWrist, strel('disk', 10)));
whichRegion = wristWatershed(cDx, cDy);
handBin(wristWatershed ~= whichRegion) = 0;

regs = regionprops(handBin, 'Area', 'PixelIdxList');
regs(vertcat(regs.Area) ~= max(vertcat(regs.Area))) = [];
handOnly = zeros(size(handBin, 1), size(handBin, 2));
handOnly(regs.PixelIdxList) = 1;

% Find radius of circle around palm centroid that excludes wrist and splits
% fingers into separate regions.  
% This is estimated as D = 1/3 * [(Centroid->Fingertip) + 2*(Centroid->Wrist)]
% Find Centroid-> Wrist distance
dist2w = wristWatershed ~= whichRegion;
dist2w = bwdist(dist2w);
distToWrist = dist2w(cDx, cDy);

% Find Centroid-> Fingertip distance
dist2FE = zeros(size(handOnly, 1), size(handOnly, 2));
dist2FE(cDx, cDy) = 1;
dist2FE = bwdist(dist2FE).*handOnly;
distToFingerEnd = max(dist2FE(:));

circRad = mean([distToFingerEnd, distToWrist, distToWrist]); % Estimage circle diameter
% Draw circle
X = bsxfun(@plus,(1:size(handOnly, 1))',zeros(1,size(handOnly, 2)));
Y = bsxfun(@plus,(1:size(handOnly, 2)),zeros(size(handOnly, 1),1));
B = sqrt(sum(bsxfun(@minus,cat(3,X,Y),reshape([cDx, cDy],1,1,[])).^2,3))<=circRad;
% Cut out binary mask within circle
handOnly(B) = 0;

% Label separate regions, where each now corresponds to a separate digit
fingerCount = bwlabel(handOnly);

% Display overlay image
figure()
imshow(imgIn)
hold on
overlayImg = imshow(label2rgb(fingerCount, 'jet', 'k'));
set(overlayImg, 'AlphaData', 0.5);
hold off