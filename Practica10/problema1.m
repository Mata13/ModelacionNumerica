%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%% Metodos de diferencias finitas %%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%% Con condiciones de frontera tipo Dirichlet %%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% definimos los valores para resolver el problema

h=0.01; % buscamos una h pequeña 
a=0; 
b=1;
x=a:h:b; % discretizamos el dominio 
n=length(x);

% definimos la matriz A

A=zeros(n-2,n-2);
for i=2:n-3
    for j=1:n-2
        if i==j
            A(i,j-1)=-1;
            A(i,j)=2+h^2;
            A(i,j+1)=-1;
        end
    end
end
A(1,1)=2+h^2;
A(1,2)=-1;
A(n-2,n-3)=-1;
A(n-2,n-2)=2+h^2;

% creamos los vectores solución del problema

R=zeros(n-2,1);
for i=1:n-2
    for j=1
        if i==n-2
            R(i,1)=1;
        end
    end
        
end

size(R);

% de la siguiente manera calculamos la matriz solución del problema

u= inv(A)*R

