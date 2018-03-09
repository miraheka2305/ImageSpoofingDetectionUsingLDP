path = ('F:/#UNDELETE/2014/Mirah/EkstraksiCiri/time')
folder = dir(strcat(path,'/*.bmp'));
load extractionLDP_R5_Overlapping_Uniform_LDP2.mat
timeUniform = [];
timeExtraction = [];
for ii = 1:length(folder)
    tic
    imageName = folder(ii).name;
    excecution.name = imageName;
    imageFile = strcat(path,'/',imageName);
    imageData = imread(imageFile);
    [LDPFeature,timeEnd] = featureExtraction(imageData,r,option,LDP);
    timeExtraction = [timeExtraction;timeEnd];
    
    x = rmfield(extractionLDPTrain,'label');
    y = struct2cell(x);
    z = cell2mat(y);
    featureTrain = reshape(z,size(z,2),size(z,3))';
    a = rmfield(extractionLDPTrain,'feature');
    b = struct2cell(a);
    c = cell2mat(b);
    d = reshape(c,size(c,2),size(c,3))';
    labelTrain = str2num(d);
    mdlSVM = fitcsvm(featureTrain,labelTrain','Standardize',true,'KernelFunction','RBF',...
        'KernelScale','auto');
    classifyResultSVM = predict(mdlSVM,LDPFeature)
    excecution.timeEnd = toc;
    timeUniform = [timeUniform; excecution];
end

    timeExtractionUniform = mean(timeExtraction)
    %%
    timeUniformMean = mean([timeUniform.timeEnd])
    save timeUniform.mat timeExtractionUniform timeUniform timeExtraction timeUniformMean