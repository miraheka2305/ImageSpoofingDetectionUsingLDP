function [data] = getAllData(path)
dataSet = dir(path);
data = [];
for hh=3:4 
    folderPath = strcat(path,'/',dataSet(hh).name);
    label = dataSet(hh).name;
    folderOpen = dir(folderPath);
    for ii=3:length(folderOpen)
       folderOpenPath = strcat(folderPath,'/',folderOpen(ii).name);
       folder = dir(strcat(folderOpenPath,'/*.bmp'));
       for jj = 1:length(folder)
           imageName = folder(jj).name;
           imageFile = strcat(folderOpenPath,'/',imageName);
           imageData.name = imageName;
           imageData.image = imread(imageFile);
           imageData.label = (label);  
           data = [data;imageData;];
       end
    end
end
end

