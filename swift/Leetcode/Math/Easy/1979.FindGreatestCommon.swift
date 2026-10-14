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

    func findGCD(_ nums: [Int]) -> Int {
        guard let mx = nums.max(), let mn = nums.min() else {
            return 0
        }
        return gcd(mx, mn)
    }
}