// Given an integer array nums of unique elements, 
// return all possible subsets(the power set).
// The solution set must not contain duplicate subsets. 
// Return the solution in any order.

// O(n*2^n), O(n)
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