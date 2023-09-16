// You are given an array of strings arr. A string s is formed by the 
// concatenation of a subsequence of arr that has unique characters.
// Return the maximum possible length of s.

func maxLength(_ arr: [String]) -> Int {
    var result = 0

    func backtrack(_ index: Int, _ current: Set<Character>) {
        if index == arr.count {
            result = max(result, current.count)
            return
        }
        
        backtrack(index + 1, current)

        var newSet = current
        var duplicate = false

        for letter in arr[index] {
            if newSet.contains(letter) {
                duplicate = true
                break
            }
            
            newSet.insert(letter)
        }

        if !duplicate { backtrack(index + 1, newSet) }
    }

    backtrack(0, [])
    return result
}