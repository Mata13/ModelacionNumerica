%Brenda Arvizu Padilla-Joshua Iván Muñoz Salazar
%3. Aproximar d2f/dx para f(x,y,z)=((e^(x^2+sqrt(|x-y+5z|)))/(x^2)+2)*sin((x^2)+1) en (sqrt(2),pi,0)
x=sqrt(2);
y=pi;
z=0;
h=0.001;

f=((exp(x.^2+sqrt(abs(x-y+5*z))))/(x.^2+2))*(sin(x.^2+1));

f1=((exp(((x+h).^2)+sqrt(abs((x+h)-y+5*z))))/(((x+h).^2)+2))*(sin(((x+h).^2)+1));
f2=2*((exp(x.^2+sqrt(abs(x-y+5*z))))/(x.^2+2))*(sin(x.^2+1));
f3=((exp(((x-h).^2)+sqrt(abs((x-h)-y+5*z))))/(((x-h).^2)+2))*(sin(((x-h).^2)+1));

D2f=(f1-f2+f3)/h.^2;
