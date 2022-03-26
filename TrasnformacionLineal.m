clear all;
clc

% Imagen=imread('gato3.jpg'); 
% [FilasImagen,ColumnasImagen,capas]= size(Imagen); 
 
 for y=1:1:1000
     for x=1:1:1000
         if x < round(sqrt(100^2-y^2))
             Imagen(x,y)=0;
         else
             Imagen(x,y) = 255;
         end
     end
 end 
 FilasImagen =x;
 ColumnasImagen =y;

angulo=45; %en grados
angulo=2*pi*angulo/360; %Pasado a radianes  

FilasLienzo=ceil(FilasImagen*abs(cos(angulo))+ColumnasImagen*abs(sin(angulo)));                      
ColumnasLienzo=ceil(FilasImagen*abs(sin(angulo))+ColumnasImagen*abs(cos(angulo)));                     

%Especificar Lienzo de fondo blanco
Lienzo=255*uint8(ones([FilasLienzo ColumnasLienzo 3 ]));

%Calcular el centro de las  imagenes inicial y Lienzo Rotado
XCentroImagen=ceil(FilasImagen/2);                                                            
YCentroImagen=ceil(ColumnasImagen/2);

XCentroLienzo=ceil((size(Lienzo,1))/2);
YCentroLienzo=ceil((size(Lienzo,2))/2);

Lienzo=256*uint8(ones([FilasLienzo ColumnasLienzo 3 ]));
for angulo = 0:5:360
    ang=2*pi*angulo/360; %Pasado a radianes     
    for i=1:size(Lienzo,1)
        for j=1:size(Lienzo,2)                                                       

            Tinv=[
                cos(ang)  sin(ang);
                -sin(ang)  cos(ang)
              ];
% %             Tinv=[
% %                 0.5  0;
% %                 0  2
% %               ];
          
            C = Tinv*[(i-XCentroLienzo) (j-YCentroLienzo)]';                             
% %             C = T*[(i) (j)]';                             
            
            x=round(C(1,1))+XCentroImagen;
            y=round(C(2,1))+YCentroImagen;
% %             x=round(C(1,1));
% %             y=round(C(2,1));

            if (x>=1 && y>=1 && x<=size(Imagen,1) &&  y<=size(Imagen,2) ) 
                Lienzo(i,j,:)= Imagen(x,y,:);  
                %Lienzo(i,j)= Imagen(x,y);  
            end

        end
    end    
    imshow(Lienzo,'InitialMagnification',100);  pause(0.1) 
    Lienzo=256*uint8(ones([FilasLienzo ColumnasLienzo 3 ]));

end

R = Lienzo(:,:,1);
G = Lienzo(:,:,2);
B = Lienzo(:,:,3);
subplot (1,2,1); imshow(R),