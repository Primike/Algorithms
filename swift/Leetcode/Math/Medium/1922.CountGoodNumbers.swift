class Solution {
    func countGoodNumbers(_ n: Int) -> Int {
        let mod = 1_000_000_007

        func quickmul(_ x: Int, _ y: Int) -> Int {
            var ret = 1
            var mul = x
            var power = y
            while power > 0 {
                if power % 2 == 1 {
                    ret = (ret * mul) % mod
                }
                mul = (mul * mul) % mod
                power /= 2
            }
            return ret
        }

        let evenCount = (n + 1) / 2
        let oddCount = n / 2

        let evenPossibilities = quickmul(5, evenCount)
        let oddPossibilities = quickmul(4, oddCount)

        let result = (evenPossibilities * oddPossibilities) % mod

        return result
    }
}