class Solution {
    func maximumLength(_ nums: [Int]) -> Int {
        var res = 0
        let patterns = [[0, 0], [0, 1], [1, 0], [1, 1]]
        
        for pattern in patterns {
            var cnt = 0
            for num in nums {
                if num % 2 == pattern[cnt % 2] {
                    cnt += 1
                }
            }
            res = max(res, cnt)
        }
        
        return res
    }
}