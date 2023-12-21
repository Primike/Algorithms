// Given an integer array nums and an integer k, return true if it is possible 
// to divide this array into k non-empty subsets whose sums are all equal.

func canPartitionKSubsets(_ nums: [Int], _ k: Int) -> Bool {
    let total = nums.reduce(0, +)
    let target = total / k

    if total % k != 0 || nums.max()! > target { return false }
    
    let nums = nums.sorted { $0 > $1 }
    var visited = Set<String>()

    func backtrack(_ index: Int, _ subsets: [Int]) -> Bool {
        if index == nums.count { return subsets[subsets.count - 1] == target }
        
        let string = subsets.map { String($0) }.joined(separator: ",")
        if visited.contains(string) { return false }
        visited.insert(string)

        for i in 0..<k {
            if subsets[i] + nums[index] <= target {
                var newSubsets = subsets
                newSubsets[i] += nums[index]
                if backtrack(index + 1, newSubsets) { return true }
            }

            if subsets[i] == 0 { break }
        }

        return false
    }

    return backtrack(0, Array(repeating: 0, count: k))
}

print(canPartitionKSubsets([4,3,2,3,5,2,1], 4))
print(canPartitionKSubsets([1,2,3,4], 3))