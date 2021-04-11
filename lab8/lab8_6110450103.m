for i=1 : 25
    im = imread(fullfile('trainset',sprintf('%d.jpg',i)));
    im_gray = rgb2gray(im);
    im_bw = ~im2bw(im_gray,0.94);
    im_bw_fill = imfill(im_bw,'holes');
    SE = strel('disk',5);
    im_pp = imopen(im_bw_fill,SE);
%     figure(i); imshow(im_pp);
    feature = regionprops(im_pp,'MinorAxisLength');
    feature_vector_train(i,1) = feature.MinorAxisLength;
    
    
end

for i=1 : 15
    im = imread(fullfile('testset',sprintf('%d.jpg',i)));
    im_gray = rgb2gray(im);
    im_bw = ~im2bw(im_gray,0.94);
    im_bw_fill = imfill(im_bw,'holes');
    SE = strel('disk',5);
    im_pp = imopen(im_bw_fill,SE);
%     figure(i); imshow(im_pp);
    feature = regionprops(im_pp,'MinorAxisLength');
    feature_vector_test(i,1) = feature.MinorAxisLength;
    
    
end

load('trainLabel.mat');
Mdl = fitcecoc(feature_vector_train,trainLabel);

load('testLabel.mat');
predictedLabels = predict(Mdl,feature_vector_test);
table(testLabel(:), predictedLabels(:),'VariableName',{'TrueLabels','PredictedLabels'})
acc = accuracy(testLabel,predictedLabels)