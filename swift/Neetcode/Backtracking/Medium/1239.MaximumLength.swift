// You are given an array of strings arr. A string s is formed by the 
// concatenation of a subsequence of arr that has unique characters.
// Return the maximum possible length of s.

// Time: O(n * 2^n), Space: O(n)
func maxLength(_ arr: [String]) -> Int {
    var result = 0

    func backtrack(_ index: Int, _ current: Set<Character>) {
        result = max(result, current.count)

        for i in index..<arr.count {
            var newSet = current
            
            for letter in arr[i] {
                if newSet.contains(letter) { break }
                newSet.insert(letter)
            }

            if newSet.count == current.count + arr[i].count {
                backtrack(i + 1, newSet)
            }
        }
    }

    backtrack(0, [])
    return result
}

print(maxLength(["un","iq","ue"]))
print(maxLength(["cha","r","act","ers"]))
print(maxLength(["abcdefghijklmnopqrstuvwxyz"]))