// Given a collection of candidate numbers (candidates) and a target number 
// (target), find all unique combinations in candidates where 
// the candidate numbers sum to target.
// Each number in candidates may only be used once in the combination.

func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
    var nums = candidates.sorted()
    var result = [[Int]]()

    func backtrack(_ index: Int, _ combination: [Int], _ target: Int) {
        if target == 0 {
            result.append(combination)
            return
        }
        if target < 0 { return }

        for i in index..<nums.count {
            if i > index, nums[i] == nums[i - 1] {
                continue
            }

            backtrack(i + 1, combination + [nums[i]], target - nums[i])
        }
    }

    backtrack(0, [], target)
    return result
}

print(combinationSum2([10,1,2,7,6,1,5], 8))
print(combinationSum2([2,5,2,1,2], 5))