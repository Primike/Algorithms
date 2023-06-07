# Given string num representing a non-negative integer num, and 
# an integer k, return the smallest possible integer after removing k digits from num.

def removeKdigits(num, k):
    stack = []

    for number in num:
        while k and stack and stack[-1] > number:
            k -= 1
            stack.pop()
            
        stack.append(number)

    stack = stack[:len(stack) - k]
    result = "".join(stack)

    return str(int(result)) if result else "0"

print(removeKdigits("1432219", 3))
print(removeKdigits("10200", 1))
print(removeKdigits("10", 2))