%Brenda Arvizu Padilla-Joshua Iván Muñoz Salazar
%2. Aproximar la segunda derivada de f(x)=2^(sin(x^2+1))*cos(sqrt(|sin(x+1)|)) en x=sqrt(2),usar h=0.001 y dif. centradas

h=0.001;
x=sqrt(2);
y=2^(sin(x^2+1))*cos(sqrt(abs(sin(x+1))));

ya=2^(sin((x+h)^2+1))*cos(sqrt(abs(sin((x+h)+1))));
yr=2^(sin((x-h)^2+1))*cos(sqrt(abs(sin((x-h)+1))));
y2_centradas=(ya-(2*y)+yr)/(h.^2);


