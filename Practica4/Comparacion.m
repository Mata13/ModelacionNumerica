clear all;
clear all;
clc

a=1;
b=5;
h=0.05;
yo=1;
f=inline('2*x*y','x','y');
Eu = EulerMeth(f,a,b,yo,h);
Heu = HeunMeth(f,a,b,yo,h);
x=a:h:b;
AnSol = exp((x.^2)-1)
EuErr = ((AnSol-Eu)./AnSol)*100
HeuErr = ((AnSol-Heu)./AnSol)*100
figure(1)
hold on 
plot(x,Eu,'r')
plot(x,HeuErr,'k')
hold off

figure(2)
hold on
plot(x,EuErr,'r')
plot(x,HeuErr,'k')
hold off