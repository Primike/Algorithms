#Use The Bisection Method to find roots of equations
#Plug in the function, left x value, right x value, iterations

from math import *

def bisectionMethod(fx, a, b, n):
    def f(x):
        f = eval(fx)
        return f

    x = None

    for i in range(n):
        x = (a + b)/2
        if f(x) == 0:
            return "Root: " + str(x)
        if f(x) > 0:
            b = x
        else:
            a = x
    return "Root: " + str(x) + ", Error = +/- " + str(b - a)

print(bisectionMethod("x**2 - 2", -2, 5, 10))
print(bisectionMethod("exp(x) + x - 7", 1, 2, 10))