im1 = imread('input1.jpg');
im1_2gray = rgb2gray(im1);
% figure(1); imhist(im1_2gray);
% imtool(im1_2gray);

BW_im1 = ~im2bw(im1_2gray,0.65);
h = fspecial('average',13);
B = imfilter(BW_im1,h);
B1 = medfilt2(B);

figure(2); imshow(B1);
SE = strel('disk',22);
output1 = imopen(B1,SE);
figure(3); imshow(output1);

output2 = drawBoundary(im1,output1);
figure(4); imshow(output2);
imwrite(output1,'output1.jpg');
imwrite(output2,'drawBoundary_output.jpg');