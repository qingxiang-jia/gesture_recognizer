%%
%Finger Tracking
%Author: Arindam Sarkar
%Copyright?
%You can use this code for whatever you want! I'm not responsible for
%whatever it brings upon you, your system or your pet!
%Try to attribute the effort when you use part of this code in your own
%projects ;)
%Happy Coding!
%(c)2014 & beyond
%%

close all;
clc;
clear all;

%Acquire Image. Make sure you've started your webcam manually.

% vid=


% dntshw=false;
% pause(.001);

%acquireimage from webcam
%capture frame
% frame = step(vid);
%Read the image, and capture the dimensions
% img=uint8(255*frame);
out=imtrim(im2bw(imresize(imread('p_lr.jpg'), 0.1), 0.5), 'NorthWest');

stats=regionprops(out,'Centroid');

if length(stats)

    cx=stats.Centroid(1);
    cy=stats.Centroid(2);

    %find the nearest countour point
    boundary=bwboundaries(out);
    minDist=2*640*640;
    mx=cx;
    my=cy;
    bImg=uint8(zeros(480,640));

    for i=1:length(boundary)
        cell=boundary{i,1};
        for j=1:length(cell)
            y=cell(j,1);
            x=cell(j,2);

            sqrDist=(cx-x)*(cx-x)+(cy-y)*(cy-y);
            bImg(x,y)=255;

            if(sqrDist<minDist)
                minDist=sqrDist;
                mx=x;
                my=y;
            end
        end
    end
    
    sed=strel('disk',round(sqrt(minDist)/2));
    final=imerode(out,sed);
    final=imdilate(final,sed);
    final=out-final;
    
    final=bwareaopen(final,200);
	final=imerode(final,strel('disk',10));
    final=bwareaopen(final,400);
    
    [L,num]=bwlabel(final,8);
    final=imclearborder(final,8);
  
    imshow(final);
    
else
    imshow(out)
end
  