function [classifyResult] = kNNCLassifier(featureTrain,featureTest,labelTrain,k)
for jj = 1:size(featureTest,1)
    euc= zeros;
    %mencari euclidean distance antara histogram latih dengan histogram uji
    for ii = 1 : size(featureTrain,1)
            euc(ii,1) =  norm((featureTest(jj,:))-(featureTrain(ii,:)));
            euc(ii,2) = labelTrain(ii);
    end
    %mengurutkan nilai jarak berdasarkan yang terkecil
    euc = sortrows(euc,1);
    %mengambil nilai terkecil sejumlah k
    euc = euc(1:k,:);
    %memvoting label terbanyak  yang kemudian menjadi hasil klasifikasi
    %dari citra uji
    label = mode(euc(:,2),1);
%     classifyResult(jj,:) = featureTest(jj,1:end-1);
%     classifyResult(jj,end+1) = label;
    classifyResult(jj) = label;
    %menghitung performansi sistem
%     if (classifyResult(jj).label == str2num(extractionLDPTest(jj).label))
%         accSum = accSum+1;
%     end
      
end
% accuracy = (accSum/size(classifyResult,2))*100;

end

