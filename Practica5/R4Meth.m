function yR4=R4Meth(f,x0,xf,y0,h)
x=x0:h:xf; %discretizar el dominio
yR4=zeros(1,length(x)); %Reservamos memoria para guardar la solución (M.R4)
yR4(1)=y0;
    for i=1:(length(x)-1)
     
        yR4(i+1)=yR4(i)+(1/6)*(feval(f,x(i),yR4(i))+ 2*(feval(f,x(i)+0.5*h,yR4(i)+0.5*h*(feval(f,x(i),yR4(i)))))+2*(feval(f,x(i)+0.5*h,yR4(i)+0.5*h*(feval(f,x(i)+0.5*h,yR4(i)+0.5*h*(feval(f,x(i),yR4(i)))))))+(feval(f,x(i)+h,yR4(i)+h*(feval(f,x(i)+0.5*h,yR4(i)+0.5*h*(feval(f,x(i)+0.5*h,yR4(i)+0.5*h*(feval(f,x(i),yR4(i))))))))))*h;
    end
end