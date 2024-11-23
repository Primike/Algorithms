// There is only one character 'A' on the screen of a notepad. 
// You can perform one of two operations on this notepad for each step:
// Copy All: You can copy all the characters present on the screen 
// (a partial copy is not allowed).
// Paste: You can paste the characters which are copied last time.
// Given an integer n, return the minimum number of operations to 
// get the character 'A' exactly n times on the screen.

// Time: O(n^2), Space: O(n^2)
func minSteps(_ n: Int) -> Int {
    if n == 1 { return 0 }

    var memo = [String: Int]()

    func dp(_ count: Int, _ copied: Int) -> Int {
        let key = "\(count),\(copied)"

        if count == n { return 0 }
        if count > n { return n }
        if let value = memo[key] { return value }

        let paste = dp(count + copied, copied) + 1
        let copy = dp(count * 2, count) + 2
        let result = min(paste, copy)

        memo[key] = result
        return result
    }

    return dp(1, 1) + 1
}

print(minSteps(3))
print(minSteps(1))