// Given a string s, partition s such that every substring of the partition 
// is a palindrome. Return all possible palindrome partitioning of s.

// Optimize by saving know palindromes
// Time: O(n * 2^n), Space: O(n)
func partition(_ s: String) -> [[String]] {
    let s = Array(s)
    var result = [[String]]()

    func backtrack(_ index: Int, _ current: [String]) {
        if index == s.count { result.append(current) }

        for i in index..<s.count {
            let string = String(s[index...i])

            if string == String(string.reversed()) { 
                backtrack(i + 1, current + [string]) 
            }
        }
    }

    backtrack(0, [])
    return result
}

print(partition("aab"))
print(partition("a"))