class Solution {
    func countPrimeSetBits(_ L: Int, _ R: Int) -> Int {
        var ans = 0
        for x in L...R {
            if isSmallPrime(x.nonzeroBitCount) {
                ans += 1
            }
        }
        return ans
    }

    private func isSmallPrime(_ x: Int) -> Bool {
        return x == 2 || x == 3 || x == 5 || x == 7 ||
               x == 11 || x == 13 || x == 17 || x == 19
    }
}