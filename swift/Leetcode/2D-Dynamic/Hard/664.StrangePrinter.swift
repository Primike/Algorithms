// There is a strange printer with the following two special properties:
// The printer can only print a sequence of the same character each time.
// At each turn, the printer can print new characters starting from 
// and ending at any place and will cover the original existing characters.
// Given a string s, return the minimum number of turns 
// the printer needed to print it.

func strangePrinter(_ s: String) -> Int {
    let s = Array(s)
    var dp = Array(repeating: Array(repeating: 0, count: s.count), count: s.count)

    for i in (0..<s.count).reversed() {
        dp[i][i] = 1

        for j in (i + 1)..<s.count {
            dp[i][j] = dp[i][j - 1] + 1

            for k in i..<j {
                if s[k] != s[j] { continue }
                dp[i][j] = min(dp[i][j], dp[i][k] + dp[k + 1][j - 1])
            }
        }
    }
    
    return dp[0][s.count - 1]       
}

print(strangePrinter("aaabbb"))
print(strangePrinter("aba"))