function ycorr=HeunMeth(f,a,b,yo,h)
x=a:h:b;
ypred=zeros(1,length(x));
ypred(1)=yo;
ycorr=zeros(1,length(x));
ycorr(1)=yo;
for i=1:(length(x)-1)
ypred (i+1) = ypred(i) + (h*feval(f,x(i),ypred(i)))
ycorr (i+1) = ycorr(i) + h*(((feval(f,x(i),ycorr(i))) + feval(f,x(i+1),ypred(i+1)))/2)
end
end