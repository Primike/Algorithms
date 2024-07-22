// For an integer array nums, an inverse pair is a pair of integers [i, j] 
// where 0 <= i < j < nums.length and nums[i] > nums[j].
// Given two integers n and k, return the number of different 
// arrays consisting of numbers from 1 to n such that there are 
// exactly k inverse pairs. Since the answer can be huge, return it modulo 109 + 7.

// Time: O(n * k * min(n, k)), Space: O(n * k)
// k at 0 will be filled in by j loop
func kInversePairs(_ n: Int, _ k: Int) -> Int {
    let mod = 1_000_000_007
    var tab = Array(repeating: Array(repeating: 0, count: k + 1), count: n + 1)
    tab[0][0] = 1

    for i in 1...n {
        for j in 0...k {
            var value = 0

            for k in 0...min(i - 1, j) {
                value = (value + tab[i - 1][j - k]) % mod
            }

            tab[i][j] = value
        }
    }

    return tab[n][k]
}

print(kInversePairs(3, 0))
print(kInversePairs(3, 1))


// TLE
func kInversePairs2(_ n: Int, _ k: Int) -> Int {
    let mod = 1_000_000_007
    var memo = [String: Int]()

    func dp(_ n: Int, _ k: Int) -> Int {
        let key = "\(n),\(k)"

        if n == 0 { return 0 }
        if k == 0 { return 1 }
        if let value = memo[key] { return value }

        var result = 0

        for i in 0...min(k, n - 1) {
            result = (result + dp(n - 1, k - i)) % mod
        }

        memo[key] = result
        return result
    }

    return dp(n, k)
}