function [ image ] = VarHist( image )



[m,n]=size(image);
image2=image;
avg=zeros(1,9);
for i=2:m-1
    for j=2:n-1
        if(i-1<=m && j-1<=n && i+1<=n && j+1<=m)
            avg=[image(i-1,j-1),image(i-1,j),image(i-1,j+1),image(i,j-1),image(i,j),image(i,j+1),image(i+1,j-1),image(i+1,j),image(i+1,j+1)];
            image2(i,j)=var(avg);
       
        end
        
    end
end


image=image2;



end

