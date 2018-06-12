%Brenda Arvizu Padilla-Joshua Iván Muñoz Salazar
%1. Aproximar la primer derivada de f(x)=sin(x)+cos(pi*x-2x^2)+x^3 en x=3*pi. 
%Usar fórmulas de dif. finitas hacia adelante, hacia atrás y centradas
%en h=0.001; Calcular la derivada analítica para medir el error relativo 
%en cada caso:
%Err=|(f'_verd-f'_aprox)/f'_verd|*100%

h=0.001;
x=3*pi;
y=sin(x)+cos(pi*x-2*x.^2)+x.^3;
yp=cos(x)-(pi-4*x)*sin(pi*x-2*x.^2)+3*x.^2;

%Dif. finitas hacia adelante
ya=sin(x+h)+cos(pi*(x+h)-2*(x+h).^2)+(x+h).^3;
y_adelante=(ya-y)/h;

%Error
ea=abs((yp-y_adelante)/yp)*100;

%Dif. finitas hacia atrás
yr=sin(x-h)+cos(pi*(x-h)-2*(x-h).^2)+(x-h).^3;
y_atras=(y-yr)/-h;

%Error
er=abs((yp+y_atras)/yp)*100;

%Dif. finitas centradas
y_centradas=(ya-yr)/(2*h);   

%Error
ec=abs((yp-y_centradas)/yp)*100;


