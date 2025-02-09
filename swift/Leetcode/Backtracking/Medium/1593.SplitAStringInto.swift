// Given a string s, return the maximum number of unique substrings 
// that the given string can be split into.
// You can split string s into any list of non-empty substrings, 
// where the concatenation of the substrings forms the original string. 
// However, you must split the substrings such that all of them are unique.

// Time: O(n * 2^n), Space: O(n)
func maxUniqueSplit(_ s: String) -> Int {
    let s = Array(s)
    var substrings = Set<String>()
    
    func backtrack(_ index: Int) -> Int {
        if index == s.count { return substrings.count }

        var result = 0
        var string = ""

        for i in index..<s.count {
            string.append(s[i])
            
            if substrings.contains(string) { continue }

            substrings.insert(string)
            result = max(result, backtrack(i + 1))
            substrings.remove(string)
        }

        return result
    }

    return backtrack(0)
}

print(maxUniqueSplit("ababccc"))
print(maxUniqueSplit("aba"))
print(maxUniqueSplit("aa"))