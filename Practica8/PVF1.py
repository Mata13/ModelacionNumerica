"""Usaremos el método RK4 en 4D para resolver el problema de valor en la frontera"""

import matplotlib.pyplot as plt
import numpy as np
import RK44DMeth

"""Usando los siguientes coeficientes para las variables presentes en las ecns"""

L=50 # Longitud de la liga [m]
T=300 # Tensión [N]
W=50 # Peso [N]
E=12000000 # Módulo de elasticidad [kg/m^2]
I=4 # Momento de inercia [kg/m]


"""Ahora definimos las funciones que vamos a resolver, teniendo un sistema de 4 EDO,
resultado de los cambios de variable aplicados al PVF"""

def f(x,y,u1,y2,u2):
    return x

def g(x,y,u1,y2,u2):
    return u1

def l(x,y,u1,y2,u2):
    return ((T/(E*I))*y)+((W*x*(x-L))/(2*E*I))

def m(x,y,u1,y2,u2):
    return u2

def s(x,y,u1,y2,u2):
    return ((T/(E*I))*y2)

"""Discretizamos nuestro dominio"""

a=0;
b=L;
stp=0.1; # stp representa la h en algunos problemas numéricos

num=RK44DMeth.rk44dmethod(f,g,l,m,s,a,b,stp,[0,0,0,1])

# y(t)=y1(t)+beta-(y1(b)/y2(b))*y2(t)  ,y2(b)=0
beta=0

ydet=(np.array(num[1])+beta-((num[1][len(num[1])-1])/num[3][len(num[3])-1]) *
     np.array(num[3]))

plt.figure(figsize=(40,20))
plt.plot(num[0],ydet,label='y(t)=y1(t)+beta-(y1(b)/y2(b))*y2(t) ,beta=0 ')
plt.title("Práctica 8")
plt.ylabel("y(t)")
plt.xlabel('t')
plt.legend(loc=2)
plt.savefig( 'practica8.png', fmt='PNG', dpi=400 )
plt.show()
