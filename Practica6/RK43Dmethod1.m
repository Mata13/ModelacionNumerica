% Este scrip lo aplicaremos al atractor de Rossler a)
% Definimos una función, donde f, g, h son las respectivas ecuaciones 

function[t,x,y,z]=RK43Dmethod1(f,g,h,a,b,x0,y0,z0,stp)

% Discretizar el dominio
t=a:stp:b; 
n=size(t,2);

% Reservamos memoria para guardar la solución
x=zeros(1,n);
y=zeros(1,n);
z=zeros(1,n);

x(1)=x0;
y(1)=y0;
z(1)=z0


    for i=1:1:(n-1)
        
        % Calculando los parámetros del método de Runge-Kutta
        
        w1=[t(i),x(i),y(i),z(i)];
        k1x=feval(f,w1(1),w1(2),w1(3),w1(4));
        k1y=feval(g,w1(1),w1(2),w1(3),w1(4));
        k1z=feval(h,w1(1),w1(2),w1(3),w1(4));
        
        w2=[t(i)+0.5*stp,x(i)+0.5*k1x*stp,y(i)+0.5*k1y*stp,z(i)+0.5*k1z*stp];
        k2x=feval(f,w2(1),w2(2),w2(3),w2(4));
        k2y=feval(g,w2(1),w2(2),w2(3),w2(4));
        k2z=feval(h,w2(1),w2(2),w2(3),w2(4));
        
        w3=[t(i)+(0.5*stp), x(i)+(0.5*k2x*stp), y(i)+(0.5*k2y*stp), z(i)+(0.5*k2z*stp)];
        k3x=feval(f,w3(1),w3(2),w3(3),w3(4));
        k3y=feval(g,w3(1),w3(2),w3(3),w3(4));
        k3z=feval(h,w3(1),w3(2),w3(3),w3(4));
        
        w4=[t(i)+stp,x(i)+k3x*stp,y(i)+k3y*stp,z(i)+k3z*stp];
        k4x=feval(f,w4(1),w4(2),w4(3),w4(4));
        k4y=feval(g,w4(1),w4(2),w4(3),w4(4));
        k4z=feval(h,w4(1),w4(2),w4(3),w4(4));
        
        % Calcular la solución
        
        x(i+1)=x(i)+(stp/6)*(k1x+2*k2x+2*k3x+k4x);
        y(i+1)=y(i)+(stp/6)*(k1y+2*k2y+2*k3y+k4y);
        z(i+1)=z(i)+(stp/6)*(k1z+2*k2z+2*k3z+k4z);
        
        
    end
    
end