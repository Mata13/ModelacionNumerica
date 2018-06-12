clear all;
close all; 
clc

%Este script es para resolver el Problema de Valor en la Frontera (PVF) no lineal a
%través de su descomposición en un PVI(método de disparo no lineal)

%Resolviendo el problema
%y''(t)=-2(y*y'+t*y'+y+t)
%y(1)=0, y(2)=-2

alfa=0;
beta=-2;

%Parámetros del dominio
stp=0.01;
a=1;
b=2; 
 
%Discretizar el dominio
t=a:stp:b;

%Estimar el valor de m0
m0=(beta-alfa)/(2-1);

%Tolerancia
T=1e-7;

ab=1;

while ab > T
   
    %Condiciones iniciales
    y1=0;
    yp1=m0;
    z1=0;
    zp1=1;

%Estas ecuaciones corresponden al PVI en que se transformó el PVF cuya
%solución para y resuelve el problema y las soluciones del PVI que
%corresponden a la iteración necesaria en el caso que no se cumpla la
%tolerancia

    F=inline('yp','t','y','yp','z','zp');
    G=inline('(-2*(y*yp+t*yp+y+t))','t','y','yp','z','zp');
    H=inline('zp','t','y','yp','z','zp');
    K=inline('z*(-2*yp-2)+zp*(-2*y-2*t)','t','y','yp','z','zp');

%Resolvemos este sistema con el método de Runge-Kutta de Orden 4
%Para resolver el problema sólo necesitamos la ecuación y y z

    [t,y,yp,z,zp]=RK44DMeth(F,G,H,K,a,b,y1,yp1,z1,zp1,stp);

%Obteniendo la longitud del dominio
    n=length(y);
    o=length(z);
%Evaluando y y z en b
    yb=y(n);
    zb=z(o);

%Actualizando dif

    dif=yb-beta;
    ab=abs(dif)

%Actualizando m0    
    m0=m0-(dif/zb);

    figure(1)
    h1=plot(t,y,'b');
    ylabel('y(t)')
    xlabel('t')
    title('Soluciones al PVF y´´(t)=-2(yy´+ty´+y+t)')
    hold on
  
     if ab < T
         h2=plot (t,y,'r');
         
         legend([h1,h2],'Disparos','Mejor Solución')
         
         
     end    
         
                  
end


    
    
    
 




