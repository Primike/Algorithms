// A happy string is a string that:
// consists only of letters of the set ['a', 'b', 'c'].
// s[i] != s[i + 1] for all values of i from 1 to 
// s.length - 1 (string is 1-indexed).
// For example, strings "abc", "ac", "b" and "abcbabcbcb" are all 
// happy strings and strings "aa", "baa" and "ababbc" are not happy strings.
// Given two integers n and k, consider a list of all happy strings 
// of length n sorted in lexicographical order.
// Return the kth string of this list or return an empty string 
// if there are less than k happy strings of length n.

// Time: O(n * 2^n), Space: O(n)
func getHappyString(_ n: Int, _ k: Int) -> String {
    let letters = ["a", "b", "c"]
    var order = 0
    var result = ""

    func backtrack(_ current: String) -> Bool {
        if current.count == n {
            order += 1
            if order == k { result = current }
            return order == k
        }

        for letter in letters {
            if let last = current.last, String(last) == letter { continue }
            if backtrack(current + letter) { return true }
        }

        return false
    }

    backtrack("")
    return result
}

print(getHappyString(1, 3))
print(getHappyString(1, 4))
print(getHappyString(3, 9))