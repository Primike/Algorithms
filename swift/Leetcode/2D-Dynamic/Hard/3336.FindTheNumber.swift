class Solution {
    private func gcd(_ a: Int, _ b: Int) -> Int {
        var a = a
        var b = b
        while b != 0 {
            let t = a % b
            a = b
            b = t
        }
        return a
    }

    func subsequencePairCount(_ nums: [Int]) -> Int {
        let mod = 1_000_000_007
        guard let maxNum = nums.max() else { return 0 }
        
        var dp = Array(repeating: Array(repeating: 0, count: maxNum + 1), count: maxNum + 1)
        dp[0][0] = 1

        for num in nums {
            var ndp = Array(repeating: Array(repeating: 0, count: maxNum + 1), count: maxNum + 1)

            for j in 0...maxNum {
                let divisor1 = gcd(j, num)
                for k in 0...maxNum {
                    let val = dp[j][k]
                    if val == 0 { continue }

                    let divisor2 = gcd(k, num)
                    ndp[j][k] = (ndp[j][k] + val) % mod
                    ndp[divisor1][k] = (ndp[divisor1][k] + val) % mod
                    ndp[j][divisor2] = (ndp[j][divisor2] + val) % mod
                }
            }
            dp = ndp
        }

        var ans = 0
        for j in 1...maxNum {
            ans = (ans + dp[j][j]) % mod
        }

        return ans
    }
}