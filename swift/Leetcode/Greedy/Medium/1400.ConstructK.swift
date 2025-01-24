// Given a string s and an integer k, return true if 
// you can use all the characters in s to construct k 
// palindrome strings or false otherwise.

// Time: O(n), Space: O(1)
func canConstruct(_ s: String, _ k: Int) -> Bool {
    if s.count < k { return false }

    let dict = Array(s).reduce(into: [:]) { $0[$1, default: 0] += 1 }
    var odds = Array(dict.values).filter { $0 % 2 != 0 }
    
    return odds.count <= k
}

print(canConstruct("annabelle", 2))
print(canConstruct("leetcode", 3))
print(canConstruct("true", 4))