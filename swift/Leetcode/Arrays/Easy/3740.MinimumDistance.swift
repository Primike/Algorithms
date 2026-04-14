class Solution {
    func minimumDistance(_ nums: [Int]) -> Int {
        let n = nums.count
        guard n >= 3 else { return -1 }
        
        var ans = n + 1

        for i in 0..<(n - 2) {
            for j in (i + 1)..<(n - 1) {
                if nums[i] != nums[j] {
                    continue
                }
                for k in (j + 1)..<n {
                    if nums[j] == nums[k] {
                        ans = min(ans, k - i)
                        break
                    }
                }
            }
        }

        return ans == n + 1 ? -1 : ans * 2
    }
}