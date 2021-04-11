scramble = imread('scrambled_image.tif');
load('scramble_code.mat');
output1 = scramble;
for i=1 : size(scramble,1)
    output1(r(1,i),:,:) = scramble(i,:,:); 
end
output2 = output1;
for i=1 : size(scramble,2)
    output2(:,c(1,i),:) = output1(:,i,:); 
end
figure(1); imshow(output2);
imwrite(output2,'scramble_output.jpg');