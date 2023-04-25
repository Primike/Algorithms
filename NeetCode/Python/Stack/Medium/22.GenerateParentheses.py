# Given n pairs of parentheses, write a function to generate all 
# combinations of well-formed parentheses.

def generateParenthesis(n):
    stack = []
    result = []

    def backtrack(opened, closed):
        if opened == closed == n:
            result.append("".join(stack))
            return 
        
        if opened < n:
            stack.append("(")
            backtrack(opened + 1, closed)
            stack.pop()

        if closed < opened:
            stack.append(")")
            backtrack(opened, closed + 1)
            stack.pop()

    backtrack(0, 0)
    return result

print(generateParenthesis(3))
print(generateParenthesis(1))