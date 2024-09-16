img3=imread('MRI.jpg'); 
img3=rgb2gray(img3);
t1 = 50;  t2 = 180;  % set a low and high threshold for contrast adjustment

img3_3 = double(img3);   % initialize an array with equal size as img3
s1 = (img3(:,:) >= t1);

s2 = (img3(:,:) <= t2);
s3 = (img3_3(:,:) - t1) * 255 / (t2 - t1);
s4 = (img3(:,:) > t2) * 255 + (img3(:,:) < t1) * 0;
s5 = (img3(:,:) > t2) * 160 + (img3(:,:) < t1) * 5;
s6 = (img3(:,:) > t2) * 110 + (img3(:,:) < t1) * 23;
s7 = (img3(:,:) > t2) * 90 + (img3(:,:) < t1) * 40;
s8 = (img3_3(:,:) - t1) * 90/ (t1 + t2);
s9 = (img3_3(:,:) - t2) * 180/ (t2 - t1);
s10 = (img3_3(:,:) - t2) * 1/ (t2 +t1);

img3_3 = double(s1 & s2) .* ...
           (s3) +(s4)+ (s5)+(s6)+(s7)+(s8)+(s9)... 
           +(s10);
img3_3 = uint8(img3_3);  % convert data type back to uint8

figure(1),subplot(2,2,1);imshow(s1);
figure(1),subplot(2,2,2);imshow(s2);
figure(1),subplot(2,2,3);imshow(s3);
figure(1),subplot(2,2,4);imshow(s4);
figure(2),subplot(2,2,1);imshow(s5);
figure(2),subplot(2,2,2);imshow(s6);
figure(2),subplot(2,2,3);imshow(s7);
figure(2),subplot(2,2,4);imshow(s8);
figure(3), imshow(img3_3);
figure(4),subplot(2,2,1);imshow(s9);
figure(4),subplot(2,2,2);imshow(s10);
% figure(4),subplot(2,2,3);imhist(s3);
% figure(4),subplot(2,2,4);imhist(s4);
% figure(5),subplot(2,2,1);imhist(s5);
% figure(5),subplot(2,2,2);imhist(s6);
% figure(5),subplot(2,2,3);imhist(s7);
% figure(5),subplot(2,2,4);imhist(s8);
% figure(6), imhist(img3);