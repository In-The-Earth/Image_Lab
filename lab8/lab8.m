for i=1 : 25
    x = imread(fullfile('trainset',sprintf('%d.jpg',i)));
    x_gray = rgb2gray(x);
    x_bw = ~im2bw(x_gray,0.94);
    x_bw_2 = imfill(x_bw,'holes');
    se = strel('disk',4);
    y = imopen(x_bw_2,se);
    feature = regionprops(y,'MinorAxisLength');
    train(i,1) = feature.MinorAxisLength;
end

for i=1 : 15
    x = imread(fullfile('testset',sprintf('%d.jpg',i)));
    x_gray = rgb2gray(x);
    x_bw = ~im2bw(x_gray,0.94);
    x_bw_2 = imfill(x_bw,'holes');
    se = strel('disk',4);
    y = imopen(x_bw_2,se);
    feature = regionprops(y,'MinorAxisLength');
    test(i,1) = feature.MinorAxisLength;
end

load('trainLabel.mat');
Mdl = fitcecoc(train,trainLabel);

load('testLabel.mat');
predictedLabels = predict(Mdl,test);
table(testLabel(:), predictedLabels(:),'VariableName',{'TrueLabels','PredictedLabels'})
acc = accuracy(testLabel,predictedLabels)