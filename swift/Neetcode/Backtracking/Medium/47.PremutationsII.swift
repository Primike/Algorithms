// Given a collection of numbers, nums, that might contain duplicates, 
// return all possible unique permutations in any order.

func permuteUnique(_ nums: [Int]) -> [[Int]] {
    var nums = nums.sorted()
    var result = [[Int]]()

    func backtrack(_ left: Int) {
        if left == nums.count {
            result.append(nums)
            return
        }

        var seen = Set<Int>()
        
        for i in left..<nums.count {
            if seen.contains(nums[i]) { continue }
            seen.insert(nums[i])

            nums.swapAt(i, left)
            backtrack(left + 1)
            nums.swapAt(i, left)
        }
    }

    backtrack(0)
    return result
}