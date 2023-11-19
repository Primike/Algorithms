//Given an integer array nums sorted in non-decreasing order, 
//remove some duplicates in-place such that each unique element appears at most twice.
//The relative order of the elements should be kept the same.

func removeDuplicates(_ nums: inout [Int]) -> Int {
    var left = 0, right = 0

    while right < nums.count {
        var count = 1

        while right < nums.count - 1, nums[right] == nums[right + 1] {
            right += 1
            count += 1
        }

        for _ in 0..<min(2, count) {
            nums[left] = nums[right]
            left += 1
        }

        right += 1
    }

    return left
}

print(removeDuplicates([1,1,1,2,2,3]))
print(removeDuplicates([0,0,1,1,1,1,2,3,3]))