// An attendance record for a student can be represented as a string 
// where each character signifies whether the student was 
// absent, late, or present on that day. 
// Any student is eligible for an attendance award 
// if they meet both of the following criteria:
// The student was absent ('A') for strictly fewer than 2 days total.
// The student was never late ('L') for 3 or more consecutive days.
// Given an integer n, return the number of possible attendance records 
// of length n that make a student eligible for an attendance award.

// Time: O(n), Space: O(n)
func checkRecord(_ n: Int) -> Int {
    let mod = 1_000_000_007
    var tab = Array(repeating: Array(repeating: Array(repeating: 0, count: 3), count: 2), count: n + 1)
    tab[0][0][0] = 1

    for i in 0..<n {
        for a in 0...1 {
            for l in 0...2 {
                tab[i + 1][a][0] += tab[i][a][l]

                if a < 1 { tab[i + 1][a + 1][0] += tab[i][a][l] }
                if l < 2 { tab[i + 1][a][l + 1] += tab[i][a][l] }

                tab[i + 1][a][0] = tab[i + 1][a][0] % mod
            }
        }
    }

    var result = 0

    for a in 0...1 {
        for l in 0...2 {
            result = (result + tab[n][a][l]) % mod
        }
    }

    return result
}

print(checkRecord(2))
print(checkRecord(1))
print(checkRecord(10101))


// TLE
func checkRecord2(_ n: Int) -> Int {
    let mod = 1_000_000_007
    var memo = [[Int]: Int]()

    func dp(_ days: Int, _ absent: Int, _ late: Int) -> Int {
        let key = [days, absent, late]

        if days == n { return 1 }
        if let value = memo[key] { return value }

        var result = dp(days + 1, absent, 0) % mod
        if absent == 0 { result += (dp(days + 1, absent + 1, 0) % mod) }
        if late < 2 { result += (dp(days + 1, absent, late + 1) % mod) }

        result %= mod
        memo[key] = result
        return result
    }

    return dp(0, 0, 0)
}