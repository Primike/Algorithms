class Solution {
    func minimumDistance(_ nums: [Int]) -> Int {
        let n = nums.count
        var nxt = Array(repeating: -1, count: n)
        var occur = [Int: Int]()
        var ans = n + 1

        for i in stride(from: n - 1, through: 0, by: -1) {
            if let nextIndex = occur[nums[i]] {
                nxt[i] = nextIndex
            }
            occur[nums[i]] = i
        }

        for i in 0..<n {
            let secondPos = nxt[i]
            if secondPos != -1 {
                let thirdPos = nxt[secondPos]
                if thirdPos != -1 {
                    ans = min(ans, thirdPos - i)
                }
            }
        }

        return ans == n + 1 ? -1 : ans * 2
    }
}