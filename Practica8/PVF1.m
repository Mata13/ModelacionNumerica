% Este script es para resolver el Problema de Valor en la Frontera (PVF)
% por medio de su descomposición en un sistema de dos ecuaciones de segudo
% orden, conocido como método de disparo lineal.

% Dominio del problema

stp=0.1; %stp representa la h
a=0;
b=50;

% Discretizamos el dominio

t=a:stp:b;

% Condiciones iniciales y10, u10, y20, u20

y10=0;
u10=0;
y20=0;
u20=1;

% Parámetros del problema de deformación de una liga

% T=300;   % Tensión [N]
% L=50;    % Longitud de la liga [m]
% V=W=50;  % Peso [N]
% E=1.2e7; % Módulo de elasticidad [kg/m^2]
% I=4;     % Momento de inercia [kg/m]

% Ingresamos las ecuacuiones correspondientes a los PVI de segundo orden cuyas soluciones
% para f y h son necesarias para resolver el PVF

F=inline('g','t','f','g','h','s');
G=inline('(300/(1.2e7)*4)*f+((50*t)*(t-50))/(2*(1.2e7)*4)','t','f','g','h','s');
H=inline('s','t','f','g','h','s');
S=inline('(300/(1.2e7)*4)*h','t','f','g','h','s');

% Resolvemos las ecuaciones por el método de Runge-Kutta de 4to Orden
% En la salida se obtiene

% f=y1
% g=u1
% h=y2
% s=u2

% Para resolver el problema necesitamos resolver f y h

[t,f,g,h,s]=RK44Dmethod1(F,G,H,S,a,b,y10,u10,y20,u20,stp);

% Obtenemos la longitud del dominio

r=length(t);

% Evaluamos f y h en b

y1b=f(r)
y2b=h(r)

% Finalmente la solución al problema es:

yt=f+(-y1b/y2b)*h;

plot(t,yt)
xlabel('t')
ylabel('y(t)= f+(-y1b / y2b)*h')
title('Solución por el Método de Disparo')
