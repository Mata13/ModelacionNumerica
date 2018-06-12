 % El PVI y'' + xy' + y = 0, 0 <= x <= 10, y(0)=1, y'(0)=2

% Resolviendo usando el cambio de variable, obtenemos 2 ecuaciones lineales

% Discretizamos el dominio

stp=0.01; %stp representa la h
a=0;
b=10;
t=a:stp:b;

% Condiciones iniciales u0, v0. No funciona si pongo u(0)=1 y v(0)=2

u0=1;
v0=2;

% Definimos las funciones f y g para el problema 


f=inline('v','t','u','v');
g=inline('(-t*v)-u','t','u','v');

[t,u,v]=RK42Dmethod1(f,g,a,b,u0,v0,stp);

figure (1)
subplot(2,1,1)
plot(t,u)
ylabel('Y')
title('Solución y(t)')

subplot(2,1,2)
plot(t,v)
ylabel('Y')
xlabel('t')


figure (2)
plot(u,v)
xlabel('Y')
ylabel('Y´')
title('Espacio Fase')
