clear all;
clc

Imagen=imread('Gato.jpg'); 
[FilasImagen,ColumnasImagen,capas]= size(Imagen);

angulo=45; %en grados
angulo=2*pi*angulo/360; %Pasado a radianes  

FilasLienzo=2*ceil(FilasImagen*abs(cos(angulo))+ColumnasImagen*abs(sin(angulo)));                      
ColumnasLienzo=2*ceil(FilasImagen*abs(sin(angulo))+ColumnasImagen*abs(cos(angulo)));                     

%Especificar Lienzo de fondo blanco
Lienzo=255*uint8(ones([FilasLienzo ColumnasLienzo 3 ]));

%Calcular el centro de las  imagenes inicial y Lienzo Rotado
XCentroImagen=ceil(FilasImagen/2);                                                            
YCentroImagen=ceil(ColumnasImagen/2);

XCentroLienzo1=ceil((size(Lienzo,1))/4);
YCentroLienzo1=ceil((size(Lienzo,2))/4);

XCentroLienzo2=ceil((size(Lienzo,1))/4);
YCentroLienzo2=ceil(3*(size(Lienzo,2))/4);

XCentroLienzo3=ceil(3*(size(Lienzo,1))/4);
YCentroLienzo3=ceil((size(Lienzo,2))/4);

XCentroLienzo4=ceil(3*(size(Lienzo,1))/4);
YCentroLienzo4=ceil(3*(size(Lienzo,2))/4);

Lienzo=256*uint8(ones([FilasLienzo ColumnasLienzo 3 ]));
for angulo = 0:1:5
    ang=2*pi*angulo/360; %Pasado a radianes     
    for i=1:size(Lienzo,1)
        for j=1:size(Lienzo,2)
            
            Tinv1=[ 1  0;
                    0  1];
            C1 =Tinv1*[(i-XCentroLienzo1) (j-YCentroLienzo1)]';
            x1=round(C1(1,1))+XCentroImagen;
            y1=round(C1(2,1))+YCentroImagen;
            if (x1>=1 && y1>=1 && x1<=size(Imagen,1) &&  y1<=size(Imagen,2) ) 
                Lienzo(i,j,:)= Imagen(x1,y1,:);  
            end
            
            Tinv2=[ 1  0;
                    0  2];
            C2 = Tinv2*[(i-XCentroLienzo2) (j-YCentroLienzo2)]';
            x2=round(C2(1,1))+XCentroImagen;
            y2=round(C2(2,1))+YCentroImagen;
            if (x2>=1 && y2>=1 && x2<=size(Imagen,1) &&  y2<=size(Imagen,2) ) 
                Lienzo(i,j,:)= Imagen(x2,y2,:);  
            end
            
            Tinv3=[ 2  0;
                    0  1];
            C3 = Tinv3*[(i-XCentroLienzo3) (j-YCentroLienzo3)]';
            x3=round(C3(1,1))+XCentroImagen;
            y3=round(C3(2,1))+YCentroImagen;
            if (x3>=1 && y3>=1 && x3<=size(Imagen,1) &&  y3<=size(Imagen,2) ) 
                Lienzo(i,j,:)= Imagen(x3,y3,:);  
            end
            
            Tinv4=[ 2  0;
                    0  2];
            C4 = Tinv4*[(i-XCentroLienzo4) (j-YCentroLienzo4)]';
            x4=round(C4(1,1))+XCentroImagen;
            y4=round(C4(2,1))+YCentroImagen;
            if (x4>=1 && y4>=1 && x4<=size(Imagen,1) &&  y4<=size(Imagen,2) ) 
                Lienzo(i,j,:)= Imagen(x4,y4,:);  
            end
        end
    end    
    imshow(Lienzo,'InitialMagnification',100); 
    Lienzo=256*uint8(ones([FilasLienzo ColumnasLienzo 3 ]));
end