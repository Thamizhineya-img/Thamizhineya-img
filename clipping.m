 %% This is an example file that illustrates how to run MMSICHE algorithm
clc
clear all
close all 
x0=imread('MRI.jpg');  
if(size(x0,3)~=1)
    x0 = rgb2gray(x0);
    x0=uint8(x0);
end
MMSICHEoutput=MMSICHE_ALGO(x0);
s=fft2(MMSICHEoutput);
strcmp(class(x0),'uint8')
MMSICHEoutput1 = uint8(MMSICHEoutput);
s1=fft2(MMSICHEoutput1);
strcmp(class(x0),'uint16')
     MMSICHEoutput2 = uint16(MMSICHEoutput);
     s2=fft2(MMSICHEoutput2);
strcmp(class(x0),'int16')
     MMSICHEoutput3 = int16(MMSICHEoutput);
    
strcmp(class(x0),'single')
     MMSICHEoutput4 = single(MMSICHEoutput);
     s4=fft2(MMSICHEoutput4);


% subplot(1,2,1);imshow(x0,[]);xlabel('Original');
% subplot(1,2,2);imshow(MMSICHEoutput,[]);xlabel('MMSICHE')
figure(1),subplot(2,2,1);imshow(MMSICHEoutput1,[]);xlabel('MMSICHE1')
figure(1),subplot(2,2,2);imshow(MMSICHEoutput2,[]);xlabel('MMSICHE2')
figure(1),subplot(2,2,3);imshow(MMSICHEoutput3,[]);xlabel('MMSICHE3')
figure(1),subplot(2,2,4);imshow(MMSICHEoutput4,[]);xlabel('MMSICHE4')

figure(2),subplot(2,2,1);imhist(MMSICHEoutput1);
figure(2),subplot(2,2,2);imhist(MMSICHEoutput2);
figure(2),subplot(2,2,3);imhist(MMSICHEoutput3);
figure(2),subplot(2,2,4);imhist(MMSICHEoutput4);

figure(3),subplot(2,2,1);imshow(s1);
figure(3),subplot(2,2,2);imshow(s2);
%figure(3),subplot(2,2,3);imshow(s3);
figure(3),subplot(2,2,4);imshow(s4);
