// Given a string s, partition s such that every substring of the partition 
// is a palindrome. Return all possible palindrome partitioning of s.

func partition(_ s: String) -> [[String]] {
    var s = Array(s)
    var result = [[String]]()

    func backtrack(_ index: Int, _ current: [String]) {
        if index == s.count {
            result.append(current)
            return
        }

        for i in index..<s.count {
            let substring = String(s[index...i])
            
            if substring == String(substring.reversed()) {
                backtrack(i + 1, current + [substring])
            }
        }
    }

    backtrack(0, [])
    return result
}