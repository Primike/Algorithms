class Solution {
    func findSmallestInteger(_ nums: [Int], _ value: Int) -> Int {
        var mp = [Int: Int]()
        for x in nums {
            let remainder = (x % value + value) % value
            mp[remainder, default: 0] += 1
        }
        
        var mex = 0
        while mp[mex % value, default: 0] > 0 {
            let remainder = mex % value
            mp[remainder]! -= 1
            mex += 1
        }
        
        return mex
    }
}