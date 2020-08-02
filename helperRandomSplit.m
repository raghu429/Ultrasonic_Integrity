function [trainData,testData,trainLabels,testLabels] = helperRandomSplit(percent_train,ECGData)
PD = percent_train/100 ; 
% Let P be your N-by-M input datase
%ECGData.Data is a 162 X 65536 double and ECGData.Labels = 162 X1 
P = ECGData.Data;
Q = ECGData.Labels;

cv = cvpartition(size(P,1),'HoldOut',PD);
testData = P(cv.training,:);
trainData = P(cv.test,:);

cv = cvpartition(size(Q,1),'HoldOut',PD);
testLabels = Q(cv.training,:);
trainLabels = Q(cv.test,:);

end