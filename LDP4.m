function [mat0, mat45, mat90, mat135] = LDP4(data)
    mat0 = double(zeros(size(data,1),size(data,2)));
    mat45 = double(zeros(size(data,1),size(data,2)));
    mat90 = double(zeros(size(data,1),size(data,2)));
    mat135 = double(zeros(size(data,1),size(data,2)));
    data = double(data);
    x = padarray(data,[3 3]);
    for ii = 4:(size(x,1)-3)
        for jj= 4:(size(x,2)-3)
            mat0(ii-3,jj-3) = x(ii,jj)+(3*x(ii,jj+2))-(3*x(ii,jj+1))-x(ii,jj+3);
            mat45(ii-3,jj-3) = x(ii,jj)+(3*x(ii-2,jj+2))-(3*x(ii-1,jj+1))-x(ii-3,jj+3);
            mat90(ii-3,jj-3) = x(ii,jj)+(3*x(ii-2,jj))-(3*x(ii-1,jj))-x(ii-3,jj);
            mat135(ii-3,jj-3) = x(ii,jj)+(3*x(ii-2,jj-2))-(3*x(ii-1,jj-1))-x(ii-3,jj-3);
        end
    end
end

