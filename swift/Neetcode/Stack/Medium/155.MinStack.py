# Design a stack that supports push, pop, top, 
# and retrieving the minimum element in constant time.

class MinStack(object):
    def __init__(self):
        self.stack = []
        self.minimum = []

    def push(self, val):
        self.stack.append(val)

        if self.minimum and val > self.minimum[-1]:
            self.minimum.append(self.minimum[-1])
        else:
            self.minimum.append(val)
        
    def pop(self):
        self.stack.pop()
        self.minimum.pop()

    def top(self):
        return self.stack[-1]

    def getMin(self):
        return self.minimum[-1]
