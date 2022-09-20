%%%%%%%%%%%%%%%% In the name of GOD %%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%@copy  sobhan siamak  9731582

clc;
clear;
close all;

% image1=imread('cameraman.tif');
image1=imread('bone.tif');
% image2=rgb2gray(image1);
image3=im2double(image1);
% image3=im2double(image2);
imhist(image3);
image4=image3;
figure(1)
imshow(image3);
title('Original Image');
[m,n]=size(image4);
% avg=zeros(1,9);
% for i=2:m-1
%     for j=2:n-1
%         if(i-1<=m && j-1<=n && i+1<=n && j+1<=m)
%             avg=[image3(i-1,j-1),image3(i-1,j),image3(i-1,j+1),image3(i,j-1),image3(i,j),image3(i,j+1),image3(i+1,j-1),image3(i+1,j),image3(i+1,j+1)];
%             image4(i,j)=var(avg);
%        
%         end
%         
%     end
% end
image4=VarHist(image4);

figure(2) 
imhist(image4)
title('Var Histogram of Original image ');

imagenoise=imnoise(image3,'gaussian',0,0.02);%%%%%mean=0.5 and var=0.07
figure(3)
imshow(imagenoise);
title('Image with Noise');
figure(4)
imhist(imagenoise);
title('Histogram of Noisy Image');
imagenoise2=VarHist(imagenoise);
figure(5)
imhist(imagenoise2);
title('Var Histogram of Noisy Image');
[x,y]=imhist(imagenoise2);

[mo,index]=max(x);
modarr=y(index);
meanarr=(sum(x.*y))/(sum(x));
midpoint=round(sum(x)/2);
k=size(x);
p=0;
for i=1:k
    p=p+x(i);
    if(p>midpoint)
        ind=i;
        break;
    end
end
medianarr=y(ind);


% h=fspecial('gaussian',[3 3],0.1);
% 
% im=imfilter(imagenoise,h,'replicate');
im=wiener2(imagenoise,[3 3],0.02);

figure(6)
imshow(im);
title('Reconstructed and Denoised Image with Var Estimated');

figure(7)
imhist(VarHist(im));
title('Var Histogram of Reconstructed Image');




% md=0;
