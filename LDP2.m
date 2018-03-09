function [mat0, mat45, mat90, mat135] = LDP2(data)
    mat0 = double(zeros(size(data,1),size(data,2)));
    mat45 = double(zeros(size(data,1),size(data,2)));
    mat90 = double(zeros(size(data,1),size(data,2)));
    mat135 = double(zeros(size(data,1),size(data,2)));
    data = double(data);
    x = padarray(data,[1 1]);
    for ii = 2:(size(x,1)-1)
        for jj= 2:(size(x,2)-1)
            mat0(ii-1,jj-1) = x(ii,jj)-x(ii,jj+1);
            mat45(ii-1,jj-1) = x(ii,jj)-x(ii-1,jj+1);
            mat90(ii-1,jj-1) = x(ii,jj)-x(ii-1,jj);
            mat135(ii-1,jj-1) = x(ii,jj)-x(ii-1,jj-1);
        end
    end
end

