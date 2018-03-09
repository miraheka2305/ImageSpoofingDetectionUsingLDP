function [TN,TP,FP,FN,Accuracy,Precision,Recall,F1Score,FRR,FAR,HTER] = confusionMatrix(labelTest,result)
% 0 = negatif
% 1 = positif  
TN = 0;
TP = 0;
FP = 0;
FN = 0;
    for jj = 1:size(labelTest,1)
        if (labelTest(jj) == 1)
            if (result(jj)== 1)
                TP = TP + 1;
            elseif (result(jj) == 0)
                FN = FN + 1;
            end
        elseif (labelTest(jj) == 0)
                if (result(jj) == 0)
                    TN = TN + 1;
                elseif (result(jj) == 1)
                    FP = FP + 1;
                end
        end
    end
    
    Accuracy = (TP+TN)/(TP+FP+FN+TN);
    Precision = (TP)/(TP+FP);
    Recall = (TP)/(TP+FN);
    F1Score = ((2*(Recall * Precision))/(Recall+Precision));
 
    
    FRR = ((FN)/(TP+FN));
    FAR = ((FP)/(TN+FP));
    HTER = ((FAR+FRR)/2);
end

