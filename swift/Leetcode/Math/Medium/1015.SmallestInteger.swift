class Solution {
    func smallestRepunitDivByK(_ k: Int) -> Int {
        var remainder = 0
        for length_N in 1...k {
            remainder = (remainder * 10 + 1) % k
            if remainder == 0 {
                return length_N
            }
        }
        return -1
    }
}