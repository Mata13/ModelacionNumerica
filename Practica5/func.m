clear all;
close all; 
clc

%Parámetros

h=0.5;
x0=0;
xf=4;
x=x0:h:xf; %discretizar el dominio
y0=1; %condicion inicial
f=inline('-2*x.^3+12*x.^2-20*x+8.5','x','y');
sol1=HeunMeth(f,x0,xf,y0,h);
sol2=PuntoMedMeth(f,x0,xf,y0,h);
sol3=RRMeth(f,x0,xf,y0,h);
sol4=R4Meth(f,x0,xf,y0,h);
sol5=R5Meth(f,x0,xf,y0,h);
sol6=-0.5*x.^4+4*x.^3-10*x.^2+8.5*x+y0; %solución analítica

%Errores relativos
ErrHeun=abs((sol6-sol1)./sol6)*100;
ErrPuntoMed=abs((sol6-sol2)./sol6)*100;
ErrRR=abs((sol6-sol3)./sol6)*100;
ErrR4=abs((sol6-sol4)./sol6)*100;
ErrR5=abs((sol6-sol5)./sol6)*100;

figure(1)
hold on
plot(x,sol1,'r')
plot(x,sol2,'g')
plot(x,sol3,'b')
plot(x,sol4,'c')
plot(x,sol5,'m')
plot(x,sol6,'k')
xlabel('x')
ylabel('y(x)')
title('Solución de la EDO')
legend('Heun', 'Punto Medio','Ralston-Rabinowitz','Orden 4','Orden 5','Analítica')

figure(2) %gráfica de los errores
hold on
plot(x,ErrHeun)
plot(x,ErrPuntoMed)
plot(x,ErrRR)
plot(x,ErrR4)
plot(x,ErrR5)
xlabel('x')
ylabel('Error (%)')
title('Gráfica de error')
legend('Heun', 'Punto Medio','Ralston-Rabinowitz','Orden 4','Orden 5')

