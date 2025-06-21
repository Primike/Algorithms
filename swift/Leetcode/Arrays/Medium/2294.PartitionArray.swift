// You are given an integer array nums and an integer k. 
// You may partition nums into one or more subsequences such that 
// each element in nums appears in exactly one of the subsequences.
// Return the minimum number of subsequences needed such that 
// the difference between the maximum and minimum values 
// in each subsequence is at most k.

// Time: O(n * log(n)), Space: O(n)
func partitionArray(_ nums: [Int], _ k: Int) -> Int {
    let nums = Array(Set(nums)).sorted()
    var result = 0
    var index = 0

    while index < nums.count {
        var left = index, right = nums.count - 1

        while left < right {
            let mid = (right + left) / 2

            if nums[mid] - k > nums[index] {
                right = mid
            } else {
                left = mid + 1
            }
        }

        if nums[left] - k > nums[index] { left -= 1 }

        result += 1
        index = left + 1
    }

    return result
}

print(partitionArray([3,6,1,2,5], 2))
print(partitionArray([1,2,3], 1))
print(partitionArray([2,2,4,5], 0))