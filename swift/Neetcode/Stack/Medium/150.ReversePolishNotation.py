# You are given an array of strings tokens that represents an arithmetic expression 
# in a Reverse Polish Notation.
# Evaluate the expression. Return an integer that represents the value of the expression.


def evalRPN(tokens):
    stack = [] 

    for token in tokens:
        if token == "+":
            stack.append(stack.pop() + stack.pop())
        elif token == "-":
            x, y = stack.pop(), stack.pop()
            stack.append(y - x)
        elif token == "*":
            stack.append(stack.pop() * stack.pop())
        elif token == "/":
            x, y = stack.pop(), stack.pop()
            stack.append(int(float(y) / x))
        else:
            stack.append(int(token))

    return stack[0]

print(evalRPN(["2","1","+","3","*"]))
print(evalRPN(["4","13","5","/","+"]))
print(evalRPN(["10","6","9","3","+","-11","*","/","*","17","+","5","+"]))