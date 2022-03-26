clear all;
clc

%Crear cuadrado verde
for y=1:1:256
    for x=1:1:256
        Imagen(x,y,1)=0;
        Imagen(x,y,2)=256;
        Imagen(x,y,3)=0;
    end
end 
FilasImagen =x;
ColumnasImagen =y;
 
%Crear cuadrado azul
for y1=1:1:256
    for x1=1:1:256
        Imagen1(x1,y1,1)=0;
        Imagen1(x1,y1,2)=0;
        Imagen1(x1,y1,3)=256;
    end
end 
FilasImagen1 =x1;
ColumnasImagen1 =y1;

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
for angulo = 90:-5:0
    ang=2*pi*angulo/360; %Pasado a radianes     
    for i=1:size(Lienzo,1)
        for j=1:size(Lienzo,2)                                                       

            Tinv=[
                cos(ang)  sin(ang);
                -sin(ang)  cos(ang)
              ];

            C1 = Tinv*[(i-XCentroLienzo1) (j-YCentroLienzo1)]';
            C2 = Tinv*[(i-XCentroLienzo2) (j-YCentroLienzo2)]';
            C3 = Tinv*[(i-XCentroLienzo3) (j-YCentroLienzo3)]';
            C4 = Tinv*[(i-XCentroLienzo4) (j-YCentroLienzo4)]';

            x1=round(C1(1,1))+XCentroImagen;
            y1=round(C1(2,1))+YCentroImagen;
            
            x2=round(C2(1,1))+XCentroImagen;
            y2=round(C2(2,1))+YCentroImagen;
            
            x3=round(C3(1,1))+XCentroImagen;
            y3=round(C3(2,1))+YCentroImagen;
            
            x4=round(C4(1,1))+XCentroImagen;
            y4=round(C4(2,1))+YCentroImagen;

            if (x1>=1 && y1>=1 && x1<=size(Imagen,1) &&  y1<=size(Imagen,2) ) 
                Lienzo(i,j,:)= Imagen(x1,y1,:);  
            end

            if (x2>=1 && y2>=1 && x2<=size(Imagen1,1) &&  y2<=size(Imagen1,2) ) 
                Lienzo(i,j,:)= Imagen1(x2,y2,:);  
            end
            
            if (x3>=1 && y3>=1 && x3<=size(Imagen1,1) &&  y3<=size(Imagen1,2) ) 
                Lienzo(i,j,:)= Imagen1(x3,y3,:);  
            end
            
            if (x4>=1 && y4>=1 && x4<=size(Imagen,1) &&  y4<=size(Imagen,2) ) 
                Lienzo(i,j,:)= Imagen(x4,y4,:);  
            end
        end
    end    
    imshow(Lienzo,'InitialMagnification',100); 
    Lienzo=256*uint8(ones([FilasLienzo ColumnasLienzo 3 ]));
end
close