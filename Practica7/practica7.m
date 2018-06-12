
% Asignamos valores a los siguientes parámetros

stp=0.01;
a=0;
b=0.49;
x=a:h:b; % discretizamos el dominio
y0=2; % condición inicial

% función que vamos a resolver

f=inline('y^2','x','y');

sol=RK4method1(f,a,b,y0,stp);

figure(1)
hold on
plot(x,sol)
xlabel('x')
ylabel('y(x)')
title('Solución RK4 Method')
legend('y´=y^2')