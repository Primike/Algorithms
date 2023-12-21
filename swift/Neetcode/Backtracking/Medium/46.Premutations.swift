// Given an array nums of distinct integers, return all the possible 
// permutations. You can return the answer in any order.

func permute(_ nums: [Int]) -> [[Int]] {
    var nums = nums
    var result = [[Int]]()

    func backtrack(_ left: Int) {
        if left == nums.count {
            result.append(nums)
            return
        }

        for i in left..<nums.count {
            nums.swapAt(i, left)
            backtrack(left + 1)
            nums.swapAt(i, left)  
        }
    }

    backtrack(0)
    return result
}

print(premutate([1,2,3]))
print(premutate([0,1]))
print(premutate([1]))


func permute2(_ nums: [Int]) -> [[Int]] {
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