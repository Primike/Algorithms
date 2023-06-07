#Use the Fixed Point Iteration method to find roots
#Take an equation y = log(7 - x) - x
#Set y = 0 then solve for x^1
#Plug in that equation, initial guess, iterations
#There may be n different equations for y = x^n + ... + x^(n - m) + ... + C

from math import *

def fpiMethod(fx, x, n):
    def f(x):
        f = eval(fx)
        return f

    for i in range(n):
        x = f(x)

    return "Root: " + str(round(x, 5))

print(fpiMethod("log(7 - x)", 1, 10))