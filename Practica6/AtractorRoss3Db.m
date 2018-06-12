% Atractor de Rossler b): x'= -y-z; y'= x+Ay; z'= B + Z(x-C), 
% donde A=0.1; B=0.1; C=14


% Discretizamos el dominio

stp=0.01; % stp representa la h
a=0;
b=250;
t=a:stp:b;

% Condiciones iniciales x0, y0, z0.

x0=6;
y0=2;
z0=1;

% Definimos las funciones f, g, h para el problema 

% Usamos A=0.1; B=0.4; C=43.



f=inline('-y-z','t','x','y','z');
g=inline('x+(0.1*y)','t','x','y','z');
h=inline('0.4+z*(x-43)','t','x','y','z');

[t,x,y,z]=RK43Dmethod2(f,g,h,a,b,x0,y0,z0,stp);

figure (1)
subplot(3,1,1)
plot(t,x)
ylabel('x')
xlabel('t')
title('Soluciones')

subplot(3,1,2)
plot(t,y)
ylabel('y')
xlabel('t')

subplot(3,1,3)
plot(t,z)
ylabel('z')
xlabel('t')


figure (2)
plot3(x,y,z)
xlabel('x')
ylabel('Y')
zlabel('z')
title('Espacio Fase')