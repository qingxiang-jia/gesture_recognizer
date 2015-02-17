% read the video file, and then capture frames
video = VideoReader('p.mp4');
filenames = cell(1, 100); % store filenames
pos = 1; % marks last position of filename in filenames (exclusive)
for curr=0:5:video.Duration
    video.CurrentTime = curr; % set current time to curr
    img = readFrame(video); % read the next available frame
    img = im2bw(img, 7/10); % put into binary
    filename = [sprintf('%03d', curr) '.jpg'];
    filenames{1, pos} = filename; % store the generated filename for future use
    pos = pos + 1; % write the image to file
    imwrite(img, filename); % write the image to file
end

for i=1:(pos-1) % read a filename and load the image for recognition
    filename = filenames{i};
    recognize(filename);
end

