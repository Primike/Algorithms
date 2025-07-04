// You are given a 0-indexed string s consisting of only 
// lowercase English letters. Return the number of substrings 
// in s that begin and end with the same character.

// Time: O(n), Space: O(26)
func numberOfSubstrings(_ s: String) -> Int {
    var dict = [Character: Int]()
    var result = 0

    for letter in s {
        result += dict[letter, default: 0]
        dict[letter, default: 0] += 1
    }

    return result + s.count
}

print(numberOfSubstrings("abcba"))
print(numberOfSubstrings("abacad"))
print(numberOfSubstrings("a"))


func numberOfSubstrings2(_ s: String) -> Int {
    let dict = s.reduce(into: [:]) { $0[$1, default: 0] += 1 }
    var result = 0

    for (_, value) in dict {
        result += (value * (value - 1) / 2)
        result += value
    }

    return result
}