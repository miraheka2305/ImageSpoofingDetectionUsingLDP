%-Data Test sebesar 30% dari data set-%
path=('D:/Documents/College/Semester7/TugasAkhir/Semangat/dataTrain');
pathMove = ('D:/Documents/College/Semester7/TugasAkhir/Semangat/dataTest');
openFolder = dir(path);
for hh = 3:4
    folderPath = strcat(path,'/',openFolder(hh).name);
    folderOpen = dir(folderPath);
    for ii=3:length(folderOpen)
        folderOpenPath = strcat(folderPath,'/',folderOpen(ii).name);
        folder = dir(strcat(folderOpenPath,'/*.bmp'));
        indexRand = randperm(length(folder));
        totalTest = round(0.3*length(folder));
        for jj = 1: totalTest
               imageNameTest = folder(indexRand(jj)).name;
               imageFileTest = strcat(folderOpenPath,'/',imageNameTest);
               pathMoveFolder = strcat(pathMove,'/',openFolder(hh).name,'/',folderOpen(ii).name);
               movefile(imageFileTest,pathMoveFolder)
        end
    end
end