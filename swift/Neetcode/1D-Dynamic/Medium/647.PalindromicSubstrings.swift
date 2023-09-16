// Given a string s, return the number of palindromic substrings in it.

func countSubstrings(_ s: String) -> Int {
    var s = Array(s)
    var result = 0

    for i in 0..<s.count {
        var left = i, right = i

        while left >= 0, right < s.count, s[left] == s[right] {
            left -= 1
            right += 1
            result += 1
        }

        left = i
        right = i + 1

        while left >= 0, right < s.count, s[left] == s[right] {
            left -= 1
            right += 1
            result += 1
        }
    }

    return result
}

print(countSubstrings("abc"))
print(countSubstrings("aaa"))