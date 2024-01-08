// Given a string s of '(' , ')' and lowercase English characters.
// Your task is to remove the minimum number of parentheses 
// ( '(' or ')', in any positions ) so that the resulting parentheses string 
// is valid and return any valid string.



func minRemoveToMakeValid(_ s: String) -> String {
    var s = Array(s)
    var stack = [Character]()
    var count = 0

    for letter in s {
        if letter == "(" { 
            count += 1 
        } else if letter == ")" { 
            if count <= 0 { continue }
            count -= 1
        }

        stack.append(letter)
    }

    s = stack.reversed()
    stack = []
    count = 0

    for letter in s {
        if letter == ")" { 
            count += 1 
        } else if letter == "(" { 
            if count <= 0 { continue }
            count -= 1
        }

        stack.append(letter)
    }

    return String(stack.reversed())
}
