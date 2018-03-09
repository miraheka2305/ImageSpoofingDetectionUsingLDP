path = 'D:/Documents/College/Semester7/TugasAkhir/Semangat/Program2010';
dataExtraction = dir(path);
load crossValIndex.mat
hasilKlasifikasi = [];
%%
 for mm = 8:67
    load (dataExtraction(mm).name)
    F1ScoreSVMLinear = [];
    HTERSVMLinear = [];
    for ii = 1:kFold
        testIndex = find(crossValIndex == ii);
        trainIndex = find(crossValIndex ~= ii);
        featureTrain = [];
        labelTrain = [];
        featureTest = [];
        labelTest = [];
        for jj = 1:length(trainIndex)
            featureTrain(jj,:) = extractionLDPTrain(trainIndex(jj)).feature;
            labelTrain(jj) = str2num(extractionLDPTrain(trainIndex(jj)).label);
           
        end
        jj
        
        for kk = 1: length(testIndex)
            featureTest(kk,:) = extractionLDPTrain(testIndex(kk)).feature;
            labelTest(kk) = str2num(extractionLDPTrain(testIndex(kk)).label);
            
        end
        kk
        %linear kernel
        mdlSVM = fitcsvm(featureTrain,labelTrain);
        classifyResultSVM = predict(mdlSVM,featureTest);
        [TN,TP,FP,FN,Accuracy,Precision,Recall,F1ScoreSVM,FRR,FAR,HTER] = confusionMatrix(labelTest,classifyResultSVM);
        F1ScoreSVMLinear = [F1ScoreSVMLinear;F1ScoreSVM];
        HTERSVMLinear = [HTERSVMLinear;HTER];

        ii
    end
    %%
    hasil.F1ScoreSVMLinear = mean(F1ScoreSVMLinear);
    hasil.HTERSVMLinear = mean(HTERSVMLinear);
end
 save hasilKlasifikasiSkenario1.mat hasilKlasifikasi
