// Given a string s and an integer k, return the number of 
// substrings in s of length k with no repeated characters.

// Time: O(n), Space: O(26)
func numKLenSubstrNoRepeats(_ s: String, _ k: Int) -> Int {
    let s = Array(s).map { String($0) }
    var window = [String: Int]()
    var result = 0
    var left = 0, count = 0

    for i in 0..<s.count {  
        window[s[i], default: 0] += 1 
        if window[s[i]] == 1 { count += 1 }
        if window[s[i]]! == 2 { count -= 1 }

        if i < k - 1 { continue }
        if count == k { result += 1 }

        window[s[left]]! -= 1
        if window[s[left]] == 0 { count -= 1 }
        if window[s[left]] == 1 { count += 1 }
        left += 1
    }

    return result
}

print(numKLenSubstrNoRepeats("havefunonleetcode", 5))
print(numKLenSubstrNoRepeats("home", 5))