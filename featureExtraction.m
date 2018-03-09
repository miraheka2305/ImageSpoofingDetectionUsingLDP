function [extractionLDP] = featureExtraction(data,r,option,LDP)
    for ii = 1:size(data,1)
        imageData = data(ii).image;
        if(LDP == 2)
            [mat0, mat45, mat90, mat135] = LDP2(imageData);
        elseif (LDP == 3)
            [mat0, mat45, mat90, mat135] = LDP3(imageData);
        elseif (LDP ==4)
            [mat0, mat45, mat90, mat135] = LDP4(imageData);
        end
        [LDPFeature] = histConcat(mat0,mat45,mat90,mat135,r,option);
        extractionLDP(ii).feature = LDPFeature;
        extractionLDP(ii).label = data(ii).label;
    end
end