// Given an array nums of distinct integers, return all the possible 
// permutations. You can return the answer in any order.

// Time: O(n * n!), Space: O(n)
func permute(_ nums: [Int]) -> [[Int]] {
    var nums = nums
    var result = [[Int]]()

    func backtrack(_ index: Int) {
        if index == nums.count {
            result.append(nums)
            return
        }

        for i in index..<nums.count {
            nums.swapAt(i, index)
            backtrack(index + 1)
            nums.swapAt(i, index)  
        }
    }

    backtrack(0)
    return result
}

print(premutate([1,2,3]))
print(premutate([0,1]))
print(premutate([1]))


func permute(_ nums: [Int]) -> [[Int]] {
    var result = [[Int]]()

    func backtrack(_ numbers: [Int], _ permutation: [Int]) {
        if permutation.count == nums.count { 
            result.append(permutation)
            return 
        }

        for i in 0..<numbers.count {
            let newNums = Array(numbers[(i + 1)...] + numbers[..<i])
            backtrack(newNums, permutation + [numbers[i]])
        }
    }

    backtrack(nums, [])
    return result
}