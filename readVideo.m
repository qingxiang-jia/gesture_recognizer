% read the video file, and then capture frames
video = VideoReader('f.mp4');
i = 1;
while hasFrame(video)
    img = readFrame(video);
    filename = [sprintf('%03d', i) '.jpg'];
    imwrite(img, filename);
    i = i + 100;
end