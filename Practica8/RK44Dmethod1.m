% Usaremos este scrip para el problema de valor en la frontera
% Definimos una función, donde f, g, h, s son las respectivas ecuaciones

function[t,f,g,h,s]=RK44Dmethod1(F,G,H,S,a,b,y10,u10,y20,u20,stp)

% Discretizamos el dominio

t=a:stp:b;
n=size(t,2);

% Reservamos memoria para guardar la solución
f=zeros(1,n);
g=zeros(1,n);
h=zeros(1,n);
s=zeros(1,n);

% Condiciones Iniciales

f(1)=y10;
g(1)=u10;
h(1)=y20;
s(1)=u20;


    for i=1:(length(t)-1)

        % Calculando los parámetros del método de Runge-Kutta 4to orden

        w1=[t(i),f(i),g(i),h(i),s(i)];
        k1f=feval(F,w1(1),w1(2),w1(3),w1(4),w1(5));
        k1g=feval(G,w1(1),w1(2),w1(3),w1(4),w1(5));
        k1h=feval(H,w1(1),w1(2),w1(3),w1(4),w1(5));
        k1s=feval(S,w1(1),w1(2),w1(3),w1(4),w1(5));

        w2=[t(i)+0.5*stp, f(i)+0.5*k1f*stp, g(i)+0.5*k1g*stp, h(i)+0.5*k1h*stp, s(i)+0.5*k1s*stp];
        k2f=feval(F,w2(1),w2(2),w2(3),w2(4),w2(5));
        k2g=feval(G,w2(1),w2(2),w2(3),w2(4),w2(5));
        k2h=feval(H,w2(1),w2(2),w2(3),w2(4),w2(5));
        k2s=feval(S,w2(1),w2(2),w2(3),w2(4),w2(5));

        w3=[t(i)+0.5*stp, f(i)+0.5*k2f*stp, g(i)+0.5*k2g*stp, h(i)+0.5*k2h*stp, s(i)+0.5*k2s*stp];
        k3f=feval(F,w3(1),w3(2),w3(3),w3(4),w3(5));
        k3g=feval(G,w3(1),w3(2),w3(3),w3(4),w3(5));
        k3h=feval(H,w3(1),w3(2),w3(3),w3(4),w3(5));
        k3s=feval(S,w3(1),w3(2),w3(3),w3(4),w3(5));

        w4=[t(i)+0.5*stp, f(i)+0.5*k3f*stp, g(i)+0.5*k3g*stp, h(i)+0.5*k3h*stp, s(i)+0.5*k3s*stp];
        k4f=feval(F,w4(1),w4(2),w4(3),w4(4),w4(5));
        k4g=feval(G,w4(1),w4(2),w4(3),w4(4),w4(5));
        k4h=feval(H,w4(1),w4(2),w4(3),w4(4),w4(5));
        k4s=feval(S,w4(1),w4(2),w4(3),w4(4),w4(5));

        % Calculamos la solución para cada ecuación

        f(i+1)=f(i)+(1/6)*(k1f+2*k2f+2*k3f+k4f)*stp;
        g(i+1)=g(i)+(1/6)*(k1g+2*k2g+2*k3g+k4g)*stp;
        h(i+1)=h(i)+(1/6)*(k1h+2*k2h+2*k3h+k4h)*stp;
        s(i+1)=s(i)+(1/6)*(k1s+2*k2s+2*k3s+k4s)*stp;

    end

end
