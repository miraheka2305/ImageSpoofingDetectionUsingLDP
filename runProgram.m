path = 'D:\Documents\College\Semester7\TugasAkhir\Program2010';
dataExtraction = dir(path);
%%
for ii = 14:73
    load (dataExtraction(ii).name)
    model(ii-13).name = dataExtraction(ii).name;
    model(ii-13).extractionTrain = extractionLDPTrain;
    ii
    modelLabel(ii-13,1) = option;
    modelLabel(ii-13,2) = LDP;
    modelLabel(ii-13,3) = r;
end

%%
extractionLDPTrain = model(1).extractionTrain
    for ii = 1:size(extractionLDPTrain,2)
        featureTrain(ii,:) = extractionLDPTrain(ii).feature;
        labelTrain(ii) = str2num(extractionLDPTrain(ii).label);
    end
    
    
    %%
    option = 2;
    radius = 2;
    LDP = 2;
    x = find((modelLabel(:,1) == option) && (modelLabel(:,2)  == LDP) && (modelLabel(:,3) == radius))
    x = find((modelLabel(:,1) == option) && (modelLabel(:,2)  == LDP) && isequal(modelLabel(:,3),radius))