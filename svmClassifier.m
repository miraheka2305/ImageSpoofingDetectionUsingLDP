function [mdlSVM,classifyResultSVM] = svmClassifier(featureTrain,labelTrain,featureTest)
    
    mdlSVM = fitcsvm(featureTrain,labelTrain);
    classifyResultSVM = predict(mdlSVM,featureTest);

end

