%Práctica 2.
clear all;close all;clc
x=0.5;
n=6;%cifras significativas
k=0;
sum_o=0;
eps_s=x*10^(2-n);
eps_r=abs(eps_s+1);

while eps_r>=eps_s
    
    sum=(x^k)/factorial(k)+sum_o;%valor actual
    eps_r=abs((sum-sum_o)/sum)*100;%se actualiza eps_r
    sum_o=sum;%actualiza valor suma
    k=k+1;%se actualiza el índice
    disp(sum)
end

fprintf('\n El valor de exp (%f) con %d cifras significativas es \n',x,n)
format long
disp(sum);

    

