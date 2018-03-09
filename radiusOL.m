function [hist] = radiusOL(mat,r)
    binValue = [1,2,4,8,16,32,64,128];
    hist = zeros(1,256);
%     LDPfeature = zeros(size(mat,1),size(mat,2));
    mat = padarray(mat,[r r]);
    for ii = (r+1):(size(mat,1)-r)
        for jj = (r+1): (size(mat,2)-r)
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

