% Atractor de Lorenz: x' = sigma(y-x); y'= ro x - y -xy; z'= -beta z +
% xy, Usamos sigma = 10, rho = 21, beta = 3/2


% Discretizamos el dominio

stp=0.01; % stp representa la h
a=0;
b=200;
t=a:stp:b;

% Condiciones iniciales x0, y0, z0.

x0=10;
y0=6;
z0=1;

% Definimos las funciones f, g, h para el problema 

% Usamos sigma = 10, rho = 21, beta = 3/2



f=inline('10*(y-x)','t','x','y','z');
g=inline('x*(21-z)-y','t','x','y','z');
h=inline('x*y-(3/2)*z','t','x','y','z');

[t,x,y,z]=RK43Dmethod3(f,g,h,a,b,x0,y0,z0,stp);

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