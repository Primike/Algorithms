// Given a string s and an integer k, return the maximum number of 
// vowel letters in any substring of s with length k.

func maxVowels(_ s: String, _ k: Int) -> Int {
    let s = Array(s)
    var vowels: Set<Character> = Set("aeiou")
    var left = 0, count = 0
    var result = 0

    for i in 0..<s.count {
        if vowels.contains(s[i]) { count += 1 }
        if i - left < k - 1 { continue }

        result = max(result, count)
        if vowels.contains(s[left]) { count -= 1 }
        left += 1
    }

    return result
}

print(maxVowels("abciiidef", 3))
print(maxVowels("aeiou", 2))
print(maxVowels("leetcode", 3))