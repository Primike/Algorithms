// Given an array of integers nums, find the next permutation of nums.

// Time: O(n), Space: O(1)
func nextPermutation(_ nums: inout [Int]) {
    if nums.count <= 1 { return }

    var i = nums.count - 2

    while i >= 0, nums[i] >= nums[i + 1] {
        i -= 1
    }

    if i >= 0 {
        var j = nums.count - 1

        while nums[j] <= nums[i] {
            j -= 1
        }
        
        nums.swapAt(i, j)
    }

    var left = i + 1
    var right = nums.count - 1

    while left < right {
        nums.swapAt(left, right)
        left += 1
        right -= 1
    }
}

print(nextPermutation([1,2,3]))
print(nextPermutation([3,2,1]))
print(nextPermutation([1,1,5]))