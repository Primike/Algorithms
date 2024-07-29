// Given a string s containing only three types of characters: 
// '(', ')' and '*', return true if s is valid.

// Time: O(n), Space: O(1)
func checkValidString(_ s: String) -> Bool {
    var left = 0, right = 0

    for char in s {
        left += char == "(" ? 1 : -1
        right += char != ")" ? 1 : -1

        if right < 0 { break }
        left = max(left, 0)
    }

    return left == 0
}

print(checkValidString("()"))
print(checkValidString("(*)"))
print(checkValidString("(*))"))


func checkValidString2(_ s: String) -> Bool {
    let s = Array(s)
    var opened = 0, closed = 0

    for i in 0..<s.count {
        if s[i] == "(" || s[i] == "*" {
            opened += 1
        } else {
            opened -= 1
        }

        if s[s.count - 1 - i] == ")" || s[s.count - 1 - i] == "*" {
            closed += 1
        } else {
            closed -= 1
        }

        if opened < 0 || closed < 0 { return false }
    }

    return true
}

func checkValidString3(_ s: String) -> Bool {
    let s = Array(s)
    var opened = [Int](), asterisks = [Int]()

    for (i, char) in s.enumerated() {
        if char == "*" {
            asterisks.append(i)
        } else if char == "(" {
            opened.append(i)
        } else {
            if !opened.isEmpty {
                opened.popLast()
            } else if !asterisks.isEmpty {
                asterisks.popLast()
            } else {
                return false
            }
        }
    }

    while !opened.isEmpty, !asterisks.isEmpty {
        if opened.removeLast() > asterisks.removeLast() {
            return false
        }
    }

    return opened.isEmpty
}