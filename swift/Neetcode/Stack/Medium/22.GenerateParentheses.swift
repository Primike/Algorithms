//Given n pairs of parentheses, write a function to generate all 
//combinations of well-formed parentheses.

func generateParenthesis(_ n: Int) -> [String] {
    var stack = [String]()
    var result = [String]()

    func backtrack(_ opened: Int, _ closed: Int) {
        if opened == closed, closed == n {
            result.append(stack.joined())
        }

        if opened < n {
            stack.append("(")
            backtrack(opened + 1, closed)
            stack.removeLast()
        }

        if closed < opened {
            stack.append(")")
            backtrack(opened, closed + 1)
            stack.removeLast()
        }
    }

    backtrack(0, 0)
    return result
}

print(generateParenthesis(3))
print(generateParenthesis(1))