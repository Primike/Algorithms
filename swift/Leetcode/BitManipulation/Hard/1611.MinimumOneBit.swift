class Solution {
    func minimumOneBitOperations(_ n: Int) -> Int {
        var ans = n
        ans ^= ans >> 16
        ans ^= ans >> 8
        ans ^= ans >> 4
        ans ^= ans >> 2
        ans ^= ans >> 1
        return ans
    }
}