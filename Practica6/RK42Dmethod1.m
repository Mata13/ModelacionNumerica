% Este scrip lo aplicaremos al problema de valor inicial
% Definimos una función 

function[t,u,v]=RK42Dmethod1(f,g,a,b,u0,v0,stp)

% Discretizar el dominio

t=a:stp:b; 
n=size(t,2);

% Reservamos memoria de la compu para la solución

u=zeros(1,n);
v=zeros(1,n);

u(1)=u0;
v(1)=v0;

    for i=1:1:(n-1)
        
        % Calculando los parámetros del método de Runge-Kutta
        
        w1=[t(i),u(i),v(i)];
        k1u=feval(f,w1(1),w1(2),w1(3));
        k1v=feval(g,w1(1),w1(2),w1(3));
        
        w2=[t(i)+0.5*stp, u(i)+0.5*k1u*stp, v(i)+0.5*k1v*stp];
        k2u=feval(f,w2(1),w2(2),w2(3));
        k2v=feval(g,w2(1),w2(2),w2(3));
        
        w3=[t(i)+0.5*stp, u(i)+0.5*k2u*stp, v(i)+0.5*k2v*stp];
        k3u=feval(f,w3(1),w3(2),w3(3));
        k3v=feval(g,w3(1),w3(2),w3(3));
        
        w4=[t(i)+stp, u(i)+k3u*stp, v(i)+k3v*stp];
        k4u=feval(f,w4(1),w4(2),w4(3));
        k4v=feval(g,w4(1),w4(2),w4(3));
        
        % Calcular la solución
        
        u(i+1)=u(i)+(stp/6)*(k1u+2*k2u+2*k3u+k4u);
        v(i+1)=v(i)+(stp/6)*(k1v+2*k2v+2*k3v+k4v);
        
    end
    
end