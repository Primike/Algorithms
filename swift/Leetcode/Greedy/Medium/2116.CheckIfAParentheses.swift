// You are given a parentheses string s and a string locked, 
// both of length n. locked is a binary string consisting only of 
// '0's and '1's. For each index i of locked,
// If locked[i] is '1', you cannot change s[i].
// But if locked[i] is '0', you can change s[i] to either '(' or ')'.
// Return true if you can make s a valid parentheses string. Otherwise, return false.

// Time: O(n), Space: O(1)
func canBeValid(_ s: String, _ locked: String) -> Bool {
    if s.count % 2 != 0 { return false }

    let s = Array(s), locked = Array(locked)
    var count = 0

    for i in 0..<s.count {
        if locked[i] == "0" || s[i] == "(" {
            count += 1
        } else {
            count -= 1
        }

        if count < 0 { return false }
    }

    count = 0 
    
    for i in stride(from: s.count - 1, to: -1, by: -1) {
        if locked[i] == "0" || s[i] == ")" {
            count += 1
        } else {
            count -= 1
        }

        if count < 0 { return false }
    }

    return true
}

print(canBeValid("))()))", "010100"))
print(canBeValid("()()", "0000"))
print(canBeValid(")", "0"))


func canBeValid2(_ s: String, _ locked: String) -> Bool {
    if s.count % 2 == 1 { return false }

    let s = Array(s), locked = Array(locked)
    var opened = [Int]()
    var unlocked = [Int]()

    for (i, bracket) in s.enumerated() {
        if locked[i] == "0" { 
            unlocked.append(i) 
        } else if bracket == "(" {
            opened.append(i)
        } else if bracket == ")" {
            if !opened.isEmpty {
                opened.removeLast()
            } else if !unlocked.isEmpty {
                unlocked.removeLast()
            } else {
                return false 
            }
        }
    }

    while !opened.isEmpty, !unlocked.isEmpty, unlocked.last! > opened.last! {
        opened.removeLast()
        unlocked.removeLast()
    }

    return opened.isEmpty
}