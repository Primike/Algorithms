class Solution {
    func minMirrorPairDistance(_ nums: [Int]) -> Int {
        var prev = [Int: Int]()
        var ans = Int.max
        
        for (i, num) in nums.enumerated() {
            if let lastIndex = prev[num] {
                ans = min(ans, i - lastIndex)
            }
            
            let reversedNum = Int(String(String(num).reversed())) ?? 0
            prev[reversedNum] = i
        }
        
        return ans == Int.max ? -1 : ans
    }
}