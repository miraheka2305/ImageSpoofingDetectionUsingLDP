function [featureTrain,labelTrain,featureTest,labelTest] = struct2Matrix(extractionLDPTrain,extractionLDPTest)
    x = rmfield(extractionLDPTrain,'label');
    y = struct2cell(x);
    z = cell2mat(y);
    featureTrain = reshape(z,size(z,2),size(z,3))';
    a = rmfield(extractionLDPTrain,'feature');
    b = struct2cell(a);
    c = cell2mat(b);
    d = reshape(c,size(c,2),size(c,3))';
    labelTrain = str2num(d);
    
    i = rmfield(extractionLDPTest,'label');
    j = struct2cell(i);
    k = cell2mat(j);
    featureTest = reshape(k,size(k,2),size(k,3))';
    l = rmfield(extractionLDPTest,'feature');
    m = struct2cell(l);
    n = cell2mat(m);
    p = reshape(n,size(n,2),size(n,3))';
    labelTest = str2num(p);
end

