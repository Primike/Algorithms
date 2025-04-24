class Solution {

    private static let MOD = 1_000_000_007
    private static let MAX_N_CONST = 10_000 + 10
    private static let MAX_P = 15

    private static let sieve: [Int] = {
        var tempSieve = [Int](repeating: 0, count: MAX_N_CONST)
        tempSieve[0] = -1
        tempSieve[1] = -1

        for i in 2..<MAX_N_CONST {
            if tempSieve[i] == 0 {
                for j in stride(from: i, to: MAX_N_CONST, by: i) {
                    tempSieve[j] = i
                }
            }
        }
        return tempSieve
    }()

    private static let ps: [[Int]] = {
        var tempPs = [[Int]](repeating: [], count: MAX_N_CONST)
        let localSieve = Solution.sieve
        for i in 2..<MAX_N_CONST {
            var x = i
            while x > 1 {
                guard x >= 0 && x < localSieve.count else { break }
                let p = localSieve[x]

                if p <= 0 {
                    break
                }

                var cnt = 0
                while x > 0 && x % p == 0 {
                    x /= p
                    cnt += 1
                }
                if cnt > 0 {
                    tempPs[i].append(cnt)
                }
                guard x < localSieve.count else { break }
                if localSieve[x] == p && cnt == 0 && x != i {
                    break
                }
            }
        }
        return tempPs
    }()

    private static let c: [[Int]] = {
        let numRows = Solution.MAX_N_CONST + Solution.MAX_P
        let numCols = Solution.MAX_P + 1
        var tempC = [[Int]](repeating: [Int](repeating: 0, count: numCols), count: numRows)

        if numRows > 0 && numCols > 0 {
            tempC[0][0] = 1
        }

        for i in 1..<numRows {
            tempC[i][0] = 1
            for j in 1...min(i, Solution.MAX_P) {
                let term1 = tempC[i - 1][j]
                let term2 = tempC[i - 1][j - 1]
                tempC[i][j] = (term1 + term2) % Solution.MOD
            }
        }
        return tempC
    }()

    func idealArrays(_ n: Int, _ maxValue: Int) -> Int {
        var ans = 0
        for x in 1...maxValue {
            var mul: Int = 1
            guard x >= 0 && x < Solution.ps.count else { continue }

            for pExponent in Solution.ps[x] {
                let row = n + pExponent - 1
                let col = pExponent

                guard row >= 0 && row < Solution.c.count && col >= 0 && col < Solution.c[row].count else {
                    return 0
                }

                let combValue = Solution.c[row][col]
                mul = (mul * combValue) % Solution.MOD
            }
            ans = (ans + mul) % Solution.MOD
        }
        return ans
    }
}