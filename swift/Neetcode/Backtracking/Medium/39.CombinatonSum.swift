// Given an array of distinct integers candidates and a target integer target, 
// return a list of all unique combinations of candidates where the 
// chosen numbers sum to target. You may return the combinations in any order.

// Time: O(n^m), Space: O(n * m)
func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
    var result = [[Int]]()

    func backtrack(_ index: Int, _ combination: [Int], _ target: Int) {
        if target < 0 { return }
        if target == 0 {
            result.append(combination)
            return
        }

        for i in index..<candidates.count {
            backtrack(i, combination + [candidates[i]], target - candidates[i])
        }
    }

    backtrack(0, [], target)
    return result
}

print(combinationSum([2,3,6,7], 7))
print(combinationSum([2,3,5], 8))