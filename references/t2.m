Original = imread('sample1.png'); % Read original image
Template = imread('template.png'); % Read template image

OriDu = im2double(Original); % convert original image
TempDu = im2double(Template); % convert template

OriH = size(Original, 1); %height of the Original image
OriW = size(Original, 2); %width of the Original image
OriD = size(Original, 3); %colour depth 

TempH = size(Template, 1); %height of the Template image
TempW = size(Template, 2); %width of the Template image
TempD = size(Template, 3); %colour depth 

TempDu = reshape(TempDu, TempH*TempW, 3);

corr = 0; % to check the best correlation found


%% two for loops to go through the original image.

for i = 1:OriH-TempH
    for j = 1:OriW-TempW

        % take a segment of the original image( same size as the template size)
        segment = OriDu(i: (i - 1) + TempH, j: (j - 1) + TempW, :);

        segment = reshape(segment, TempH*TempW, 3);

        output = corr2(TempDu, segment);

        if output > corr
           corr = output;
           x = i;
           y = j;
        end
    end
end 

figure;
subplot(1,2,1), imshow(Template), title('Template');
subplot(1,2,2), imshow(OriDu(x:x+TempH, y:y+TempW, :)),title('Segment of the similar part');