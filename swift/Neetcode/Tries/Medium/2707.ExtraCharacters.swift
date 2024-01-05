// You are given a 0-indexed string s and a dictionary of words dictionary. 
// You have to break s into one or more non-overlapping substrings such that each 
// substring is present in dictionary. There may be some extra characters in s 
// which are not present in any of the substrings.
// Return the minimum number of extra characters left over if you break up s optimally.

// Use trie
func minExtraChar(_ s: String, _ dictionary: [String]) -> Int {
    let s = Array(s) 
    let words = Set(dictionary) 
    var memo = [Int: Int]()

    func dp(_ index: Int) -> Int {
        if index == s.count { return 0 }
        if let value = memo[index] { return value }

        var result = 1 + dp(index + 1)

        for i in index..<s.count {
            if words.contains(String(s[index...i])) {
                result = min(result, dp(i + 1))
            }
        }

        memo[index] = result
        return result
    }

    return dp(0)
}

print(minExtraChar("leetscode", ["leet","code","leetcode"]))
print(minExtraChar("sayhelloworld", ["hello","world"]))