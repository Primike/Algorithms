//fix
func canPartitionKSubsets(_ nums: [Int], _ k: Int) -> Bool {
    if nums.reduce(0, +) % k != 0 { return false }

    let target = nums.reduce(0, +) / k
    var visited = Array(repeating: false, count: nums.count)

    func backtrack(_ k: Int, _ index: Int, _ currentSum: Int) -> Bool {
        if k == 1 { return true }
        
        if currentSum == target { return backtrack(k - 1, 0, 0) }

        for i in index..<nums.count {
            if visited[i] { continue }
            
            visited[i] = true
            if backtrack(k, i + 1, currentSum + nums[i]) { return true }
            visited[i] = false
        }

        return false
    }

    return backtrack(k, 0, 0)
}