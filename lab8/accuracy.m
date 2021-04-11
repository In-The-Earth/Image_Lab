function Acc = accuracy(testLabel, predictedLabel)
TN = 0;
for i=1:15
    if strcmp(testLabel{i,1},predictedLabel{i,1})
        TN = TN + 1;
    end
end
Acc = TN/numel(testLabel)*100;