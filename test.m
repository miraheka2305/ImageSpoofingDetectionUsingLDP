% image = imread('1.bmp');
% a = randi(10,5);
%%
% figure;imshow(image)
[mat0, mat45, mat90, mat135] = LDP2(a);
r = 1
[hist0] = radiusOL(mat0,r)
[hist45] = radiusOL(mat45,r)
[hist90] = radiusOL(mat90,r)
[hist135] = radiusOL(mat135,r)
LDPFeature = [hist0,hist45,hist90,hist135];
%%
figure;bar(hist0)
figure;bar(hist45)
figure;bar(hist90)
figure;bar(hist135)
figure;bar(LDPFeature)

%%
% figure;imshow(mat0)
% figure;imshow(mat45)
% figure;imshow(mat90)
% figure;imshow(mat135)
% % [hist] = radiusOL(mat0,5);
% % xlabel('Bin Histogram')
% % ylabel('Frekuensi Histogram')
% % figure; bar(hist)
% % 
% % LDPFeature = histConcat(mat0,mat45,mat90,mat135,5,1)
% %  
% % load extractionLDP_R5_Overlapping_NonUniform_LDP2.mat
% % featureTrain = [];
% % labelTrain = [];
% % for ii = 1:size(extractionLDPTrain,2)
% %         featureTrain(ii,:) = extractionLDPTrain(ii).feature;
% %         labelTrain(ii) = str2num(extractionLDPTrain(ii).label);
% %         ii
% % end
% % mdlSVM = fitcsvm(featureTrain,labelTrain,'Standardize',true,'KernelFunction','RBF',...
% %         'KernelScale','auto')
% % classifyResultSVM = predict(mdlSVM,LDPFeature)
% % 
% % %%
% % TP = 3;
% % TN = 41;
% % FP = 4;
% % FN = 10;
% % 
% % FAR = (FP/(TN+FP))
% % FRR = (FN/(TP+FN))
% % HTER = (FAR+FRR)/2
% % ERR = (FP+FN)/(TP+TN+FP+FN)
% % 
% % %%
% % % tes1 = imread('imageSpoof.bmp')
% % % tes1 = imresize(tes1,[64 64])
% % % tes1 = rgb2gray(tes1)
% % % %%
% % imwrite(tes1,'imageSpoofGrey.bmp')
% 
% [extractionLDP] = featureExtraction(data,1,2,2)
% [extractionLDPTrain] = featureExtraction(dataTrain,1,2,2)
% 
% [featureTrain,labelTrain,featureTest,labelTest] = struct2Matrix(extractionLDPTrain,extractionLDP);
% %     x = rmfield(extractionLDPTrain,'label');
% %     x = rmfield(x,'timeEnd');
% %     y = struct2cell(x);
% %     z = cell2mat(y);
% %     featureTrain = reshape(z,size(z,2),size(z,3))';
% %     a = rmfield(extractionLDPTrain,'feature');
% %     a = rmfield(a,'timeEnd')
% %     b = struct2cell(a);
% %     c = cell2mat(b);
% %     d = reshape(c,size(c,2),size(c,3))';
% %     labelTrain = str2num(d);
% %%    
% tic
% mdlSVM = fitcsvm(featureTrain,labelTrain');
% classifyResultSVM = predict(mdlSVM,featureTest)
% [TN,TP,FP,FN,Accuracy,Precision,Recall,F1ScoreSVM,FRR,FAR,HTER] = confusionMatrix(labelTest,classifyResultSVM);
% waktu = toc