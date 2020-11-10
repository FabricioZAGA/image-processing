%%ajuste logaritmico
foto = imread('craneo.jpg');
i = foto;
j = 10*log(1 + double(i));
subplot(1,2,1);imshow(i);
subplot(1,2,2);imshow(j/110);

%%Image Crop
foto = imread('craneo.jpg');
