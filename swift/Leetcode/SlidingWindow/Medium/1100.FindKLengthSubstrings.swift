// Given a string s and an integer k, return the number of 
// substrings in s of length k with no repeated characters.

// Time: O(n), Space: O(26)
func numKLenSubstrNoRepeats(_ s: String, _ k: Int) -> Int {
    let s = Array(s)
    var letters = Set<Character>()
    var result = 0
    var left = 0
    
    for i in 0..<s.count {
        while letters.contains(s[i]) || i - left + 1 > k {
            letters.remove(s[left]) 
            left += 1
        }

        letters.insert(s[i])
        if i - left + 1 == k { result += 1 }
    }

    return result
}

print(numKLenSubstrNoRepeats("havefunonleetcode", 5))
print(numKLenSubstrNoRepeats("home", 5))