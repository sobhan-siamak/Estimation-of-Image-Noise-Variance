

% clc
% clear 
% close all

im=imread('cameraman.tif');
figure,
imshow(im);
% im2=rgb2gray(im);
im2=im2double(im);

imagenoise=imnoise(im2,'gaussian',0.5,0.07);%%%%%mean=0.5 and var=0.07
figure,
imshow(im2);
figure,
imshow(imagenoise);

% im3=imgaussfilt(imagenoise);
h=fspecial('gaussian',[4 4],0.7);
% h=fspecial('unsharp');
% im3=wiener2(imagenoise,[5 5]);9 
im3=imfilter(imagenoise,h,'replicate');


figure,
imshow(im3);




