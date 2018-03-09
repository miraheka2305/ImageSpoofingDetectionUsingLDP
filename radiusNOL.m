function [hist] = radiusNOL(mat,r)
    binValue = [1,2,4,8,16,32,64,128];
    hist = zeros(1,256);
    x = (1+2*r);
    modMat = mod(size(mat,1),x);
    if ((modMat ~= 0) && (modMat >= round(x/2))) 
        y = x - modMat;
        colZer = zeros(size(mat,1),y);
        horCat = [mat,colZer];
        rowZer = zeros(y,size(horCat,2));
        mat = [horCat;rowZer];
    else 
        mat = mat(1:(size(mat,1)-modMat),1:(size(mat,2)-modMat));
    end
    for ii = (r+1):x:(size(mat,1))
        for jj = (r+1):x:(size(mat,1))
            temp = [];
            temp(1,1) = (mat(ii-r,jj-r)*mat(ii,jj)<= 0);
            temp(1,2) = (mat(ii-r,jj)*mat(ii,jj)<= 0);
            temp(1,3) = (mat(ii-r,jj+r)*mat(ii,jj)<= 0);
            temp(1,4) = (mat(ii,jj+r)*mat(ii,jj)<= 0);
            temp(1,5) = (mat(ii+r,jj+r)*mat(ii,jj)<= 0);
            temp(1,6) = (mat(ii+r,jj)*mat(ii,jj)<= 0);
            temp(1,7) = (mat(ii+r,jj-r)*mat(ii,jj)<= 0);
            temp(1,8) = (mat(ii,jj-1)*mat(ii,jj)<= 0);
            histVal= sum(binValue.*temp)+1;
            hist(1,histVal)= hist(1,histVal)+1;
        end
    end
end

