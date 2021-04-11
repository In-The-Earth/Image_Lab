feature_vector = zeros(12,3);
for i=1 : 12
    im = imread(sprintf('%d.jpg',i));
    I = im2double(im);
    R = I(:,:,1);
    G = I(:,:,2);
    B = I(:,:,3);
    S = R+G+B;
    im_hsv = rgb2hsv(im);
    s = im_hsv(:,:,2);
    banana_pixel = find(s > 0.3);
    r = R./S;
    R_avg = mean(r(banana_pixel));
    g = G./S;
    G_avg = mean(g(banana_pixel));
    b = B./S;
    B_avg = mean(b(banana_pixel));
    feature_vector(i,:) = [R_avg G_avg B_avg];
end

z = linkage(feature_vector,'complete','euclidean');
c = cluster(z,'maxclust',4)
scatter3(feature_vector(:,1), feature_vector(:,2), feature_vector(:,3),240,c,'fill');