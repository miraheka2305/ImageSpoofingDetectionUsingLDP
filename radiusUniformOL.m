function [hist] = radiusUniformOL(mat,r)
    binValue = [1,2,4,8,16,32,64,128];
    %source Wikipedia
    uniformVal = [0,1,2,3,4,6,7,8,12,14,15,16,24,28,30,31,32,48,56,60,62,63,64,96,112,120,124,126,127,128,129,131,135,143,159,191,192,193,195,199,207,223,224,225,227,231,239,240,241,243,247,248,249,251,252,253,254,255];
    hist = zeros(1,59);
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
            sumUniform = sum(diff(temp)~=0);
            tempCheck = [temp(1,1),temp(1,8)];
            tempCheck = sum(diff(tempCheck)~=0);
            if (tempCheck == 1)
                totUniform = sumUniform + tempCheck;
            else
                totUniform = sumUniform;
            end
            totTemp = sum(binValue.*temp);
            if (totUniform<=2)
                %histVal = (sum(binValue.*temp)- N(sum(binValue.*temp)))+1;
                histVal = (find(uniformVal == totTemp));
                hist(1,histVal) = hist(1,histVal)+1;
            else
               hist(1,59) = hist(1,59)+1;
            end
            %histVal= sum(binValue.*temp)+1;
            %
%             hist(1,histVal)= hist(1,histVal)+1;
        end
    end
end

