# Implement a last-in-first-out (LIFO) stack using only two queues. 
# The implemented stack should support all the functions of a normal stack 
# (push, top, pop, and empty).

class MyStack(object):
    def __init__(self):
        self.stack = []

    def push(self, x):
        self.stack.append(x)
        
    def pop(self):
        return self.stack.pop()

    def top(self):
        return self.stack[-1]

    def empty(self):
        return True if len(self.stack) == 0 else False

