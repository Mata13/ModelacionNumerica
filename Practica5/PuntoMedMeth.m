function yM=PuntoMedMeth(f,x0,xf,y0,h)
x=x0:h:xf; %discretizar el dominio
yM=zeros(1,length(x)); %Reservamos memoria para guardar la solución (M.PuntoMed)
yM(1)=y0;
    for i=1:(length(x)-1)
        
     
        yM(i+1)=yM(i)+(feval(f,x(i)+0.5*h,yM(i))+0.5*(feval(f,x(i),yM(i)))*h)*h;
    end
end