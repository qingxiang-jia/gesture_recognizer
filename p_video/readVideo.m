% read the video file, and then capture frames
video = VideoReader('p.mp4');
filenames = cell(1, 100); % store filenames
pos = 1;
for curr=0:5:video.Duration
    video.CurrentTime = curr; % set current time to curr
    img = readFrame(video); % read the next available frame
    img = im2bw(img, 7/10); % put into binary
    filename = [sprintf('%03d', curr) '.jpg'];
    filenames{1, pos} = filename;
    pos = pos + 1;
    imwrite(img, filename);
end

for i=1:(pos-1)
    filename = filenames{i};
    recognize(filename);
end

