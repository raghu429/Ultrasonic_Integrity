%input_file = load("./physionet_ECG_data-master/ECGData.mat");

input_file = load("./usonic_data_50.mat");
ECGData = input_file

%config parameters
class_labels = {'A','B','C','D','E'}
% class_labels = {'A','B','C','E'}
invar_scale = 1;
percent_train = 70;

%constants
FS = 256000;
fs = FS/invar_scale;



[trainData,testData,trainLabels,testLabels] = helperRandomSplit(percent_train, ECGData);
Ctrain = countcats(categorical(trainLabels))./numel(trainLabels).*100
Ctest = countcats(categorical(testLabels))./numel(testLabels).*100

%helperPlotRandomRecords(ECGData,14)

N = size(ECGData.Data,2);
sf = waveletScattering('SignalLength',N, 'InvarianceScale',invar_scale,'SamplingFrequency',FS, 'QualityFactors', 4, 'Precision', 'single');
%%% sf = waveletScattering('SignalLength',N, 'InvarianceScale',invar_scale,'SamplingFrequency',fs);

scat_features_train = featureMatrix(sf,trainData');

Nwin = size(scat_features_train,2);
scat_features_train = permute(scat_features_train,[2 3 1]);
scat_features_train = reshape(scat_features_train,...
    size(scat_features_train,1)*size(scat_features_train,2),[]);


scat_features_test = featureMatrix(sf,testData');
scat_features_test = permute(scat_features_test,[2 3 1]);
scat_features_test = reshape(scat_features_test,...
    size(scat_features_test,1)*size(scat_features_test,2),[]);

[sequence_labels_train,sequence_labels_test] = createSequenceLabels(Nwin,trainLabels,testLabels);

scat_features = [scat_features_train; scat_features_test];
allLabels_scat = [sequence_labels_train; sequence_labels_test];
rng(1);
template = templateSVM(...
    'KernelFunction', 'polynomial', ...
    'PolynomialOrder', 2, ...
    'KernelScale', 'auto', ...
    'BoxConstraint', 1, ...
    'Standardize', true);
classificationSVM = fitcecoc(...
    scat_features, ...
    allLabels_scat, ...
    'Learners', template, ...
    'Coding', 'onevsall', ...
    'ClassNames', class_labels);
%'ClassNames', {'A';'B';'C','D';'E'});
    

kfoldmodel = crossval(classificationSVM, 'KFold', 5);

predLabels = kfoldPredict(kfoldmodel);
loss = kfoldLoss(kfoldmodel)*100;
confmatCV = confusionmat(allLabels_scat,predLabels)
fprintf('Accuracy is %2.2f percent.\n',100-loss);

classes = categorical(class_labels);
%classes = categorical({'A';'B';'C','D';'E'});

[ClassVotes,ClassCounts] = helperMajorityVote(predLabels,[trainLabels; testLabels],classes);


CVaccuracy = sum(eq(ClassVotes,categorical([trainLabels; testLabels])))/length(ClassVotes)*100;
fprintf('True cross-validation accuracy is %2.2f percent.\n',CVaccuracy);
MVconfmatCV = confusionmat(ClassVotes,categorical([trainLabels; testLabels]));
MVconfmatCV


model = fitcecoc(...
     scat_features_train, ...
     sequence_labels_train, ...
     'Learners', template, ...
     'Coding', 'onevsall', ...
     'ClassNames', class_labels);
 %'ClassNames', {'A';'B';'C','D';'E'});
predLabels = predict(model,scat_features_test);
[TestVotes,TestCounts] = helperMajorityVote(predLabels,testLabels,classes);
testaccuracy = sum(eq(TestVotes,categorical(testLabels)))/numel(testLabels)*100;
fprintf('The test accuracy is %2.2f percent. \n',testaccuracy);
testconfmat = confusionmat(TestVotes,categorical(testLabels));
testconfmat
