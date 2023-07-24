// Given an integer array nums of unique elements, 
// return all possible subsets(the power set).
// The solution set must not contain duplicate subsets. 
// Return the solution in any order.

func subsets(_ nums: [Int]) -> [[Int]] {
    var result = [[Int]]()

    func backtrack(_ index: Int, _ array: [Int]) {
        result.append(array)

        for i in index..<nums.count {
            var newArray = array
            newArray.append(nums[i])

            backtrack(i + 1, newArray)
        }
    }

    backtrack(0, [Int]())
    return result
}

print(subsets([1,2,3]))
print(subsets([0]))
