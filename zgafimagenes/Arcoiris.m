%%Arcoiris

imag=imread('kabal.jpg', 'jpg');
imagesc(imag)

 %ROJO
imag1=imread('kabal.jpg', 'jpg');
R=imag1(:,:,1);
 imag1(:,:,2)=0;
 imag1(:,:,3)=0;

 image(imag1);
 %VERDE
imag2=imread('kabal.jpg', 'jpg');
G=imag2(:,:,1);
imag2(:,:,1)=0;
imag2(:,:,3)=0;
 
 image(imag2)
 
 %AZUL
imag3=imread('kabal.jpg', 'jpg');
B=imag3(:,:,1);
imag3(:,:,2)=0;
imag3(:,:,1)=0;

 image(imag3)
 %AMARILLO
imag4=imread('kabal.jpg', 'jpg');
 A=imag4(:,:,3);
imag4(:,:,3)=0;
imag4(:,:,3)=0;
 
 image(imag4)
 
 %NARANJA
imag5=imread('kabal.jpg', 'jpg');
 N=imag5(:,:,2);
imag5(:,:,2)=76;
imag5(:,:,3)=0;
 
 image(imag5)
 %MORADO
imag6=imread('kabal.jpg', 'jpg');

 M=imag6(:,:,1);
%imag6(:,:,2)=70;
imag6(:,:,2)=0;

 image(imag6)
 
 %ROSA
 imag7=imread('kabal.jpg', 'jpg');
 RO=imag7(:,:,1);
imag7(:,:,1)=0;
imag7(:,:,1)=10;

 image(imag7)
 
 %IMPRESION
 subplot(3,3,1);imagesc(imag); axis off; title ('Original');
 subplot(3,3,2);imagesc(imag1); axis off; title ('Rojo');
 subplot(3,3,3);imagesc(imag2); axis off; title ('Verde')
 subplot(3,3,4);imagesc(imag3); axis off;  title ('Azul')
 subplot(3,3,5);imagesc(imag4); axis off;  title ('Amarillo')
 subplot(3,3,6);imagesc(imag5); axis off;  title ('Naranja')
 subplot(3,3,7);imagesc(imag7); axis off;  title ('Cyan')
 subplot(3,3,8);imagesc(imag6); axis off;  title ('Rosa')
 
 
 
 
 