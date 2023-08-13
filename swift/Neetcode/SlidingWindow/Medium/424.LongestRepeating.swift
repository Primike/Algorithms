//You are given a string s and an integer k. 
//You can choose any character of the string and 
//change it to any other uppercase English character. 
//You can perform this operation at most k times.
//Return the length of the longest substring containing the same 
//letter you can get after performing the above operations.


//Do not need to shrink the window
func characterReplacement(_ s: String, _ k: Int) -> Int {
    let s = Array(s)
    var window = [Character: Int]()
    var left = 0
    var mostFrequentCount = 0
    var result = 0

    for i in 0..<s.count {
        window[s[i], default: 0] += 1
        mostFrequentCount = max(mostFrequentCount, window[s[i], default: 0])

        if i - left + 1 - mostFrequentCount > k {
            window[s[left], default: 1] -= 1
            left += 1
        }

        result = max(result, i - left + 1)
    }

    return result
}

print(characterReplacement("ABAB", 2))
print(characterReplacement("AABABBA", 1))


func characterReplacement2(_ s: String, _ k: Int) -> Int {
    var s = Array(s)
    var window = [Character: Int]()
    var left = 0, right = 0
    var mostFrequentCount = 0
    var result = 0

    while right < s.count {
        window[s[right], default: 0] += 1
        mostFrequentCount = max(mostFrequentCount, window[s[right], default: 0])
        right += 1

        while right - left - mostFrequentCount > k {
            window[s[left], default: 1] -= 1
            left += 1
        }

        result = max(result, right - left)
    }

    return result
}