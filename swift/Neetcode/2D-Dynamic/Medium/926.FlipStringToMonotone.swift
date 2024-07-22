// A binary string is monotone increasing if it consists of some number of 0's 
// (possibly none), followed by some number of 1's (also possibly none).
// You are given a binary string s. You can flip s[i] changing it 
// from 0 to 1 or from 1 to 0.
// Return the minimum number of flips to make s monotone increasing.

func minFlipsMonoIncr(_ s: String) -> Int {
    let s = Array(s)
    var tab = Array(repeating: Array(repeating: 0, count: 2), count: s.count + 1)

    for i in 1...s.count {
        let isOne = s[i - 1] == "1" ? 1 : 0

        tab[i][0] = tab[i - 1][0] + isOne
        tab[i][1] = min(tab[i - 1][0], tab[i - 1][1]) + (1 - isOne)
    }

    return min(tab[s.count][0], tab[s.count][1])
}

print(minFlipsMonoIncr("00110"))
print(minFlipsMonoIncr("010110"))
print(minFlipsMonoIncr("00011000"))


func minFlipsMonoIncr2(_ s: String) -> Int {
    var ones = 0, result = 0

    for number in s {
        if number == "1" {
            ones += 1
        } else {
            result = min(result + 1, ones)
        }
    }

    return result
}

func minFlipsMonoIncr3(_ s: String) -> Int {
    let s = Array(s)
    var memo = [String: Int]()

    func dp(_ i: Int, _ zeros: Bool) -> Int {
        let key = "\(i),\(zeros)"

        if i == s.count { return 0 }
        if let value = memo[key] { return value }

        var result = Int.max

        if zeros {
            result = min(result, dp(i + 1, true) + (s[i] == "0" ? 0 : 1))
            result = min(result, dp(i + 1, false) + (s[i] == "1" ? 0 : 1))
        } else {
            result = min(result, dp(i + 1, false) + (s[i] == "1" ? 0 : 1))
        }

        memo[key] = result
        return result
    }

    return dp(0, true)
}