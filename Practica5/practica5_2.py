""""Usando R-K de 4to orden al problema de valor inicial
y'=-2x**3+12x**2-20x+8.5 con h=0.5"""

import numpy as np
import matplotlib.pyplot as plt

# límites: 0 <= x <= 4
a = 0
b = 4

# tamaño
h = 0.5

# valor Inicial: y(0) = 1
VI = (0,1)

# EDO
def f(x,y):
    return -2*(x**3)+12*(x**2)-20*x+8.5


# Solución analítica
def y(x):
    return -(1/2)*(x**4)+4*(x**3)-10*(x**2)+8.5*x

def rk4(f,a,b,h,VI):
    N=int((b-a)/h)
    x = np.arange(a, b+h, h)          # malla
    y = np.zeros((N+1,))                # y
    x[0], y[0] = VI                     # valores iniciales
    for i in range(1,N+1):              # aplicando el método
        k1 = f(x[i-1], y[i-1])
        k2 = f((x[i-1] + ((1/2)*h)), (y[i-1] + (1/2)*k1*h))
        k3 = f(x[i-1] + ((1/2)*h), (y[i-1] + (1/2)*k2*h))
        k4 = f((x[i-1] + h), (y[i-1] + k3*h))
        y[i] = y[i-1] + ((1/6)*(k1 + 2*k2 + 2*k3 + k4)*h)
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

num=rk4(f,a,b,h,VI)
analitica=evalua(y,a,b,h,VI)
error=errorRelativoArray(analitica[1],num[1])

plt.subplot(211)
plt.plot(num[0],num[1],label='Numérica')
plt.plot(analitica[0],analitica[1],label='Analítica')
plt.legend(loc=2)
plt.title("Método de Runge Kutta 4° orden")
plt.ylabel('y(x)')
plt.subplot(212)
plt.plot(num[0],error,label='Error')
plt.legend(loc=2)
plt.xlabel('x')
plt.ylabel('Error [%]')
plt.savefig( 'rk4.png', fmt='PNG', dpi=100 )
plt.show()
