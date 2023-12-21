// Given a collection of numbers, nums, that might contain duplicates, 
// return all possible unique permutations in any order.

// Time: n!, Space: n * n!
func permuteUnique(_ nums: [Int]) -> [[Int]] {
    var nums = nums.sorted { $0 < $1 }
    var result = [[Int]]()

    func backtrack(_ nums: [Int], _ current: [Int]) {
        if nums.count == 0 { 
            result.append(current)
            return
        }

        for (i, number) in nums.enumerated() {
            if i > 0, number == nums[i - 1] { continue }

            var newNums = nums
            newNums.remove(at: i)
            backtrack(newNums, current + [number])
        }
    }

    backtrack(nums, [])
    return result
}