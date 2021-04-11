im1 = imread('julia_twitter.jpg');
im1_2gray = rgb2gray(im1);
h = fspecial('average',12);
B = imfilter(im1_2gray,h);
C = im1_2gray - B;
output1 = im1_2gray + 4*C;
figure(1); imshow(output1);

output2 = histeq(output1);
figure(2); imshow(output2);