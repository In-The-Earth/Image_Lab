im1 = imread('night_flurry_exam.jpg');
% figure(2); imshow(im1);
F = medfilt3(im1);
% figure(3); imshow(F);
SE1 = strel('disk',8);
output = imdilate(F,SE1);
figure(1); imshow(output);