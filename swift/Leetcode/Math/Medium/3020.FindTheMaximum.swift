class Solution {
    func maximumLength(_ nums: [Int]) -> Int {
        var cnt = [Int: Int]()
        for num in nums {
            cnt[num, default: 0] += 1
        }
        
        let oneCnt = cnt[1, default: 0]
        var ans = oneCnt % 2 != 0 ? oneCnt : max(1, oneCnt - 1)
        
        cnt.removeValue(forKey: 1)
        
        for num in cnt.keys {
            var res = 0
            var x = num
            
            while let count = cnt[x], count > 1 {
                res += 2
                x *= x
            }
            
            ans = max(ans, res + (cnt[x] != nil ? 1 : -1))
        }
        
        return ans
    }
}