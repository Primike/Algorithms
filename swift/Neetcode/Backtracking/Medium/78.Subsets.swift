// Given an integer array nums of unique elements, 
// return all possible subsets(the power set).
// The solution set must not contain duplicate subsets. 
// Return the solution in any order.

// Time: O(2^n), Space: O(2^n)
func subsets(_ nums: [Int]) -> [[Int]] {
    var result = [[Int]]()

    func backtrack(_ index: Int, _ subset: [Int]) {
        result.append(subset)

        for i in index..<nums.count {
            backtrack(i + 1, subset + [nums[i]])
        }
    }

    backtrack(0, [])
    return result
}

print(subsets([1,2,3]))
print(subsets([0]))

func subsets2(_ nums: [Int]) -> [[Int]] {
    var result = [[Int]]()

    func backtrack(_ i: Int, _ subset: [Int]) {
        if i == nums.count { 
            result.append(subset) 
            return
        }

        backtrack(i + 1, subset)
        backtrack(i + 1, subset + [nums[i]])
    }

    backtrack(0, [])
    return result
}