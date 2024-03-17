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
    
    func validate(_ s: [Character], _ locked: [Character], _ bracket: Character) -> Bool {
        var count = 0, unlocked = 0

        for i in 0..<s.count {
            if locked[i] == "1" {
                count += (s[i] == bracket ? 1 : -1)
            } else {
                unlocked += 1
            }

            if unlocked + count < 0 { return false }
        }

        return count <= unlocked
    }
    
    let left = validate(s, locked, "(")
    let right = validate(Array(s.reversed()), Array(locked.reversed()), ")")

    return left && right
}

print(canBeValid("))()))", "010100"))
print(canBeValid("()()", "0000"))
print(canBeValid(")", "0"))