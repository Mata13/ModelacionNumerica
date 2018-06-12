"""Usando R-K de 2do orden (Heun) al problema de valor inicial
y'=-2x**3+12x**2-20x+8.5 con h=0.5"""

import numpy as np
import matplotlib.pyplot as plt

# límites: 0.0 <= x <= 4.0
n = 0.0
m = 4.0
# Tamaño
h = 0.5
# Valor Inicial: y(0.0) = 1.0
VI = (0.0,1.0)

# EDO
def f(x,y):
    return -2*(x**3)+12*(x**2)-20*x+8.5

# Solución analítica
def y(x):
    return -(1/2)*(x**4)+4*(x**3)-10*(x**2)+8.5*x

def heun_method(f, n, m, h, VI):
    N=int((m-n)/h)
    x = np.arange(n, m+h, h)          # crear malla
    y = np.zeros((N+1,))                # ininio y
    x[0], y[0] = VI                     # valores iniciales
    for i in range(1,N+1):              # Aplicando método de Heun
        k1 = f(x[i-1], y[i-1])
        k2 = f(x[i-1]+h, y[i-1] + k1*h)
        y[i] = y[i-1] + ((1/2)*k1 + (1/2)*k2)*h
    return x,y

#Evalua una funció matemática
def evalua(f,a,b,h,IV):
    N=int((b-a)/h)
    x=np.arange(a,b+h,h)
    y = np.zeros((N+1,))
    x[0], y[0] = IV
    for i in range(1,N+1):
        y[i] = f(x[i])
    return x,y

def errorRelativoArray(analitica,numerica):
    if (len(analitica)==len(numerica)):
        analitica=np.array(analitica)
        numerica=np.array(numerica)
        error=(np.abs((analitica-numerica))/analitica)*100
        return error

num=heun_method(f,n,m,h,VI)
analitica=evalua(y,n,m,h,VI)
error=errorRelativoArray(analitica[1],num[1])

plt.subplot(211)
plt.plot(num[0],num[1],label='Numérica')
plt.plot(analitica[0],analitica[1],label='Analítica')
plt.legend(loc=2)
plt.title("Método de Heun")
plt.ylabel('y(x)')
plt.subplot(212)
plt.plot(num[0],error,label='Error')
plt.legend(loc=2)
plt.xlabel('x')
plt.ylabel('Error [%]')
plt.savefig( 'Heun.png', fmt='PNG', dpi=100 )
plt.show()
