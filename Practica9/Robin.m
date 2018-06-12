%En este código se resuelve una ecuación diferencial parcial de la forma general
%p(x)u''(x)+q(x)u'(x)+r(x) u(x)=f(x)con el método
%de diferencias finitas, considerando condiciones de frontera tipo
%Robin, lo que significa que los valores en la frontera son
%una constante conocida y el otro una derivada.

%Resolviendo la ecuación u''(x)+pi^2*cos(pi*x)=0 en D=[0,0.5] con u(0)=1 y
%du/dx(0.5)=-pi

%Dominio y su partición (generación de la malla)
a=0;
b=0.5;
h=0.01;
x=a:h:b;

%Para construir el sistema de ecuaciones que nos ayudará a resolver este
%problema, nos basamos en la siguiente ecuación (diferencias finitas centradas):
%[(p/h^2)-(q/2h)ui-1]+ [r-2(p/h^2)ui]+[(p/h^2)+(q/2h)ui+1]=fi+
%Con el primer término alfa, el segundo beta y el tercero gamma.
alfa=1;
beta=-2;
gamma=1;

%Construyendo la matriz A de n-1 x n-1 para guardar el sistema de
%ecuaciones

n=length(x);
A=zeros(n-1,n-1);

for i=2:n-2
    for j=1:n-1
        if i==j
            A(i,j-1)=alfa;
            A(i,j)=beta;
            A(i,j+1)=gamma;
        end
    end
end

A(1,1)=beta;
A(1,2)=gamma;
A(n-1,n-2)=alfa;
A(n-1,n-1)=beta;

A

%Constuyendo la matriz de funciones

%f2+alfa*c1*h=(-pi^2*cos(pi*x(2))-1)*h^2
%fn-omega*c2*h      

f=zeros(n-1,1);
f(1,1)=(-pi^2*cos(pi*x(2))-1)*h^2;
for i=3:n-1
    f(i,1)=(-pi^2*cos(pi*x(i+1)))*h^2;
end
f(n-1,1)=(-pi^2*cos(pi*x(n))+(h*pi))*h^2;


%Por lo tanto, la matriz de soluciones es:
u=inv(A)*f

