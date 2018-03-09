function [crossValIndex] = crossVal(path,kFold)
    dataSet = dir(path);
    crossValIndex = [];
    a= 0;
    for ii = 3:4
        folderPath = strcat(path,'/',dataSet(ii).name);
        label = dataSet(ii).name;
        folderOpen = dir(folderPath);
        for jj = 3:length(folderOpen)
            index=[];
            folderOpenPath = strcat(folderPath,'/',folderOpen(jj).name);
            folder = dir(strcat(folderOpenPath,'/*.bmp'));
            index = crossvalind('Kfold', length(folder), kFold);
            crossValIndex = [crossValIndex;index];
        end
              
    end
end