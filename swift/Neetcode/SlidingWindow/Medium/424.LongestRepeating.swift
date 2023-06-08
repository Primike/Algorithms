//You are given a string s and an integer k. 
//You can choose any character of the string and 
//change it to any other uppercase English character. 
//You can perform this operation at most k times.
//Return the length of the longest substring containing the same 
//letter you can get after performing the above operations.

func characterReplacement(_ s: String, _ k: Int) -> Int {
    var dict = [Character: Int]()
    var result = 0
    var left = 0
    var mostFrequent = 0
    let sArray = Array(s)

    for i in 0..<sArray.count {
        let char = sArray[i]
        dict[char, default: 0] += 1
        mostFrequent = max(mostFrequent, dict[char] ?? 0)

        if i - left + 1 - mostFrequent > k {
            dict[sArray[left], default: 0] -= 1
            left += 1
        }

        result = max(result, i - left + 1)
    }

    return result
}

print(characterReplacement("ABAB", 2))
print(characterReplacement("AABABBA", 1))