function y=EulerMeth(f,a,b,yo,h)
x=a:h:b;
y=zeros(1,length(x));
y(1)=yo;
for i=1:(length(x)-1)
y (i+1) = h*feval(f,x(i),y(i))+y(i)
end
end