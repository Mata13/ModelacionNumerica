function yR5=R5Meth(f,x0,xf,y0,h)
x=x0:h:xf; %discretizar el dominio
yR5=zeros(1,length(x)); %Reservamos memoria para guardar la solución (M.R5)
yR5(1)=y0;
k1=zeros(1,length(x));
k2=zeros(1,length(x));
k3=zeros(1,length(x));
k4=zeros(1,length(x));
k5=zeros(1,length(x));
k6=zeros(1,length(x));


    for i=1:(length(x)-1)
        
        k1=feval(f,x(i),yR5(i));
        k2=feval(f,x(i)+0.25*h,yR5(i)+0.25*h*k1);
        k3=feval(f,x(i)+0.25*h,yR5(i)+(1/8)*h*k1+(1/8)*h*k2);
        k4=feval(f,x(i)+0.5*h,yR5(i)-0.5*h*k2+h*k3);
        k5=feval(f,x(i)+(3/4)*h,yR5(i)+(3/16)*h*k1+(9/16)*h*k4);
        k6=feval(f,x(i),yR5(i)-(3/7)*h*k1+(2/7)*h*k2+(12/7)*h*k3+(12/7)*h*k4+(8/5)*h*k5);
     
       yR5(i+1)=yR5(i)+(1/90)*(7*k1+32*k3+12*k4+32*k5+7*k6)*h;
       
    end
end