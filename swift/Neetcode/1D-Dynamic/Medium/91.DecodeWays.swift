// Given a string s containing only digits, return the number of ways to decode it.

func numDecodings(_ s: String) -> Int {
    var s = Array(s)
    var tab = [s.count: 1]

    for i in stride(from: s.count - 1, to: -1, by: -1) {
        if s[i] == "0" {
            tab[i] = 0
        } else {
            tab[i] = tab[i + 1] ?? 0
        }

        if i + 1 < s.count, (s[i] == "1" || (s[i] == "2" && s[i + 1] >= "0" && s[i + 1] <= "6")) {
            tab[i, default: 0] += tab[i + 2] ?? 0
        }
    }

    return tab[0, default: 0]
}

print(numDecodings("12"))
print(numDecodings("226"))
print(numDecodings("06"))