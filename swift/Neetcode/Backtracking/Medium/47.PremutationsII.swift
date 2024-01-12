// Given a collection of numbers, nums, that might contain duplicates, 
// return all possible unique permutations in any order.

// Time: O(n!), Space: O(n * n!)
func permuteUnique(_ nums: [Int]) -> [[Int]] {
    let nums = nums.sorted()
    var result = [[Int]]()

    func backtrack(_ numbers: [Int], _ permutation: [Int]) {
        if permutation.count == nums.count { 
            result.append(permutation)
            return 
        }

        for i in 0..<numbers.count {
            if i > 0, numbers[i] == numbers[i - 1] { continue }

            let newNums = Array(numbers[..<i] + numbers[(i + 1)...])
            backtrack(newNums, permutation + [numbers[i]])
        }
    }

    backtrack(nums, [])
    return result
}