%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%% Metodos de diferencias finitas %%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%% Con condiciones de frontera tipo Robin     %%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% definimos los valores para resolver el problema

h=0.01; % buscamos una h pequeña
a=0;
b=0.5;
x=a:h:b; % discretizamos el dominio
n=length(x);

% definimos la matriz A

A=zeros(n-1,n-1);
for i=2:n-2
    for j=1:n-1
        if i==j
            A(i,j-1)=1;
            A(i,j)=-2;
            A(i,j+1)=1;
        end
    end
end
A(1,1)=-2;
A(1,2)=1;
A(n-1,n-2)=1;
A(n-1,n-1)=-2;

% creamos los vectores solución del problema

M=zeros(n-1,1);
M(1,1)=-cos(pi*x(2))*pi^2 -1;
for i=3:n-1
    M(i,1)=-cos(pi*x(i))*pi^2;
end
M(n-1,1)=-cos(pi*x(n))*pi^2 +(h*pi);

m=M*h^2;


% de la siguiente manera calculamos la matriz solución del problema

u= inv(A)*m

