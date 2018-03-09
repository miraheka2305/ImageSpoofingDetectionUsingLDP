%Deskripsi : program ini diperuntukan untuk proses pengujian akhir
clc
clear
%
%Train%
path = ('D:/Documents/College/Semester7/TugasAkhir/Semangat/dataTrain');
[dataTrain] = getAllData(path);
save DataTrain.mat dataTrain
%%
kFold = 7;
path = ('D:/Documents/College/Semester7/Semangat/dataTrain');
[crossValIndex] = crossVal(path,kFold);
save crossValIndex.mat crossValIndex kFold

%%
%Testing
pathTest = ('D:/Documents/College/Semester7/TugasAkhir/Semangat/dataTest');
[data] = getAllData(pathTest);
save DataTest.mat data