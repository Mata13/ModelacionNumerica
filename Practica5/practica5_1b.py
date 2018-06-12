""""Usando R-K de 2do orden (Punto Medio) al problema de valor inicial
y'=-2x**3+12x**2-20x+8.5 con h=0.5"""

import numpy as np
import matplotlib.pyplot as plt

# límites: 0 <= x <= 4
a = 0
b = 4

# steps
N = 10

# tamaño
h = 0.5

# valor Inicial: y(0) = 1
VI = (0,1)

# EDO
def f(x,y):
    return -2*(x**3)+12*(x**2)-20*x+8.5

# Arreglos para x y y
x = np.arange( a, b+h, h )
y = np.zeros((N+1,))

# valores iniciales
x_0, y_0 = VI

# Solución analítica
def y(x):
    return -1/2(x**4)+4*(x**3)-10*(x**2)+8.5*x

def puntomediometh(f, a, b, N, VI):
    x = np.arange( a, b+h, h )
    y = np.zeros((N+1,))
    x_0, y_0 = IV
    for i in range(1,N+1):
        k1 = f(x_i,y_i)
        k2 = f(x_i + (1/2)*h, y_i + (1/2)*k1*h)
        y_i = y_i + (k2*h)
    return y

    y= puntomediometh(f, a, b, N, VI)

    print(y)
