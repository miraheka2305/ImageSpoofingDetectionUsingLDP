path = 'D:/Documents/College/Semester7/TugasAkhir/Semangat/Program2010';
dataExtraction = dir(path);
load crossValIndex.mat
hasilKlasifikasi = [];
%%
load extractionLDP_R5_Overlapping_NonUniform_LDP2.mat
    F1ScoreKNNK1 = [];
    HTERKNNK1 = [];
    F1ScoreKNNK3 = [];
    HTERKNNK3 = [];
    F1ScoreKNNK5 = [];
    HTERKNNK5 = [];
    F1ScoreKNNK7 = [];
    HTERKNNK7 = [];
    F1ScoreKNNK9 = [];
    HTERKNNK9 = [];
    F1ScoreKNNK11 = [];
    HTERKNNK11 = [];
    F1ScoreKNNK21 = [];
    HTERKNNK21 = [];
    F1ScoreKNNK31 = [];
    HTERKNNK31 = [];
    F1ScoreKNNK51 = [];
    HTERKNNK51 = [];
    F1ScoreKNNK71 = [];
    HTERKNNK71 = [];
    F1ScoreKNNK91 = [];
    HTERKNNK91 = [];
    F1ScoreKNNK111 = [];
    HTERKNNK111 = [];
    F1ScoreSVMRBF = [];
    HTERSVMRBF = [];
    F1ScoreSVMPolynomial = [];
    HTERSVMPolynomial = [];
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
        Mdl = fitcknn(featureTrain,labelTrain,'NumNeighbors',1)
        classifyResult = predict(Mdl, featureTest);
        [TN,TP,FP,FN,Accuracy,Precision,Recall,F1ScoreKNN,FRR,FAR,HTER] = confusionMatrix(labelTest,classifyResult);
        F1ScoreKNNK1 = [F1ScoreKNNK1;F1ScoreKNN];
        HTERKNNK1 = [HTERKNNK1;HTER];

        Mdl = fitcknn(featureTrain,labelTrain,'NumNeighbors',3)
        classifyResult = predict(Mdl, featureTest);
        [TN,TP,FP,FN,Accuracy,Precision,Recall,F1ScoreKNN,FRR,FAR,HTER] = confusionMatrix(labelTest,classifyResult);
        F1ScoreKNNK3 = [F1ScoreKNNK3;F1ScoreKNN];
        HTERKNNK3 = [HTERKNNK3;HTER];

        Mdl = fitcknn(featureTrain,labelTrain,'NumNeighbors',5)
        classifyResult = predict(Mdl, featureTest);
        [TN,TP,FP,FN,Accuracy,Precision,Recall,F1ScoreKNN,FRR,FAR,HTER] = confusionMatrix(labelTest,classifyResult);
        F1ScoreKNNK5 = [F1ScoreKNNK5;F1ScoreKNN];
        HTERKNNK5 = [HTERKNNK5;HTER];

        Mdl = fitcknn(featureTrain,labelTrain,'NumNeighbors',7)
        classifyResult = predict(Mdl, featureTest);
        [TN,TP,FP,FN,Accuracy,Precision,Recall,F1ScoreKNN,FRR,FAR,HTER] = confusionMatrix(labelTest,classifyResult);
        F1ScoreKNNK7 = [F1ScoreKNNK7;F1ScoreKNN];
        HTERKNNK7 = [HTERKNNK7;HTER];

        Mdl = fitcknn(featureTrain,labelTrain,'NumNeighbors',9)
        classifyResult = predict(Mdl, featureTest);
        [TN,TP,FP,FN,Accuracy,Precision,Recall,F1ScoreKNN,FRR,FAR,HTER] = confusionMatrix(labelTest,classifyResult);
        F1ScoreKNNK9 = [F1ScoreKNNK9;F1ScoreKNN];
        HTERKNNK9 = [HTERKNNK9;HTER];

        Mdl = fitcknn(featureTrain,labelTrain,'NumNeighbors',11)
        classifyResult = predict(Mdl, featureTest);
        [TN,TP,FP,FN,Accuracy,Precision,Recall,F1ScoreKNN,FRR,FAR,HTER] = confusionMatrix(labelTest,classifyResult);
        F1ScoreKNNK11 = [F1ScoreKNNK11;F1ScoreKNN];
        HTERKNNK11 = [HTERKNNK11; HTER];
 
        Mdl = fitcknn(featureTrain,labelTrain,'NumNeighbors',21)
        classifyResult = predict(Mdl, featureTest);
        [TN,TP,FP,FN,Accuracy,Precision,Recall,F1ScoreKNN,FRR,FAR,HTER] = confusionMatrix(labelTest,classifyResult);
        F1ScoreKNNK21 = [F1ScoreKNNK21;F1ScoreKNN];
        HTERKNNK21 = [HTERKNNK21;HTER];

        Mdl = fitcknn(featureTrain,labelTrain,'NumNeighbors',31)
        classifyResult = predict(Mdl, featureTest);
        [TN,TP,FP,FN,Accuracy,Precision,Recall,F1ScoreKNN,FRR,FAR,EER] = confusionMatrix(labelTest,classifyResult);
        F1ScoreKNNK31 = [F1ScoreKNNK31;F1ScoreKNN];
        HTERKNNK31 = [HTERKNNK31;EER];

        Mdl = fitcknn(featureTrain,labelTrain,'NumNeighbors',51)
        classifyResult = predict(Mdl, featureTest);
        [TN,TP,FP,FN,Accuracy,Precision,Recall,F1ScoreKNN,FRR,FAR,EER] = confusionMatrix(labelTest,classifyResult);
        F1ScoreKNNK51 = [F1ScoreKNNK51;F1ScoreKNN];
        HTERKNNK51 = [HTERKNNK51;EER];

        Mdl = fitcknn(featureTrain,labelTrain,'NumNeighbors',71)
        classifyResult = predict(Mdl, featureTest);
        [TN,TP,FP,FN,Accuracy,Precision,Recall,F1ScoreKNN,FRR,FAR,EER] = confusionMatrix(labelTest,classifyResult);
        F1ScoreKNNK71 = [F1ScoreKNNK71;F1ScoreKNN];
        HTERKNNK71 = [HTERKNNK71;EER];

        Mdl = fitcknn(featureTrain,labelTrain,'NumNeighbors',91)
        classifyResult = predict(Mdl, featureTest);
        [TN,TP,FP,FN,Accuracy,Precision,Recall,F1ScoreKNN,FRR,FAR,EER] = confusionMatrix(labelTest,classifyResult);
        F1ScoreKNNK91 = [F1ScoreKNNK91;F1ScoreKNN];
        HTERKNNK91 = [HTERKNNK91;EER];

        Mdl = fitcknn(featureTrain,labelTrain,'NumNeighbors',111)
        classifyResult = predict(Mdl, featureTest);
        [TN,TP,FP,FN,Accuracy,Precision,Recall,F1ScoreKNN,FRR,FAR,EER] = confusionMatrix(labelTest,classifyResult);
        F1ScoreKNNK111 = [F1ScoreKNNK111;F1ScoreKNN];
        HTERKNNK111 = [HTERKNNK111; EER];
  
        %linear kernel
        mdlSVM = fitcsvm(featureTrain,labelTrain);
        classifyResultSVM = predict(mdlSVM,featureTest);
        [TN,TP,FP,FN,Accuracy,Precision,Recall,F1ScoreSVM,FRR,FAR,HTER] = confusionMatrix(labelTest,classifyResultSVM);
        F1ScoreSVMLinear = [F1ScoreSVMLinear;F1ScoreSVM];
        HTERSVMLinear = [HTERSVMLinear;HTER];
% 
        radial basis
        mdlSVM = fitcsvm(featureTrain,labelTrain,'Standardize',true,'KernelFunction','RBF',...
        'KernelScale','auto');
        classifyResultSVM = predict(mdlSVM,featureTest);
        [TN,TP,FP,FN,Accuracy,Precision,Recall,F1ScoreSVM,FRR,FAR,EER] = confusionMatrix(labelTest,classifyResultSVM);
        F1ScoreSVMRBF = [F1ScoreSVMRBF;F1ScoreSVM];
        HTERSVMRBF = [HTERSVMRBF;EER];

        %polynomial
        mdlSVM = fitcsvm(featureTrain,labelTrain,'Standardize',true,'KernelFunction','polynomial',...
        'KernelScale','auto');
        classifyResultSVM = predict(mdlSVM,featureTest);
        [TN,TP,FP,FN,Accuracy,Precision,Recall,F1ScoreSVM,FRR,FAR,EER] = confusionMatrix(labelTest,classifyResultSVM);
        F1ScoreSVMPolynomial = [F1ScoreSVMPolynomial;F1ScoreSVM];
        HTERSVMPolynomial = [HTERSVMPolynomial;EER];
        ii
    end
    %%
    hasil.F1ScoreKNNK1 = mean(F1ScoreKNNK1);
    hasil.HTERKNNK1 = mean(HTERKNNK1);
    hasil.F1ScoreKNNK3 = mean(F1ScoreKNNK3);
    hasil.HTERKNNK3 = mean(HTERKNNK3);
    hasil.F1ScoreKNNK5 = mean(F1ScoreKNNK5);
    hasil.HTERKNNK5 = mean(HTERKNNK5);
    hasil.F1ScoreKNNK7 = mean(F1ScoreKNNK7);
    hasil.HTERKNNK7 = mean(HTERKNNK7);
    hasil.F1ScoreKNNK9 = mean(F1ScoreKNNK9);
    hasil.HTERKNNK9 = mean(HTERKNNK9);
    hasil.F1ScoreKNNK11 = mean(F1ScoreKNNK11);
    hasil.HTERKNNK11 = mean(HTERKNNK11);
    hasil.F1ScoreKNNK21 = mean(F1ScoreKNNK21);
    hasil.HTERKNNK21 = mean(HTERKNNK21);
    hasil.F1ScoreKNNK31 = mean(F1ScoreKNNK31);
    hasil.HTERKNNK31 = mean(HTERKNNK31);
    hasil.F1ScoreKNNK51 = mean(F1ScoreKNNK51);
    hasil.HTERKNNK51 = mean(HTERKNNK51);
    hasil.F1ScoreKNNK71 = mean(F1ScoreKNNK71);
    hasil.HTERKNNK71 = mean(HTERKNNK71);
    hasil.F1ScoreKNNK91 = mean(F1ScoreKNNK91);
    hasil.HTERKNNK91 = mean(HTERKNNK91);
    hasil.F1ScoreKNNK111 = mean(F1ScoreKNNK111);
    hasil.HTERKNNK111 = mean(HTERKNNK111);
    hasil.F1ScoreSVMLinear = mean(F1ScoreSVMLinear);
    hasil.HTERSVMLinear = mean(HTERSVMLinear);
    hasil.F1ScoreSVMRBF = mean(F1ScoreSVMRBF);
    hasil.HTERSVMRBF = mean(HTERSVMRBF);
    hasil.F1ScoreSVMOutlier = mean(F1ScoreSVMOutlier);
    hasil.EERSVMOutlier = mean(EERSVMOutlier);
    hasil.F1ScoreSVMGaussian = mean(F1ScoreSVMGaussian);
    hasil.EERSVMGaussian = mean(EERSVMGaussian);
    hasil.F1ScoreSVMPolynomial = mean(F1ScoreSVMPolynomial);
    hasil.HTERSVMPolynomial = mean(HTERSVMPolynomial);
    hasilKlasifikasi = [hasilKlasifikasi;hasil];
 save hasilKlasifikasiSkenario2.mat hasilKlasifikasi
