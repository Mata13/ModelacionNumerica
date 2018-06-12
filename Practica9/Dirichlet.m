%En este código se resuelve una ecuación diferencial parcial de la forma general
%p(x)u''(x)+q(x)u'(x)+r(x) u(x)=f(x)con el método
%de diferencias finitas, considerando condiciones de frontera tipo
%Dirichlet, lo que significa que los valores en la frontera son
%constantes conocidas

%Resolviendo la ecuación -u''(x)+u(x)=0 en D=[0,1] con u(0)=0 y u(1)=1

%Dominio y su partición (generación de la malla)
a=0;
b=1;
h=0.01;
x=a:h:b;

%Para construir el sistema de ecuaciones que nos ayudará a resolver este
%problema, nos basamos en la siguiente ecuación (diferencias finitas centradas):
%[(p/h^2)-(q/2h)ui-1]+ [r-2(p/h^2)ui]+[(p/h^2)+(q/2h)ui+1]=fi
%Con el primer término alfa, el segundo beta y el tercero gamma.
alfa=-1;
beta=2+h^2;
gamma=-1;

%Construyendo la matriz A de n-2 x n-2 para guardar el sistema de
%ecuaciones

n=length(x);
A=zeros(n-2,n-2);

for i=2:n-3
    for j=1:n-2
        if i==j
            A(i,j-1)=alfa;
            A(i,j)=beta;
            A(i,j+1)=gamma;
        end
    end
end

A(1,1)=beta;
A(1,2)=gamma;
A(n-2,n-3)=alfa;
A(n-2,n-2)=beta;

%Constuyendo la matriz de funciones
f=zeros(n-2,1);
f(n-2,1)=b;
        
%Por lo tanto, la matriz de soluciones es:
u=inv(A)*f

