"""Resolver el PVI y'= sin(x^2), y(o)=1 en 0<x<5.
h= 0.001; x_0=0; x_f=5; x=x_0:h:x_f; y_0=1 %condición inicial;
y =zeros(1, length(x)); % reservamos memoria para guardar la solución"""

import numpy as np
