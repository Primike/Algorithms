class Solution {
    func uniqueXorTriplets(_ nums: [Int]) -> Int {
        let n = nums.count
        if n <= 2 {
            return n
        }
        var ans = 1
        while ans <= n {
            ans <<= 1
        }
        return ans
    }
}