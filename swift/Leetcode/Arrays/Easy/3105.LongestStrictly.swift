// You are given an array of integers nums. Return the length of the longest
// subarray of nums which is either strictly increasing or strictly decreasing.

// Time: O(n), Space: O(1)
func longestMonotonicSubarray(_ nums: [Int]) -> Int {
    var result = 1
    var increasing = 1
    var decreasing = 1

    for i in 1..<nums.count {
        if nums[i] > nums[i - 1] {
            increasing += 1
        } else {
            increasing = 1
        }

        if nums[i] < nums[i - 1] {
            decreasing += 1
        } else {
            decreasing = 1
        }

        result = max(result, increasing, decreasing)
    }

    return result
}

print(longestMonotonicSubarray([1,4,3,3,2]))
print(longestMonotonicSubarray([3,3,3,3]))
print(longestMonotonicSubarray([3,2,1]))