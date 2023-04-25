# An integer x. Record a new score of x.
# '+'. Record a new score that is the sum of the previous two scores.
# 'D'. Record a new score that is the double of the previous score.
# 'C'. Invalidate the previous score, removing it from the record.
# Return the sum of all the scores on the record after applying all the operations.

def calPoints(operations):
    stack = []

    for i, operation in enumerate(operations):
        if operation == "+":
            stack.append(stack[-2] + stack[-1])
        elif operation == "D":
            stack.append(stack[-1] * 2)
        elif operation == "C":
            stack.pop()
        else:
            stack.append(int(operation))

    return sum(stack)

print(calPoints(["5","2","C","D","+"]))
print(calPoints(["5","-2","4","C","D","9","+","+"]))
print(calPoints(["1","C"]))