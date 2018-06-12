

"""Resolveremos el problema:	y'' = -2yy' + ty' + y + t
y(1) = 0, y(2) = -2 en 1 <= t <= 2
usando h=0.01 y una tolerancia de 10^-7
	Graficar los disparos en una misma figura"""

import funciones as rk4
import matplotlib.pyplot as plt
import numpy as np

# Definimos las funciones para el problema

def f(t, y, yp, z, zp ):
	return yp

def g(t, y, yp, z, zp ):
	return -2*(y*yp+t*yp+y+t)

def k(t, y, yp, z, zp ):
	return zp

def l(t, y, yp, z, zp ):
	return z*(-2*yp-2)+zp*(-2*y-2*t)

# Discretizamos el dominio:

a=1;
b=2;
stp=0.01; # representa la h, es espaciado entre los puntos
m0=-2 # dado por el problema
w=1 # parámetros del método
beta=0 # parámetros del método

plt.figure(figsize=(15,7))

# usamos el ciclo while

# donde:

# num[1] representa la y, num[2] representa la z

# problema y(t)=y1(t)+beta-(y1(b)/z(b))*z(t)  ,z(b)!=0

while(w>1e-7):
	num=rk4.rk44D(f,g,k,l,a,b,stp,[0,m0,0,1])

	ydet=(np.array(num[1])+beta-((num[1][len(num[1])-1])/
		  num[3][len(num[3])-1]) * np.array(num[3]))

	plt.plot(num[0],ydet,label="w = " + str(w) + ", m0 = " + str(m0))

	w=abs((num[3][len(num[3])-1])-(-2))

	m0=m0-((num[3][len(num[3])-1]-(-2))/num[1][len(num[1])-1])

# generamos las gráficas con sus datos respectivos

plt.title("Práctica 9")
plt.ylabel("y(t)")
plt.xlabel('t')
plt.legend(loc=1)
plt.savefig('practica9.png', fmt='PNG', dpi=1000)
plt.show()
