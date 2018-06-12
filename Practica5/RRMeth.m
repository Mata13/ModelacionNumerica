function yRR=RRMeth(f,x0,xf,y0,h)
x=x0:h:xf; %discretizar el dominio
yRR=zeros(1,length(x)); %Reservamos memoria para guardar la solución (M.RR)
yRR(1)=y0;
    for i=1:(length(x)-1)
     
        yRR(i+1)=yRR(i)+((1/3)*(feval(f,x(i),yRR(i)))+(2/3)*(feval(f,x(i)+(3/4)*h,yRR(i)+(3/4)*(feval(f,x(i),yRR(i))))))*h;
    end
end