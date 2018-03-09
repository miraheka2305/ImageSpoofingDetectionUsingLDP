function [mat0, mat45, mat90, mat135] = LDP3(data)
    mat0 = double(zeros(size(data,1),size(data,2)));
    mat45 = double(zeros(size(data,1),size(data,2)));
    mat90 = double(zeros(size(data,1),size(data,2)));
    mat135 = double(zeros(size(data,1),size(data,2)));
    data = double(data);
    x = padarray(data,[2 2]);
    for ii = 3:(size(x,1)-2)
        for jj= 3:(size(x,2)-2)
            mat0(ii-2,jj-2) = x(ii,jj)+x(ii,jj+2)-(2*x(ii,jj+1));
            mat45(ii-2,jj-2) = x(ii,jj)+x(ii-2,jj+2)-(2*x(ii-1,jj+1));
            mat90(ii-2,jj-2) = x(ii,jj)+x(ii-2,jj)-(2*x(ii-1,jj));
            mat135(ii-2,jj-2) = x(ii,jj)+x(ii-2,jj-2)-(2*x(ii-1,jj-1));
        end
    end
end

