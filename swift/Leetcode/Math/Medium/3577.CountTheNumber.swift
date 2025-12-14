class Solution {
    func countPermutations(_ complexity: [Int]) -> Int {
        let n = complexity.count
        for i in 1..<n {
            if complexity[i] <= complexity[0] {
                return 0
            }
        }

        var ans = 1
        let mod = 1_000_000_007
        for i in 2..<n {
            ans = (ans * i) % mod
        }
        return ans
    }
}