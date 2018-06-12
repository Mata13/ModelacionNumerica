function yH=HeunMeth(f,x0,xf,y0,h)
x=x0:h:xf; %discretizar el dominio

yH=zeros(1,length(x)); %Reservamos memoria para guardar la solución (M.Heun)
yE(1)=y0;
yH(1)=y0;
k1=zeros(1,length(x));
k2=zeros(1,length(x));

    for i=1:(length(x)-1)
        
        k1=feval(f,x(i),yH(i));
        k2=feval(f,x(i)+h,yH(i)+k1*h);
        yH(i+1)=yH(i)+(0.5*k1+0.5*k2)*h;
    end
end