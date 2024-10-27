// Given a string s, return the maximum number of unique substrings 
// that the given string can be split into.
// You can split string s into any list of non-empty substrings, 
// where the concatenation of the substrings forms the original string. 
// However, you must split the substrings such that all of them are unique.

// Time: O(n * 2^n), Space: O(n)
func maxUniqueSplit(_ s: String) -> Int {
    let s = Array(s)
    var result = 0

    func backtrack(_ index: Int, _ count: Int, _ seen: Set<String>) {
        if index >= s.count { 
            result = max(result, count)
            return
        }

        var seen = seen
        var current = ""

        for i in index..<s.count {
            current.append(s[i])
            if seen.contains(current) { continue }

            seen.insert(current)
            backtrack(i + 1, count + 1, seen)
            seen.remove(current)
        }
    }

    backtrack(0, 0, [])
    return result
}

print(maxUniqueSplit("ababccc"))
print(maxUniqueSplit("aba"))
print(maxUniqueSplit("aa"))