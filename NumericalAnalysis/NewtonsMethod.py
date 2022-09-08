#Use Newtons Method to find roots of equations
#Plug in the function, derivative, initial guess, iterations

from math import *

def newtonsMethod(fx, dfx, x, n):
    def f(x):
        f = eval(fx)
        return f
    def df(x):
        df = eval(dfx)
        return df

    for i in range(n):
        x = x - f(x)/df(x)
        print(x)
    return "Root: " + str(round(x, 5))

print(newtonsMethod("x**2 - 2", "2*x", 1, 10))
print(newtonsMethod("x**3 + 1", "3*x**2", 1, 10))