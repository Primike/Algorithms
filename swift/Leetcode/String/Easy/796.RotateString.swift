// Given two strings s and goal, return true if and only 
// if s can become goal after some number of shifts on s.
// A shift on s consists of moving the leftmost character 
// of s to the rightmost position.
// For example, if s = "abcde", then it will be "bcdea" after one shift.

// Time: O(n), Space: O(n)
func rotateString(_ s: String, _ goal: String) -> Bool {
    if s.count != goal.count { return false }

    var doubled = s + s

    return doubled.contains(goal)
}

print(rotateString("abcde", "cdeab"))
print(rotateString("abcde", "abced"))