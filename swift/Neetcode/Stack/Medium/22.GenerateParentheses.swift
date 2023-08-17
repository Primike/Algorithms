//Given n pairs of parentheses, write a function to generate all 
//combinations of well-formed parentheses.

func generateParenthesis(_ n: Int) -> [String] {
    var result = [String]()

    func backtrack(_ string: String, _ opened: Int, _ closed: Int) {
        if opened == n, closed == n {
            result.append(string)
            return
        }

        if opened < n {
            backtrack(string + "(", opened + 1, closed)
        }
        if closed < opened {
            backtrack(string + ")", opened, closed + 1)
        }
    }

    backtrack("", 0, 0)
    return result
}

print(generateParenthesis(3))
print(generateParenthesis(1))