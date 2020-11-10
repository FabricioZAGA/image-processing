%%Ajuste de Imagen
foto = imread('craneo.jpg');

immod = imadjust(foto, [0,1], [1,0]);

subplot(1,2,1); imshow(foto);
subplot(1,2,2); imshow(immod);

%% Histograma de imagen
foto = imread('admin.png');
foto = im2uint8(foto(:,:,1));
H = imhist(foto)
axis([0 255 0 15000])
set(gca, 'xtick', 0:50:255);
set(gca, 'ytick', 0:2000:15000);

%%
foto = imread('craneo.jpg');
x = rgb2gray(foto);
xad2 = imadjust(x, [0.2, 0.9], [0.3, 0.8], 5);
imshow(xad2);