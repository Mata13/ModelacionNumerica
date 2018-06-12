% Definimos una función

function RK4=RK4method1(f,a,b,y0,stp)
x=a:stp:b; % discretizamos el dominio
RK4=zeros(1,length(x)); % reservamos memoria en la compu para la solución
RK4(1)=y0;
    for i=1:(length(x)-1)
     
        RK4(i+1)=RK4(i)+(1/6)*(feval(f,x(i),RK4(i))+ 2*(feval(f,x(i)+0.5*stp,RK4(i)+0.5*stp*(feval(f,x(i),RK4(i)))))+2*(feval(f,x(i)+0.5*stp,RK4(i)+0.5*stp*(feval(f,x(i)+0.5*stp,RK4(i)+0.5*stp*(feval(f,x(i),RK4(i)))))))+(feval(f,x(i)+stp,RK4(i)+stp*(feval(f,x(i)+0.5*stp,RK4(i)+0.5*stp*(feval(f,x(i)+0.5*stp,RK4(i)+0.5*stp*(feval(f,x(i),RK4(i))))))))))*stp;
    end
end
