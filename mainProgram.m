load extractionLDP_R5_Overlapping_NonUniform_LDP2.mat
[featureTrain,labelTrain,featureTest,labelTest] = struct2Matrix(extractionLDPTrain,extractionLDPTest);
mdlSVM = fitcsvm(featureTrain,labelTrain','Standardize',true,'KernelFunction','RBF',...
        'KernelScale','auto');
classifyResultSVM = predict(mdlSVM,featureTest)
[TN,TP,FP,FN,Accuracy,Precision,Recall,F1ScoreSVM,FRR,FAR,HTER] = confusionMatrix(labelTest,classifyResultSVM);

