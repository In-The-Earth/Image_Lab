I = imread('chest.jpg');
I_gray = rgb2gray(I);
figure(1); imshow(I_gray);
J = histeq(I);
figure(2); imshow(J);
g = 255/(130-20);
output2 = I_gray;
for i=1 : size(I_gray,1)
    for j=1 : size(I_gray,2)
        output2(i,j) = g*(I_gray(i,j)-20);
    end
end
figure(3); imshow(output2);
output3 = I_gray;
for i=1 : size(I_gray,1)
    for j=1 : size(I_gray,2)
        if I_gray(i,j) < 20 || I_gray(i,j) > 130
            output3(i,j) = 0;
        else
            output3(i,j) = g*(I_gray(i,j)-20);
        end
    end
end
figure(4); imshow(output3);
imwrite(J,'hitogram-1.jpg');
imwrite(output2,'contrast-2.jpg');
imwrite(output3,'Intensity-3.jpg');
