// Given an integer array nums that may contain duplicates, 
// return all possible subsets (the power set).
// The solution set must not contain duplicate subsets. 
// Return the solution in any order.

func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
    var nums = nums.sorted()
    var result = [[Int]]()

    func backtrack(_ index: Int, _ subset: [Int]) {
        result.append(subset)

        for i in index..<nums.count {
            if i > index, nums[i] == nums[i - 1] {
                continue
            }

            backtrack(i + 1, subset + [nums[i]])
        }
    }

    backtrack(0, [])
    return result
}

print(subsetsWithDup([1,2,2]))
print(subsetsWithDup([0]))