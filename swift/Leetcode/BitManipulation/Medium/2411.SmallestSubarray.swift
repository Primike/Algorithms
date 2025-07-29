class Solution {
    func smallestSubarrays(_ nums: [Int]) -> [Int] {
        let n = nums.count
        var pos = [Int](repeating: -1, count: 31)
        var ans = [Int](repeating: 0, count: n)
        
        for i in (0..<n).reversed() {
            var j = i
            for bit in 0..<31 {
                if (nums[i] & (1 << bit)) == 0 {
                    if pos[bit] != -1 {
                        j = max(j, pos[bit])
                    }
                } else {
                    pos[bit] = i
                }
            }
            ans[i] = j - i + 1
        }
        
        return ans
    }
}