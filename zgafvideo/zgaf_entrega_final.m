%% IMAGEN AJEDREZ
xAxis=zeros(32, 32);
yAxis = true;
for i=1:32
   for j=1:4:32
       if yAxis == true
           for k=1:4
            xAxis(i, (j+k-1))=1;
           end
           yAxis = false;
       else
           for k=1:4
            xAxis(i, (j+k-1))=0;
           end
           yAxis = true;
       end
   end
   l=mod(i,4);
   if l==0
       if yAxis == true
           yAxis=false;
       else
          yAxis=true; 
       end
   end
end

imshow(xAxis)
%% DEGRADADO
res=zeros(512,512);
increment=1/(512*512);
counter=0;

for i=1:512
    for j=1:512
        res(i, j)=counter;
        counter=counter+increment;
    end
end

imshow(res);
%% CREACION FOTOGRAMAS
ini = 1; 
maxim=279;

for i=ini:maxim 
    mediapng=sprintf('fabri_%02d',i);
    imageFotogram=imread(mediapng,'png');
    imagesc(imageFotogram);
    axis off;
    paso(i)= getframe;
    pause(1)
    drawnow;
end
%% GRABACION PELICULA
Video = VideoWriter('teemo');
VideoFrameRate = .2;
open(Video);
writeVideo(Video, paso);
close(Video)
%% DIVISION DE COLORES
imag=imread('admin.png', 'png');
imagesc(imag)

img1=imread('admin.png', 'png');
R=img1(:,:,1);
img1(:,:,2)=0;
img1(:,:,3)=0;
image(img1);


img2=imread('admin.png', 'png');
G=img2(:,:,1);
img2(:,:,1)=0;
img2(:,:,3)=0;
image(img2)
 

img3=imread('admin.png', 'png');
B=img3(:,:,1);
img3(:,:,2)=0;
img3(:,:,1)=0;
image(img3)


img4=imread('admin.png', 'png');
A=img4(:,:,3);
img4(:,:,3)=0;
img4(:,:,3)=0;
image(img4)
 

img5=imread('admin.png', 'png');
N=img5(:,:,2);
img5(:,:,2)=76;
img5(:,:,3)=0;
image(img5)


img6=imread('admin.png', 'png');
M=img6(:,:,1);
img6(:,:,2)=0;
image(img6)
 

img7=imread('admin.png', 'png');
RO=img7(:,:,1);
img7(:,:,1)=0;
img7(:,:,1)=10;
image(img7)
 

subplot(3,3,1);imagesc(imag); axis off; title ('Original');
subplot(3,3,2);imagesc(img1); axis off; title ('Rojo');
subplot(3,3,3);imagesc(img2); axis off; title ('Verde')
subplot(3,3,4);imagesc(img3); axis off;  title ('Azul')
subplot(3,3,5);imagesc(img4); axis off;  title ('Amarillo')
subplot(3,3,6);imagesc(img5); axis off;  title ('Naranja')
subplot(3,3,8);imagesc(img6); axis off;  title ('Rosa')
subplot(3,3,7);imagesc(img7); axis off;  title ('Cyan')
