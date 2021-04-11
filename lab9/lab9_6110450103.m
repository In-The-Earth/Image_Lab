im1 = imread("image_054_year_1.png");
im2 = imread("image_054_year_2.png");
im1_gray = rgb2gray(im1);
im2_gray = rgb2gray(im2);
h = fspecial('average',3);
im1_gray_sm = imfilter(im1_gray,h);
im2_gray_sm = imfilter(im2_gray,h);
points_im1 = detectHarrisFeatures(im1_gray_sm,'FilterSize',3);
[features1,vpts_1] = extractFeatures(im1_gray_sm,points_im1);
points_im2 = detectHarrisFeatures(im2_gray_sm,'FilterSize',3);
[features2,vpts_2] = extractFeatures(im2_gray_sm,points_im2);
indexParis = matchFeatures(features1, features2, 'Method', 'NearestNeighborRatio', 'MatchThreshold',6,'MaxRatio',0.7);
matchpoints_1 = vpts_1(indexParis(:,1));
matchpoints_2 = vpts_2(indexParis(:,2));
tform = fitgeotrans(matchpoints_2.Location, matchpoints_1.Location, 'affine');
registered = imwarp(im2_gray_sm,tform);

figure(1); imshowpair(im1_gray_sm,registered);
figure(2); imshowpair(im1_gray_sm,registered, 'diff' );