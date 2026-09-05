class Solution {
    private func gcd(_ x: Int, _ y: Int) -> Int {
        return y == 0 ? x : gcd(y, x % y)
    }

    func gcdOfOddEvenSums(_ n: Int) -> Int {
        return gcd(n * n, n * (n + 1))
    }
}