% Atractor de Rossler a): x'= -y-z; y'= x+Ay; z'= B + Z(x-C), 
% Usamos A=0.3, B=0.1, C=10


% Discretizamos el dominio

stp=0.01; % stp representa la h
a=0;
b=200;
t=a:stp:b;

% Condiciones iniciales x0, y0, z0.

x0=8.1
y0=3.8;
z0=1.9;

% Definimos las funciones f, g, h para el problema 

% Usamos A=0.3, B=0.1, C=10


f=inline('-y-z','t','x','y','z');
g=inline('x+(0.3*y)','t','x','y','z');
h=inline('0.1+z*(x-10)','t','x','y','z');

[t,x,y,z]=RK43Dmethod1(f,g,h,a,b,x0,y0,z0,stp);

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