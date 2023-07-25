// Given an array nums of distinct integers, return all the possible 
// permutations. You can return the answer in any order.

func permute(_ nums: [Int]) -> [[Int]] {
    var result = [[Int]]()

    func backtrack(_ nums: [Int], _ permutation: [Int]) {
        if nums.count == 0 {
            result.append(permutation)
            return
        }

        for i in 0..<nums.count {
            var newNums = nums
            let number = newNums.remove(at: i)
            backtrack(newNums, permutation + [number])
        }
    }

    backtrack(nums, [])
    return result
}

print(premutate([1,2,3]))
print(premutate([0,1]))
print(premutate([1]))